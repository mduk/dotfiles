hedaer Fonts
install ttf-mscorefonts-installer

header Themes
install adwaita-qt

header Polybar
declare repo=jaagr/polybar
if [[ $FORCE_POLYBAR == 'true' ]] || [[ ! -d "$DEV_DIR/$repo" ]]
then
  install cmake
  install cmake-data
  install pkg-config
  install libcairo2-dev
  install libxcb1-dev
  install libxcb-util0-dev
  install libxcb-randr0-dev
  install python-xcbgen
  install xcb-proto
  install libxcb-image0-dev
  install libxcb-ewmh-dev
  install libxcb-icccm4-dev

  install libxcb-xkb-dev
  install libxcb-xrm-dev
  install libxcb-cursor-dev
  install libxcb-composite0-dev
  install libasound2-dev
  install libpulse-dev
  install i3-wm
  install libjsoncpp-dev
  install libmpdclient-dev
  install libcurl4-openssl-dev
  install libiw-dev
  install libnl-3-dev

  clone $repo
  cd $DEV_DIR/$repo
  mkdir build
  cd build
  cmake ..
  make -j$(nproc)
fi

install pavucontrol
install pavumeter
install pamix
install qtbase5-dev
install xsel
install arandr
install read-edid

install \
  i3-wm \
  i3-wm-dbg \
  suckless-tools

install \
  xscreensaver \
  xscreensaver-data-extra \
  xscreensaver-gl \
  xscreensaver-gl-extra \
  xscreensaver-screensaver-bsod

install \
  scrot \
  xcape \
  xsel

install \
  konsole \
  mpv \
  vlc \
  feh \
  arandr \
  dconf-editor

install \
  guvcview \
  pavucontrol

install \
  libreoffice-writer \
  libreoffice-calc \
  gimp \
  inkscape

