export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="powerlevel10k/powerlevel10k"
plugins=( git zsh-syntax-highlighting zsh-autosuggestions )
source $ZSH/oh-my-zsh.sh

[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

if [ -x "$(command -v exa)" ]; then
    alias ls="exa --all --icons"
fi

alias cat="bat"
alias df="duf"
alias top="btop"
alias ping="gping"
alias flatpac='flatpak'
alias cmatrix='cmatrix -C cyan'
alias clock="tty-clock -sc -C6 -D -n"
#alias blacklist='sudo /usr/local/bin/blacklist'
[[ -f $HOME/.dart-cli-completion/zsh-config.zsh ]] && . $HOME/.dart-cli-completion/zsh-config.zsh || true

vmnet() {
  local BLUE="\033[1;34m"
  local RESET="\033[0m"

  case "$1" in
    on)
      sudo cp /etc/vmware/networking.good /etc/vmware/networking
      sudo systemctl enable --now vmware-networks.service >/dev/null 2>&1
      sudo systemctl restart vmware-networks.service >/dev/null 2>&1
      echo -e "${BLUE}★ VMware network has been enabled${RESET}"
      ;;
    off)
      sudo systemctl disable --now vmware-networks.service >/dev/null 2>&1
      echo -e "${BLUE}★ VMware network has been disabled${RESET}"
      ;;
    start)
      sudo systemctl start vmware-networks.service >/dev/null 2>&1
      echo -e "${BLUE}★ VMware network service started${RESET}"
      ;;
    stop)
      sudo systemctl stop vmware-networks.service >/dev/null 2>&1
      echo -e "${BLUE}★ VMware network service stopped${RESET}"
      ;;
    restart)
      sudo systemctl restart vmware-networks.service >/dev/null 2>&1
      echo -e "${BLUE}★ VMware network service restarted${RESET}"
      ;;
    status)
      echo -e "${BLUE}★ VMware network status:${RESET}"
      systemctl status vmware-networks.service --no-pager
      ;;
    *)
      echo -e "${BLUE}Usage:${RESET} vmnet {on|off|start|stop|restart|status}"
      ;;
  esac
}

docker() {
  local BLUE="\033[1;34m"
  local RESET="\033[0m"

  case "$1" in
    on)
      sudo systemctl enable --now docker.service docker.socket >/dev/null 2>&1
      echo -e "${BLUE}★ Docker has been enabled${RESET}"
      ;;
    off)
      sudo systemctl disable --now docker.service docker.socket >/dev/null 2>&1
      echo -e "${BLUE}★ Docker has been disabled${RESET}"
      ;;
    start)
      sudo systemctl start docker.service docker.socket >/dev/null 2>&1
      echo -e "${BLUE}★ Docker service started${RESET}"
      ;;
    stop)
      sudo systemctl stop docker.service docker.socket >/dev/null 2>&1
      echo -e "${BLUE}★ Docker service stopped${RESET}"
      ;;
    restart)
      sudo systemctl restart docker.service docker.socket >/dev/null 2>&1
      echo -e "${BLUE}★ Docker service restarted${RESET}"
      ;;
    status)
      echo -e "${BLUE}★ Docker status:${RESET}"
      systemctl status docker.service --no-pager
      ;;
    *)
      command docker "$@"
      ;;
  esac
}


unalias flatpac 2>/dev/null

flatpac() {
    if [[ "$*" == *"-Syu"* ]]; then
        flatpak update
        return
    fi

    if [[ "$1" == "-Sy" ]]; then
        shift
        flatpak update "$@"
        return
    fi

    if [[ "$1" == "-S" ]]; then
        shift
        flatpak install flathub "$@"
        return
    fi

    command flatpak "$@"
}

#zapret
alias zapret-config='$HOME/.local/share/zapret/install.sh'
alias zapret-utils='$HOME/.local/share/zapret/utils-zapret.sh'
