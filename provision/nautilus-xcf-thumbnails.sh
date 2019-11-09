source ./include.sh

header Gnome Thumbnails

install gnome-xcf-thumbnailer
sudo mkdir -p /usr/share/thumbnailers/
echo -e "[Thumbnailer Entry]\nTryExec=gnome-xcf-thumbnailer\nExec=gnome-xcf-thumbnailer %i %o\nMimeType=image/x-xcf;image/x-compressed-xcf;" \
  | sudo tee /usr/share/thumbnailers/gnome-xcf.thumbnailer

