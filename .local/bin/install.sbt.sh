#!/usr/bin/env bash

MODULE_HOME=`pwd`
PRJ_HOME=`dirname $MODULE_HOME`
INST_PARENT_DIR="$HOME/Usr/opt"
LOG="/tmp/install.sbt.log"

# Script file name
SCRIPT_NAME=`basename $0`

. `dirname $0`/poor.mans.logger.sh

if [ -d "/tmp" -a -w "/tmp" -a -r "/tmp" ]; then
    echo "" > $LOG
else
    echo "[ ERROR ] Cannot write installation log to '$LOG'"
    exit 1
fi

if [ ! -d "$MODULE_HOME" ]; then
    log_error "Cannot find '$MODULE_HOME' directory, make sure that you are in the correct path."
    exit 1
fi


if [ "$1" == "clean" ]; then
  log_warn "Cleaning any previously compiled files."
  cd $MODULE_HOME
  sbt clean 2>&1 1>> $LOG
  cd ..
fi

# Gather information
prj_name=`/opt/local/bin/grep -hR "name[ ][ ]*:=[ ][ ]*" "$MODULE_HOME/project" | sed 's/name[ ][ ]*:=[ ][ ]*\"\(.*\)\"/\1/g' | sed 's/,*\r*$//' | sed 's/^[ \t]*//'`
version=`/opt/local/bin/grep "^version[ ][ ]*in[ ][ ]*ThisBuild[ ][ ]*:=[ ][ ]*" "$MODULE_HOME/version.sbt" | sed 's/version[ ][ ]*in[ ][ ]*ThisBuild[ ][ ]*:=[ ][ ]*\"\(.*\)\"/\1/g'`

zippedDistFile="$MODULE_HOME/target/universal/$prj_name-$version.zip"
target="$INST_PARENT_DIR/$prj_name-$version"

symName=`echo "$prj_name" | awk '{print tolower($0)}'`
symTarget="$INST_PARENT_DIR/$symName"

# Remove any previously created zipped universal distribution file
if [ -f "$zippedDistFile" ]; then
    log_warn "Removing the previously created univeral distribution file '$zippedDistFile'"
    rm $zippedDistFile
fi

# Build LoMRF distribution
log_info "Attempting to build a universal distribution for module in '$MODULE_HOME'"
cd $MODULE_HOME
sbt dist 2>&1 1>> $LOG
cd ..

if [ -f "$zippedDistFile" ]; then
	if [ -d "$target" ]; then
		log_warn "Removing old installation in '$target'"
		rm -rf $target 2>&1 1>> $LOG
	    if [ $? -ne 0 ]; then
            exit_error "Unexpected error occured when removing the previous installation in '$target'" 2
        fi
	fi
	
    log_info "Proceeding to $prj_name installation in '$target'"
    unzip "$zippedDistFile" -d "$INST_PARENT_DIR" 2>&1 1>> $LOG
    if [ $? -ne 0 ]; then
        exit_error "Unexpected error occured when unziping '$zippedDistFile' in '$INST_PARENT_DIR'" 2
    fi
    log_info "Creating the symbolic link '$symTarget' that is pointing to '$target'"
    
    if [ -L "$symTarget" ]; then
        rm "$symTarget" 2>&1 1>> $LOG
		
    fi

	ln -s $target "$symTarget" 2>&1 1>> $LOG
    if [ $? -ne 0 ]; then
        exit_error "Unexpected error occured when creating the symbolic link '$symTarget'" 3
    fi

    # make sure that all utility shell scripts have executable attributes
    for script in `find "$target/bin" -maxdepth 1 -type f`
    do 
	
        scriptName=`basename $script`
        if [ "$scriptName" != "inc.env.sh" ]; then
            chmod +x "$script"
        fi
    done
else
    exit_error "Cannot find the zipped univesal distribution of $prj_name '$zippedDistFile'." 3
fi

log_info "Installation of $prj_name is complete"

echo "--------------------------------------------------------------------------------"
echo "--- $prj_name is installed in \"$target\" with symbolic link \"$symTarget\""
echo "--------------------------------------------------------------------------------"
echo "" 
echo "In order to call $prj_name from command line, please extend the \$PATH enviroment"
echo "variable with the following path: \"$symTarget/bin\""
echo ""
echo "--------------------------------------------------------------------------------"

