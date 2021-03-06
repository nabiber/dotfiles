function _rails_command () {
  if [ -e "bin/rails" ]; then
    bin/rails $@
  elif [ -e "script/rails" ]; then
    ruby script/rails $@
  elif [ -e "script/server" ]; then
    ruby script/$@
  else
    rails $@
  fi
}

function _rake_command () {
  if [ -e "bin/rake" ]; then
    bin/rake $@
  else
    rake $@
  fi
}

alias rails='_rails_command'
compdef _rails_command=rails

alias rake='_rake_command'
compdef _rake_command=rake

alias devlog='tail -f log/development.log'
alias prodlog='tail -f log/production.log'
alias testlog='tail -f log/test.log'

alias -g RED='RAILS_ENV=development'
alias -g REP='RAILS_ENV=production'
alias -g RET='RAILS_ENV=test'

# Rails aliases
alias rc='rails console'
alias rd='rails destroy'
alias rdb='rails dbconsole'
alias rg='rails generate'
alias rgm='rails generate migration'
alias rp='rails plugin'
alias ru='rails runner'
alias rs='rails server'
alias rsd='rails server --debugger'

# Rake aliases
alias rdm='rake db:migrate'
alias rdr='rake db:rollback'
alias rdc='rake db:create'
alias rds='rake db:seed'
alias rdd='rake db:drop'
alias rdtc='rake db:test:clone'
alias rdtp='rake db:test:prepare'
alias rdmtc='rake db:migrate db:test:clone'

alias rlc='rake log:clear'
alias rn='rake notes'
alias rr='rake routes'

function remote_console() {
  /usr/bin/env ssh $1 "( cd $2 && ruby script/console production )"
}
