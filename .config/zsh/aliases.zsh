c() {
  clear
}

v() {
  nvim $@
}

mc() {
  mkdir $@
  cd $1
}
