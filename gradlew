#!/bin/sh

# Copyright 2015 the original author or authors.
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      https://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

##############################################################################
##
##   Gradle start up script for UN*X
##
##############################################################################

# Attempt to set APP_HOME
# Resolve links: $0 may be a link
PRG="$0"
# Need this for relative symlinks.
while [ -h "$PRG" ] ; do
    ls=`ls -ld "$PRG"`
    link=`expr "$ls" : '.*-> \\(.*\\)$'`
    if expr "$link" : '/.*' > /dev/null; then
        PRG="$link"
    else
        PRG=`dirname "$PRG"`/"$link"
    fi
done
SAVED="$PRG"
APP_HOME=`dirname "$PRG"`

APP_NAME="Gradle"
APP_BASE_NAME=`basename "$0"`

cygwin=false
msys=false
darwin=false
nonstop=false
case "`uname`" in
  CYGWIN* )
    cygwin=true
    ;;
  Darwin* )
    darwin=true
    ;;
  MINGW* )
    msys=true
    ;;
esac

# Use the maximum available, or set MAX_FD != -1 to use that value.
MAX_FD="maximum"

warn () {
    echo "$*"
}

die () {
    echo "$*" >&2
    echo "To see the full stack trace of the errors, re-run Gradle with the --stacktrace option."
    exit 1
}

# OS specific support (must be 'true' or 'false').
cygwin=false
msys=false
darwin=false
nonstop=false
case "`uname`" in
  CYGWIN* )
    cygwin=true
    ;;
  Darwin* )
    darwin=true
    ;;
  MINGW* )
    msys=true
    ;;
esac

CLASSPATH=$APP_HOME/gradle/wrapper/gradle-wrapper.jar

# Determine the Java command to use to start Gradle.
if [ -n "$JAVA_HOME" ] ; then
    if [ -x "$JAVA_HOME/jre/sh/java" ] ; then
        # IBM's JDK on AIX uses strange paths.
        JAVACMD="$JAVA_HOME/jre/sh/java"
    else
        JAVACMD="$JAVA_HOME/bin/java"
    fi
    if [ ! -x "$JAVACMD" ] ; then
        die "ERROR: JAVA_HOME is set to an invalid directory: $JAVA_HOME

Please set the JAVA_HOME variable in your environment to match the
location of your Java installation."
    fi
else
    JAVACMD="java"
    which java >/dev/null 2>&1 || die "ERROR: JAVA_HOME is not set and no 'java' command could be found in your PATH.

Please set the JAVA_HOME variable in your environment to match the
location of your Java installation."
fi

# Increase the maximum file descriptors if we can.
if [ "$cygwin" = "false" -a "$darwin" = "false" -a "$nonstop" = "false" ] ; then
    MAX_FD_LIMIT=`ulimit -H -n`
    if [ $? -eq 0 ] ; then
        if [ "$MAX_FD" = "maximum" -o "$MAX_FD" -gt $MAX_FD_LIMIT ] ; then
            MAX_FD=$MAX_FD_LIMIT
        fi
    fi
    if [ "$MAX_FD" != "maximum" -a "$MAX_FD" -gt 10 ] ; then
        ulimit -n $MAX_FD
    fi
fi

# For Darwin, add options to specify how the application appears in the dock.
if $darwin; then
    GRADLE_OPTS="$GRADLE_OPTS \"-Xdock:name=\\"$APP_NAME\\\" -Xdock:icon=$APP_HOME/media/gradle.icns\""
fi

# For Cygwin or MSYS, switch paths to Windows format before running java
if $cygwin ; then
    APP_HOME=`cygpath --path --mixed "$APP_HOME"`
    CLASSPATH=`cygpath --path --mixed "$CLASSPATH"`
    JAVACMD=`cygpath --unix "$JAVACMD"`

    # Now that we have converted to paths to Windows format, quote spaces.
    APP_HOME=`echo $APP_HOME | sed 's/ /\\"/g'`
    CLASSPATH=`echo $CLASSPATH | sed 's/ /\\"/g'`
fi

if [ "$msys" = "false" -a "$cygwin" = "false" ] ; then
    # For non Cygwin/non MSYS environments on Windows, quote spaces in the path to avoid problems with the Java CLI.
    APP_HOME=`echo $APP_HOME | sed 's/ /\\ /g'`
    CLASSPATH=`echo $CLASSPATH | sed 's/ /\\ /g'`
fi

# Split the JVM_OPTS and GRADLE_OPTS values into an array to avoid problems with spaces in the path
save ($IFS)
IFS=" "
read -a JVM_OPTS_ARRAY <<< "$JVM_OPTS"
read -a GRADLE_OPTS_ARRAY <<< "$GRADLE_OPTS"
IFS=$save

# Add default JVM options.
JVM_OPTS="""$DEFAULT_JVM_OPTS"""

# Add custom JVM options from the environment variable.
for i in "${JVM_OPTS_ARRAY[@]}"
do
    JVM_OPTS="$JVM_OPTS $i"
done

# Add Gradle-specific options.
for i in "${GRADLE_OPTS_ARRAY[@]}"
do
    GRADLE_OPTS="$GRADLE_OPTS $i"
done

for i in "${GRADLE_OPTS_ARRAY[@]}"
do
    GRADLE_OPTS="$GRADLE_OPTS $i"
done

# Find Java
if [ -n "$JAVA_HOME" ] ; then
    if [ -x "$JAVA_HOME/jre/sh/java" ] ; then
        # IBM's JDK on AIX uses strange paths.
        JAVACMD="$JAVA_HOME/jre/sh/java"
    else
        JAVACMD="$JAVA_HOME/bin/java"
    fi
else
    JAVACMD="`which java`"
fi

if [ ! -x "$JAVACMD" ] ; then
    die "ERROR: java executable is not found in the PATH or JAVA_HOME environment variable."
fi

exec "$JAVACMD" $DEFAULT_JVM_OPTS $JVM_OPTS $GRADLE_OPTS -classpath "$CLASSPATH" org.gradle.wrapper.GradleWrapperMain "$@"
