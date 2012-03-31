install: .ackrc .irbrc .bash_profile .gemrc .gitignore .tmux.conf .rspec gitconfig

.%: %
	ln -fs $(abspath $<) ~/$@

replace = @[ -e ~/.$(1) ] \
	&& (sed s/\<$(1)\>/`cat ~/.$(1)`/ $(2) > ~/.$(2) && echo ".$(2) installed") \
	|| echo "~/.$(1) is missing. $(2) not installed."

gitconfig:
	$(call replace,github-token,gitconfig)

.PHONY: install gitconfig
