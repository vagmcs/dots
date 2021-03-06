/*                                       _ _
 *  __ _ _ __ ___  _ __ ___   ___  _ __ (_) |_ ___
 * / _` | '_ ` _ \| '_ ` _ \ / _ \| '_ \| | __/ _ \
 *| (_| | | | | | | | | | | | (_) | | | | | ||  __/
 * \__,_|_| |_| |_|_| |_| |_|\___/|_| |_|_|\__\___|
 *
 */

// Scala Logging
import $ivy.{
	`ch.qos.logback:logback-classic:1.2.3`,
	`com.typesafe.scala-logging::scala-logging:3.9.2`
}

// Maths and Machine Learning
import $ivy.{
	`org.scalanlp::breeze:1.1`,
	`org.scalanlp::breeze-natives:1.1`,
	`com.github.haifengl::smile-scala:2.6.0`,
	`tech.tablesaw:tablesaw-core:0.38.1`,
	`com.spotify::featran-core:0.7.0`
}

// Files and Visuals
import $ivy.{
	`com.lihaoyi::pprint:0.6.0`,
	`com.lihaoyi::os-lib:0.7.1`,
	`com.lihaoyi::ammonite-ops:2.3.8`,
	`tech.tablesaw:tablesaw-jsplot:0.38.1`,
	`com.github.vagmcs::scalatikz:0.4.4`
}

// Common Imports
import java.io.{ File, PrintStream }
import scala.io.Source
import scala.util.Random
import scala.math

import com.typesafe.scalalogging.Logger
import Implicits._

// Functions

/**
  * Uses an object that can be closed (e.g. BufferedSource) and
  * applies a function to get a result. Finally it closes the source.
  *
  * @param closeable a closable instance
  * @param f a function
  * @tparam C type of the closable
  * @tparam R type of the return value
  * @return a result from the function
  */
def using[R, C <: { def close(): Unit }](closeable: C)(f: C => R): R =
  try { f(closeable) } finally { closeable.close() }


// Implicits and objects

object Implicits {

  implicit class RichLogger(val instance: Logger) extends AnyVal {

    def fatal(message: => String): Nothing = {
      instance.whenErrorEnabled {
        instance.error(message)
      }
      sys.exit(1)
    }

    final def fatal(message: => String, ex: => Throwable, exitCode: Int = 1): Nothing = {
      instance.whenErrorEnabled {
        instance.error(message)
      }
      sys.exit(exitCode)
    }
  }
}

object Time {

	val extractor = "([0-9]+)h ([0-9]+)m ([0-9]+)s ([0-9]+)ms".r

	/**
    * Converts the given milliseconds to hours.
    *
    * @param milliseconds the total time in milliseconds
    * @return the total time in hours
    */
	def msToHours(milliseconds: Long): Double = 
		milliseconds / 3600000.0

	/**
    * Converts the given milliseconds to minutes.
    *
    * @param milliseconds the total time in minutes
    * @return the total time in minutes
    */
	def msToMin(milliseconds: Long): Double = 
		milliseconds / 60000.0

	/**
    * Converts the given milliseconds to seconds.
    *
    * @param milliseconds the total time in seconds
    * @return the total time in seconds
    */
	def msToSec(milliseconds: Long): Double = 
		milliseconds / 1000.0

	/**
    * Converts the given text to milliseconds.
    *
    * @param time a string representing the total time
    * @return the total time in milliseconds
    */
	def msFromText(time: String): Long = {
	  val extractor(hours, min, sec, ms) = time
	  hours.toLong * 3600000 + min.toLong * 60000 + sec.toLong * 1000 + ms.toLong
	}

  /**
    * Calculates the actual time in hours, minutes, seconds and milliseconds
    * given the total time in milliseconds.
    *
    * @param milliseconds the total time in milliseconds
    * @return the converted time
    */
  def msToText(milliseconds: Long): String = {
    val time = milliseconds / 1000
    val seconds = time % 60
    val minutes = (time % 3600) / 60
    val hours = time / 3600

    hours + "h " + minutes + "m " + seconds + "s " + (milliseconds % 1000) + "ms"
  }

  /**
    * Calculates the actual time in hours, minutes, seconds and milliseconds until now
    * given a starting time in milliseconds and concatenates it along a given message.
    *
    * @param msg the message to be displayed along the actual time
    * @param fromTime the starting time in milliseconds
    * @return the converted time until now along with the given message
    */
  def msToTextUntilNow(msg: String, fromTime: Long): String =
    msg + " = " + msToText(System.currentTimeMillis - fromTime)

  /**
    * Calculates the actual time in hours, minutes, seconds and milliseconds until now
    * given a starting time in milliseconds
    *
    * @param fromTime the starting time in milliseconds
    * @return the converted time until now
    */
  def msToTextUntilNow(fromTime: Long): String =
    msToText(System.currentTimeMillis - fromTime)

  /**
    * Measures the time spend in a function call.
    *
    * @param body a function representing the execution of code to be measured
    * @tparam T the type of the result when executing
    * @return a tuple holding the total execution time and the result
    */
  def measureTime[T](body: => T): (Long, T) = {
    val begin = System.currentTimeMillis
    val result = body
    (System.currentTimeMillis - begin, result)
  }
}
