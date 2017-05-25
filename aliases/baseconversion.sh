d2b() {
  _convert 10 2 $1
}

d2h() {
  _convert 10 16 $1
}

b2d() {
  _convert 2 10 $1
}

b2h() {
  _convert 2 16 $1
}

h2d() {
  _convert 16 10 $1
}

h2b() {
  _convert 16 2 $1
}

_convert() {
  echo "obase=$2; ibase=$1; $3" | bc
}
