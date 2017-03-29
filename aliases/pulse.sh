alias pa="pacmd"
alias opall="pa list | sed -n \
    -e '/(s).*\.$/p' \
    -e 's/^\s*name: <\(.*\)>/  * \1/p' \
    -e 's/\s*application\.name = \"\(.*\)\"/  * \1/p'
"

pall() {
  echo "Cards:"
  pactl list short cards
  echo
  echo "Sources:"
  pactl list short sources
  echo
  echo "Sinks:"
  pactl list short sinks
  echo
  echo "Clients:"
  pactl list short clients
  echo
  echo "Samples:"
  pactl list short samples
}
