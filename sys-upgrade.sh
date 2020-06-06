set -e

VERSION=$1

if [ -z "$VERSION" ]; then
    echo "usage: sys-upgrade <version-number>"
    exit 1;
fi

echo "Upgrading Fedora to version $VERSION"

echo "Upgrading current version to latest stable."
sudo dnf upgrade --refresh

echo "Ensuring upgrade script is installed."
sudo dnf install dnf-plugin-system-upgrade

echo "Download desired version."
sudo dnf system-upgrade download --releasever=$VERSION --allowerasing

echo "Reboot into upgrade."
sudo dnf system-upgrade reboot

