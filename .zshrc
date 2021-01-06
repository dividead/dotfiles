PROMPT='%F{red}%1~ > %F{reset}'

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export HISTCONTROL=ignoreboth:erasedups

export FZF_DEFAULT_COMMAND='rg --files --follow --hidden'

dex() {
  name="name=^detmir-"
  case $1 in
    api)
      name+="api-\d"
      ;;
    web)
      name+="web-\d"
      ;;
    fe)
      name+="fe-\d"
      ;;
    store)
      name+="api-store-\d"
      ;;
    *)
      return 1
  esac

  id=$(docker ps -qf $name)
  docker exec -it $id sh
}

rmiall(){
  docker images -q | xargs docker rmi
}

dprune(){
  docker system prune -f
}

store() {
  id=$(docker ps -f "name=detmir-api-store" --format "{{.ID}}")
  docker exec -it $id redis-cli
}

dstop() {
  name="detmir-"
  case $1 in
    "api")
    name+="api"
    ;;
    "web")
    name+="web"
    ;;
    "fe")
    name+="fe"
    ;;
    "store")
    name+="api-store"
    ;;
  esac

  echo "stopping $name"
  id=$(docker ps -f "name=$name" --format "{{.ID}}" | head -n 1)
  docker stop $id
}

new_branch(){
  cmd="git checkout -b feature/GO-$1"
  eval ${cmd}
}

alias vi='nvim'
alias vim='nvim'
alias vimdiff='nvim -d'

alias grep='rg'

alias mpv='mpv "$(fzf)"'

alias codev='git checkout develop'
alias coma='git checkout master'
alias codot='git checkout .'
alias cos='git checkout feature/GO-3623-subscriptions'
alias cof='git branch | fzf | xargs git checkout'
alias gdiff='git diff'
alias gback='git checkout -'
alias gammend='git add src && git commit --amend --no-edit'

alias run='npm run dev'

vpn(){
  if (/opt/cisco/anyconnect/bin/vpn state | grep -c "state: Connected"); then
    /opt/cisco/anyconnect/bin/vpn disconnect
  else
    printf "${SECRET_VPNPASS}\ny" | /opt/cisco/anyconnect/bin/vpn -s connect $SECRET_VPNHOST
  fi
}

backup(){
  mkdir -p ~/code/dots/.config/mpv
  mkdir -p ~/code/dots/.config/git
  mkdir -p ~/code/dots/.config/nvim
  mkdir -p ~/code/dots/.config/alacritty
  cp ~/{.zshrc,.gitconfig,.tmux.conf} ~/code/dots/
  cp ~/.config/mpv/mpv.conf ~/code/dots/.config/mpv
  cp ~/.config/alacritty/alacritty.yml ~/code/dots/.config/alacritty
  cp ~/.config/git/ignore ~/code/dots/.config/git/ignore
  cp ~/.config/nvim/{init.vim,coc-settings.json} ~/code/dots/.config/nvim
  cd ~/code/dots

  # such security
  sed  -i ''  '/^SECRET/d' ~/code/dots/.zshrc

  git add .
  git commit -m "backup dotfiles $(date)"
  git push
  cd -
}

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
