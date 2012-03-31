install: .ackrc .irbrc .bash_profile .gemrc .gitignore .tmux.conf .rspec gitconfig

.%: %
	ln -fs $(abspath $<) ~/$@

gitconfig:
	@[ -e ~/.github-token ] \
		&& (sed s/\<github-token\>/`cat ~/.github-token`/ $@ > ~/.$@ && echo ".$@ installed") \
		|| echo "~/.github-token is missing. $@ not installed."

.PHONY: install gitconfig
