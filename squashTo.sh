squashTo() {
  if [ "$2" ]; then
    echo "Squashing commits from HEAD to $1 with following commit message: $2"
  else
    echo "USAGE: $0 <commit-hash> <commit-message>"
    echo "ex: $0 af75f8ca 'Update functionality in index.js'"
    return
  fi
  
  COMMIT_TO_SQUASH_TO=$1
  SQUASH_MESSAGE=$2

  currentBranch="$(git rev-parse --abbrev-ref HEAD)"
  squashBranch="squashBranch-$COMMIT_TO_SQUASH_TO"

  git checkout $COMMIT_TO_SQUASH_TO && \
  git checkout -b $squashBranch && \
  git merge --squash $currentBranch && \
  git commit -m $SQUASH_MESSAGE && \
  git checkout $currentBranch && \
  git reset --hard $squashBranch && \
  git branch -D $squashBranch
}