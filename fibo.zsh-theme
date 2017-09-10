# fibo.zsh-theme (https://github.com/igorvisi/fibo-zsh-theme)
# write by Igor Visi (http://igorvisi.github.io)
# for people with nvm and git. Tested on Archlinux with xfce.
# borrowing shamelessly from the oh-my-zsh theme : fino
# In order for this theme to render correctly, you will need a
# [Powerline-patched font](https://github.com/Lokaltog/powerline-fonts) or
# Need nerd-font(https://github.com/ryanoasis/nerd-fonts)

current_dir='${PWD/#$HOME/~}'
local host=${SHORT_HOST:-$HOST}
local git_info='$(git_prompt_info)'
local git_status='$(git_prompt_status)'
local prompt_char='$(prompt_char)'

function prompt_char {
  git branch >/dev/null 2>/dev/null && return
} 

# Get node version from nvm or system .
local nvm_mode=''
if which nvm_prompt_info &> /dev/null; then
  nvm_mode='%{$fg[green]%}⬢ $(nvm current)%{$reset_color%}'
else
  if which node &> /dev/null; then
    nvm_mode='%{$fg[green]%}⬢ $(node -v)%{$reset_color%}'
  fi
fi

# rbenv information
rbenv_version=''
if which rbenv 2>/dev/null >&2; then
  local rbenv_version="  $(rbenv version-name)"
fi
PROMPT="%{$FG[242]%}at%{$reset_color%} %{$FG[009]%}${host}%{$reset_color%} %{$FG[243]%}${nvm_mode}%{$reset_color%}%{$FG[009]%}${rbenv_version}%{$reset_color%} %{$FG[239]%}in%{$reset_color%} %{$terminfo[bold]$FG[003]%}${current_dir}%{$reset_color%}${git_info}${git_status} 
%{$FG[242]%} %{$reset_color%}${prompt_char}%{$reset_color%}"


ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[white]%}|%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[red]%}%{$reset_color%} →"
ZSH_THEME_GIT_PROMPT_AHEAD="%{$fg_bold[red]%}!%{$reset_color%} →"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[green]%}%{$reset_color%}"

ZSH_THEME_GIT_PROMPT_ADDED="%{$fg[green]%} ✚"
ZSH_THEME_GIT_PROMPT_MODIFIED="%{$fg[blue]%} ✹"
ZSH_THEME_GIT_PROMPT_DELETED="%{$fg[red]%} ✖"
ZSH_THEME_GIT_PROMPT_RENAMED="%{$fg[magenta]%} ➜"
ZSH_THEME_GIT_PROMPT_UNMERGED="%{$fg[yellow]%} ═"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg_bold[cyan]%} ?"
