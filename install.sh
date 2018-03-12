#!/bin/sh

set -e

PREFIX="/opt/disable-c6"
SYSTEMD_UNIT_DIR="/usr/lib/systemd/system"

while [ $# -gt 0 ] ; do
  case "$1" in
    --prefix=*)
      PREFIX="${1#*=}"
      ;;
    --systemd=*)
      SYSTEMD_UNIT_DIR="${1#*=}"
      ;;
    --help)
      echo "Installs the disable-c6.service systemd unit."
      echo "Usage: `basename $0` [options]"
      echo "Options:"
      echo "  --prefix=PREFIX  Installation prefix (default: /opt/disable-c6)"
      echo "  --systemd=DIR    Location for systemd units (default: /usr/lib/systemd/system)"
      exit 0
      ;;
    *)
      echo "Invalid argument: $1"
      exit 1
      ;;
  esac
  shift
done

mkdir -p $PREFIX/bin
mkdir -p $SYSTEMD_UNIT_DIR

sed "s@{{PREFIX}}@$PREFIX@" disable-c6.service.template > $SYSTEMD_UNIT_DIR/disable-c6.service
install lib/ZenStates-Linux/zenstates.py $PREFIX/bin/zenstates.py

echo "Installed disable-c6 service. You may want to:"
echo "    systemctl enable disable-c6.service"
echo "    systemctl start disable-c6.service"
