
[[ -z "$PS1" ]] && return;


if [[ $(type -P brew) ]]; then
	[[ -f `brew --prefix`/etc/bash_completion ]] && source `brew --prefix`/etc/bash_completion
	[[ -f `brew --prefix`/etc/autojump.bash ]] && source `brew --prefix`/etc/autojump.bash
fi


export EDITOR="atom -w"
export GEM_EDITOR="atom -w"
# export EDITOR="vim"
# export GEM_EDITOR="vim"
