checkpr() {
 git fetch upstream pull/$1/head:pr/$1 && git checkout pr/$1	
}
