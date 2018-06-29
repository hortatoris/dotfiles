#
# ~/.bashrc
#

[[ $- != *i* ]] && return

colors() {
	local fgc bgc vals seq0

	printf "Color escapes are %s\n" '\e[${value};...;${value}m'
	printf "Values 30..37 are \e[33mforeground colors\e[m\n"
	printf "Values 40..47 are \e[43mbackground colors\e[m\n"
	printf "Value  1 gives a  \e[1mbold-faced look\e[m\n\n"

	# foreground colors
	for fgc in {30..37}; do
		# background colors
		for bgc in {40..47}; do
			fgc=${fgc#37} # white
			bgc=${bgc#40} # black

			vals="${fgc:+$fgc;}${bgc}"
			vals=${vals%%;}

			seq0="${vals:+\e[${vals}m}"
			printf "  %-9s" "${seq0:-(default)}"
			printf " ${seq0}TEXT\e[m"
			printf " \e[${vals:+${vals+$vals;}}1mBOLD\e[m"
		done
		echo; echo
	done
}

[[ -f ~/.extend.bashrc ]] && . ~/.extend.bashrc

[ -r /usr/share/bash-completion/bash_completion   ] && . /usr/share/bash-completion/bash_completion

alias dual_mon_on="xrandr --output HDMI1 --mode 1920x1080 --right-of eDP1"
alias dual_mon_off="xrandr --output HDMI1 --off"

alias vga_on="xrandr --output DP1 --mode 1680x1050 --right-of eDP1"
alias vga_off="xrandr --output DP1 --off"

alias vrm_mine="~/Documents/coin/verium/veriumMiner-main/cpuminer -n 1048576 -o stratum+tcp://eu.vrm.mining-pool.ovh:3032 -u eldoradoo.worker_6 -p passwdWorker6 -t 3"

alias zatab="tabbed -cd zathura -e"

alias rager="ranger"

export PS1="\[\e[32m\][\[\e[m\]\[\e[32m\]\u\[\e[m\] \[\e[34;1m\]\W\[\e[m\]\[\e[32m\]]$\[\e[m\] "
