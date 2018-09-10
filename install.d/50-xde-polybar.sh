declare repo=jaagr/polybar

dot-install package cmake
dot-install package cmake-data
dot-install package pkg-config
dot-install package libcairo2-dev
dot-install package libxcb1-dev
dot-install package libxcb-util0-dev
dot-install package libxcb-randr0-dev
dot-install package python-xcbgen
dot-install package xcb-proto
dot-install package libxcb-image0-dev
dot-install package libxcb-ewmh-dev
dot-install package libxcb-icccm4-dev

dot-install package libxcb-xkb-dev
dot-install package libxcb-xrm-dev
dot-install package libxcb-cursor-dev
dot-install package libasound2-dev
dot-install package libpulse-dev
dot-install package i3-wm
dot-install package libjsoncpp-dev
dot-install package libmpdclient-dev
dot-install package libcurl4-openssl-dev
dot-install package libiw-dev
dot-install package libn1-3-dev

clone $repo

cd $DEV_DIR/$repo

mkdir build
cd build

cmake ..
make
