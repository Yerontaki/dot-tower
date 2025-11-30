#
# ~/.bashrc
#

[[ $- != *i* ]] && return

PS1='[\u@\h \W]\$ '

if [ -f ~/.bash_execs ]; then
  . ~/.bash_execs
fi

# if [[ -z "$TMUX" ]] && [ "$SSH_CONNECTION" == "" ]; then
#     if tmux has-session 2>/dev/null; then
#         if [[ "$PWD" != "$HOME" ]]; then
#             tmux new-window -c "$PWD"
#         fi
#
#         exec tmux attach
#     else
#         exec tmux new
#     fi
# fi


alias ll='tree -a -C -L 3 --dirsfirst'
alias ls='tree -a -C -L 1 --dirsfirst'
alias la='tree -a -C --dirsfirst'

alias v='nvim .'
alias c='claude'
alias g='gemini'
alias x='clear'

alias ..='cd ../'
alias ...='cd ../..'

function yy() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	IFS= read -r -d '' cwd < "$tmp"
	[ -n "$cwd" ] && [ "$cwd" != "$PWD" ] && builtin cd -- "$cwd"
	rm -f -- "$tmp"
}

# === SYSTEM UPDATE FUNCTION ===
upd() {
    echo "Ενημέρωση πακέτων συστήματος..."
    sudo pacman -Syu --needed

    if command -v yay >/dev/null 2>&1; then
        echo "Ενημέρωση AUR πακέτων..."
        yay -Syu --needed
    fi

    echo "✅ Ολοκληρώθηκε!"
}

# === FIRMWARE UPDATE ALIAS (ΧΩΡΙΣ auto install) ===
alias upd1='fwupdmgr refresh && fwupdmgr get-updates'

# === OPTIONAL FULL FW UPDATE (τρέχει μόνο αν το καλέσεις) ===
upd2() {
    fwupdmgr refresh
    fwupdmgr get-updates
    fwupdmgr update
}

export PATH="$HOME/.local/bin:$PATH"
export RADV_PERFTEST=sam,nggc,ext4xmsaa

eval "$(starship init bash)"

export RIPGREP_CONFIG_PATH="$HOME/.config/ripgrep/rgrc"
