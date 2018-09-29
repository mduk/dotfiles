declare repo=jaagr/polybar

package cmake
package cmake-data
package pkg-config
package libcairo2-dev
package libxcb1-dev
package libxcb-util0-dev
package libxcb-randr0-dev
package python-xcbgen
package xcb-proto
package libxcb-image0-dev
package libxcb-ewmh-dev
package libxcb-icccm4-dev

package libxcb-xkb-dev
package libxcb-xrm-dev
package libxcb-cursor-dev
package libasound2-dev
package libpulse-dev
package i3-wm
package libjsoncpp-dev
package libmpdclient-dev
package libcurl4-openssl-dev
package libiw-dev
package libn1-3-dev

clone $repo

cd $DEV_DIR/$repo

mkdir build
cd build

cmake ..
make
