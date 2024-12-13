PROMPT="%Ba glass cat %~ λ %b"

export PATH=$PATH:/opt/homebrew/bin
export PATH=$PATH:/Users/jonas/Library/Python/3.9/bin
export PATH=$PATH:/Users/jonas/bin
export PATH=$PATH:/Users/jonas/.cargo/bin

alias firefox='open /Applications/Firefox.app'
alias code='open -b com.microsoft.VSCode "$@"'

autoload -Uz compinit && compinit # git branch autocomplete

profile() {
  vim ~/.zshrc;
  . ~/.zshrc;
}

# SYNC RESUME SCRIPT #
resume_dir='/Users/jonas/code/resume'
portfolio_dir='/Users/jonas/code/jonasiwnl.github.io'

sync_resume() {
  if [ $# -eq 0 ]; then
    echo "Error: Please provide a commit message."
    echo "Usage: $0 <commit message>"
    return
  fi

  commit_msg="$1"

  cd "$resume_dir" || return
  git add .
  git commit -m "$commit_msg"
  git push

  cd - > /dev/null

  cd "$portfolio_dir" || return
  cp "${resume_dir}/Jonas_Groening_resume.pdf" public/Jonas_Groening_resume.pdf
  git add .
  git commit -m "Resume: $commit_msg"
  git push

  cd - > /dev/null

  echo "\n ======== Sync completed successfully. ===========\n"
}

export AUTHOR="Jonas"
# Count git additions/deletions/files changed for a user and branch
countlines () {
  git log --author=$AUTHOR --shortstat $BRANCH | \
  awk '/^ [0-9]/ { f += $1; i += $4; d += $6 } \
  END { printf("%d files changed, %d insertions(+), %d deletions(-)", f, i, d) }'
}



export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"
. "/Users/jonas/.deno/env"
