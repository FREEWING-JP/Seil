#!/bin/sh

basedir=`dirname $0`

find ../../* -name '*.cpp' -type f ! -ipath '*/Frameworks/*' ! -ipath '*/kext/*/*include/*' ! -ipath '*/src/bridge/output/*' | xargs uncrustify -c "$basedir/uncrustify.cfg" --no-backup
find ../../* -name '*.hpp' -type f ! -ipath '*/Frameworks/*' ! -ipath '*/kext/*/*include/*' ! -ipath '*/src/bridge/output/*' | xargs uncrustify -c "$basedir/uncrustify.cfg" --no-backup
find ../../* -name '*.m'   -type f ! -ipath '*/Frameworks/*' ! -ipath '*/kext/*/*include/*' ! -ipath '*/src/bridge/output/*' | xargs uncrustify -c "$basedir/uncrustify.cfg" --no-backup
find ../../* -name '*.h'   -type f ! -ipath '*/Frameworks/*' ! -ipath '*/kext/*/*include/*' ! -ipath '*/src/bridge/output/*' | xargs uncrustify -c "$basedir/uncrustify.cfg" --no-backup -l OC
