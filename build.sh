#!/bin/bash


SOURCE="${BASH_SOURCE[0]}"
while [ -h "$SOURCE" ]; do # resolve $SOURCE until the file is no longer a symlink
  DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"
  SOURCE="$(readlink "$SOURCE")"
  [[ $SOURCE != /* ]] && SOURCE="$DIR/$SOURCE" # if $SOURCE was a relative symlink, we need to resolve it relative to the path where the symlink file was located
done
DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"

cd $DIR
rm bin/ngl.x

echo Beginning compilation...
STARTTIME=$(ruby -e 'puts Time.now.to_f')

make -e -j 8

ENDTIME=$(ruby -e 'puts Time.now.to_f')
ELAPSEDTIME=$(bc <<<"scale=3;($ENDTIME - $STARTTIME)")
echo "Compilation time is $ELAPSEDTIME seconds"
cd -
