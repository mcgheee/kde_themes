if status is-interactive
# Commands to run in interactive sessions can go here

## Source done plugin from conf.d
source ~/.config/fish/conf.d/done.fish


##### ENVIRONMENT SETUP #####
# Clear default greeting
set -U fish_greeting
# Format man pages
set -x MANROFFOPT "-c"
set -x MANPAGER "sh -c 'col -bx | bat -l man -p'"
# Set settings for https://github.com/franciscolourenco/done
set -U __done_min_cmd_duration 10000
set -U __done_notification_urgency_level low
# Apply .profile: use this to put fish compatible .profile stuff in
if test -f ~/.fish_profile
  source ~/.fish_profile
end
# Append common directories for executable files to $PATH
fish_add_path ~/.local/bin ~/.cargo/bin ~/Applications/depot_tools
## Auto start in zellij
#  if set -q ZELLIJ
#  else
#            zellij
#  end


##### CUSTOM FUNCTIONS #####

# Functions needed for !! and !$ https://github.com/oh-my-fish/plugin-bang-bang
function __history_previous_command
  switch (commandline -t)
  case "!"
    commandline -t $history[1]; commandline -f repaint
  case "*"
    commandline -i !
  end
end
function __history_previous_command_arguments
  switch (commandline -t)
  case "!"
    commandline -t ""
    commandline -f history-token-search-backward
  case "*"
    commandline -i '$'
  end
end

if [ "$fish_key_bindings" = fish_vi_key_bindings ];
  bind -Minsert ! __history_previous_command
  bind -Minsert '$' __history_previous_command_arguments
else
  bind ! __history_previous_command
  bind '$' __history_previous_command_arguments
end

# Fish command history
function history
    builtin history --show-time='%F %T ' $argv
end

# Make a .bak copy of a file
function backup --argument filename
    cp $filename $filename.bak
end

# Copy DIR1 DIR2
function copy
    set count (count $argv | tr -d \n)
    if test "$count" = 2; and test -d "$argv[1]"
        set from (echo $argv[1] | trim-right /)
        set to (echo $argv[2])
        command cp -r $from $to
    else
        command cp $argv
    end
end

# Autocorrect old `dnf list installed` to DNF5 `dnf list --installed` 
function dnf
    if test (count $argv) -eq 2; and test "$argv[1]" = list; and test "$argv[2]" = installed
        command dnf list --installed
    else
        command dnf $argv
    end
end

# Ollama Update command
function ollama
    if test (count $argv) -eq 1; and test "$argv[1]" = update
        curl -fsSL https://ollama.com/install.sh | sh
        and sudo -v
        and sudo systemctl stop ollama.service
        and sudo systemctl daemon-reload
        and sudo systemctl start ollama.service
    else
        command ollama $argv
    end
end

# Translate common pacman/yay commands to DNF5.
function __arch_to_dnf
    printf "You're on an RPM based distro, dummy! \nLet me fix that for you..."
    if test (count $argv) -eq 0
        return 2
    end
    switch $argv[1]
        # pacman -Syu / yay -Syu
        case -Syu
            command sudo dnf --refresh upgrade
        # pacman -S package / yay -S package
        case -S
            if test (count $argv) -lt 2
                echo "error: no package specified" >&2
                return 2
            end
            command sudo dnf install $argv[2..-1]
        # pacman -R package
        case -R
            if test (count $argv) -lt 2
                echo "error: no package specified" >&2
                return 2
            end
           # Passing --no-autoremove makes this closer to
           # pacman -R: remove the requested package
           # without cleaning its now-unused dependencies.
            command sudo dnf remove --no-autoremove $argv[2..-1]
        # pacman -Rcns package
        case -Rcns
            if test (count $argv) -lt 2
                echo "error: no package specified" >&2
                return 2
            end
            # Normal DNF removal also cleans dependencies that
            # are no longer needed.
            command sudo dnf remove $argv[2..-1]
        case '*'
            printf "Oops! I can only translate:\n   pacman/yay {-Syu|-S|-R|-Rcns} [packages...], \nnot whatever $argv[1] was... \nTry again, but be better." >&2
            return 2
    end
