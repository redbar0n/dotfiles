all: install

install: .ackrc .irbrc .bash_profile .gemrc .gitignore .tmux.conf .rspec .gitconfig

.%: %
	ln -fs $(abspath $<) ~/$@

replace = @[ -e ~/.$(2) ] \
	&& (sed s/\<$(2)\>/`cat ~/.$(2)`/ $(1) > ~/.$(1) && echo ".$(1) installed") \
	|| echo "~/.$(2) is missing. $(1) not installed."

.gitconfig:
	$(call replace,gitconfig,github-token)

.PHONY: install gitconfig
