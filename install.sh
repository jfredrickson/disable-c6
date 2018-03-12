#!/bin/sh

set -e

PREFIX="/opt/disable-c6"

while [ $# -gt 0 ] ; do
  case "$1" in
    --prefix=*)
      PREFIX="${1#*=}"
      ;;
    --help)
      echo "Installs the disable-c6.service systemd unit."
      echo "Usage: `basename $0` [options]"
      echo "Options:"
      echo "  --prefix=PREFIX  Installation prefix (default: /opt/disable-c6)"
      exit 0
      ;;
    *)
      echo "Invalid argument: $1"
      exit 1
      ;;
  esac
  shift
done

if [ ! -d $PREFIX ] ; then
  mkdir -p $PREFIX
fi

mkdir -p $PREFIX/lib

sed "s@{{PREFIX}}@$PREFIX@" disable-c6.service.template > $PREFIX/lib/disable-c6.service
install lib/ZenStates-Linux/zenstates.py $PREFIX/lib/zenstates.py
ln -sf $PREFIX/lib/disable-c6.service /etc/systemd/system

echo "Installed disable-c6 service. You may want to:"
echo "    systemctl enable disable-c6.service"
echo "    systemctl start disable-c6.service"