end

# Send pacman & yay commands to DNF5 translation
# Allow:
#   pacman -Syu
#   pacman -S foo
#   pacman -R foo
#   pacman -Rcns foo
function pacman
    __arch_to_dnf $argv
end
# Allow the same commands using yay syntax.
function yay
    __arch_to_dnf $argv
end

# Sudo Wrapper
#  Intercepts specified commands following a sudo
#  and handles them appropriately.
# 
#  Catch:
#    - sudo pacman ...
#
#  Everything else is passed to the real sudo unchanged.
function sudo
    if test (count $argv) -gt 0; and test "$argv[1]" = pacman
        pacman $argv[2..-1]
    else
        command sudo $argv
    end
end

function forti
    set -l action ""
    # Parse optional action argument
    switch "$argv[1]"
        case -c --connect
            set action connect
        case -d --disconnect
            set action disconnect
        case -s --status
            set action status
        case ''
            # No explicit action; determine from current VPN state.
            set -l status_output (forticlient vpn status 2>&1)
            printf '%s\n' $status_output
            if string match -q '*Status: Not Running*' -- $status_output
                read --prompt-str "Connect to NICS-SSL? [Y/n] " -l response
                switch (string lower -- $response)
                    case '' y yes
                        set action connect
                    case '*'
                        return 0
                end
            else if string match -q '*Status: Connected*' -- $status_output
                read --prompt-str "Disconnect from NICS-SSL? [Y/n] " -l response
                switch (string lower -- $response)
                    case '' y yes
                        set action disconnect
                    case '*'
                        return 0
                end
            else
                echo "Unable to determine FortiClient VPN status." >&2
                return 1
            end
        case '*'
            echo "Usage: forti [-c|--connect|-d|--disconnect|-s|--status]" >&2
            return 2
    end
    switch $action
        case connect
            forticlient vpn connect NICS-SSL
        case disconnect
            forticlient vpn disconnect && sudo systemctl restart systemd-resolved
        case status
            forticlient vpn status
    end
end

##### ALIASES #####
# Shortcuts for navigating backwards through dir parents
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ......='cd ../../../../..'
# Use colors for supported commands
# alias ls="ls --color=auto" # Replaced by eza
alias dir='dir --color=auto'
alias vdir='vdir --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
## Replace ls with eza
# simple listing
alias ls='eza -F --color=always --group-directories-first --icons=always'
# all files and dirs
alias la='eza -aF --color=always --group-directories-first --icons=always'
# long format
alias ll='eza -algF --color=always --group-directories-first --icons=always'
# tree listing
alias lt='eza -aT --color=always --group-directories-first --icons=always'
# show only dotfiles
alias l.="eza -a | grep -e '^\.'"
# show filesystem-specific metadata
alias lse="eza -algF --extended --color=always --group-directories-first --icons=always"
# trigger GitCache to query status of files within a repository, filter git-ignore
alias lsg="eza -algF --git --git-ignore --color=always --group-directopries-first --icons=always"
# trigger GitCache to query status of files within a repository, show all
alias lsga="eza -algF --git --color=always --group-directopries-first --icons=always"
# Replace vim with Neovim
alias vim="nvim"
# Replace tmux with zellij
alias tmux="zellij"
# Common use
#alias grubup="sudo grub-mkconfig -o /boot/grub/grub.cfg"
alias tarnow='tar -acf '
alias untar='tar -zxvf '
alias wget='wget -c '
alias psmem='ps auxf | sort -nr -k 4'
alias psmem10='ps auxf | sort -nr -k 4 | head -10'
# Get Hardware Info
alias hw='hwinfo --short'
# Get the error messages from journalctl
alias jctl="journalctl -p 3 -xb"
alias update='dnf update -y'


##### ENVIRONMENT VARS #####
# Set editor to Neovim
set -gx EDITOR nvim
set -gx SYSTEMD_EDITOR nvim


##### PROMPT #####
# Replace default prompt with Starship
starship init fish | source


end
