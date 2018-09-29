JANET_HOST=janet.local

package openssh-server
package openssh-client

echo "Looking for Janet..."
if ping $JANET_HOST -c 1 &>/dev/null
then rsync -avh -e ssh $USER@$JANET_HOST:~/.ssh/ $HOME/.ssh/
else echo "Can't find Janet. SSH keys won't be installed!" >&2
fi
