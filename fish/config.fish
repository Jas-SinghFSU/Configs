if status is-interactive
    # Commands to run in interactive sessions can go here
end
# PATH exports
set -gx PATH $HOME/.local/bin $PATH
set -gx PATH $HOME/.cargo/bin $PATH
set -gx PATH $HOME/.claude/local $PATH

# Bun
set -gx BUN_INSTALL $HOME/.bun
set -gx PATH $BUN_INSTALL/bin $PATH

set -gx XDG_DATA_DIRS $XDG_DATA_DIRS:/usr/share/icons:/home/$USER/.local/share/icons

# Oh My Posh initialization (fish equivalent)
oh-my-posh init fish --config ~/.config/OhMyPosh/tokyonight.json | source

# History settings (fish handles these automatically, but you can customize)
# Fish stores history in ~/.local/share/fish/fish_history by default

# Functions (converted from bash functions)
function mochafy
    lutgen apply -p catppuccin-mocha $argv[1] -o $argv[2]
end

function tokyo
    lutgen apply -p tokyonight-moon $argv[1] -o "/home/jaskir/Pictures/Wallpapers/TokyoNight/$argv[1]"
end

function rosepine
    lutgen apply -p rose-pine $argv[1] -o $argv[2]
end

function mkvtomov
    if test (count $argv) -ne 2
        echo "Usage: mkvtomov <input_file.mkv> <output_file.mov>"
        return 1
    end

    set input_file $argv[1]
    set output_file $argv[2]

    # Run ffmpeg with a probe size to avoid premature end
    ffmpeg -analyzeduration 100M -probesize 100M -i $input_file -c:v libx264 -c:a aac $output_file
end

function gpr
    if test -z "$argv[1]"
        echo "Usage: gpr <pull-request-number>"
        return 1
    end
    git fetch origin pull/$argv[1]/head:pr-$argv[1]; and git checkout pr-$argv[1]
end

# Aliases
alias upscale="gowall upscale"

# Neovim aliases
alias vim=nvim
alias vi=nvim
alias v=nvim

# LSD (colorful ls) aliases
alias ls=lsd

# Image display alias
alias img='wezterm imgcat'

# Git aliases
alias cgo="git remote set-url origin"
alias gco="git checkout"
alias gcob="git checkout -b"
alias gc="git commit -m"
alias gs="git stash"
alias gP="git push"
alias gp="git pull"
alias grh="git reset --hard"

# Docker aliases
alias dcu="docker compose up"
alias dcub="docker compose up --build"
alias dcd="docker compose down"
alias de="docker exec -it"

# SSH alias
alias jas="ssh jaskyr@10.0.0.239"

# System aliases
alias restartplasma="killall plasmashell && sleep 3 && systemctl start --user plasma-plasmashell.service"
alias neofetch="fastfetch"
alias pacmirror="sudo reflector --latest 5 --sort rate --save /etc/pacman.d/mirrorlist"
alias showimg="kitten icat"

# GitHub Copilot aliases
alias copilot="gh copilot"
alias gcs="gh copilot suggest"
alias gce="gh copilot explain"

# Misc aliases
alias agg="ags -b greet -c ~/.config/ags/greeter/config.js"
alias vencord="/home/jaskir/Scripts/vencord.sh"
alias hypr="nvim ~/.config/hypr/hyprland.conf"

# NVM equivalent for fish (if you have fisher and bass installed)
# You might want to install nvm.fish instead: https://github.com/jorgebucaran/nvm.fish
# Or use fisher to install it: fisher install jorgebucaran/nvm.fish

# Load NVM if available (requires bass plugin)
# if test -s $HOME/.nvm/nvm.sh
#     bass source $HOME/.nvm/nvm.sh
# end
