declare repo=jaagr/polybar

apt_install cmake
apt_install cmake-data
apt_install pkg-config
apt_install libcairo2-dev
apt_install libxcb1-dev
apt_install libxcb-util0-dev
apt_install libxcb-randr0-dev
apt_install python-xcbgen
apt_install xcb-proto
apt_install libxcb-image0-dev
apt_install libxcb-ewmh-dev
apt_install libxcb-icccm4-dev

apt_install libxcb-xkb-dev
apt_install libxcb-xrm-dev
apt_install libxcb-cursor-dev
apt_install libasound2-dev
apt_install libpulse-dev
apt_install i3-wm
apt_install libjsoncpp-dev
apt_install libmpdclient-dev
apt_install libcurl4-openssl-dev
apt_install libiw-dev
apt_install libn1-3-dev

clone $repo

cd $DEV_DIR/$repo

mkdir build
cd build

cmake ..
make
