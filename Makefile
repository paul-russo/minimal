M=modules
P=prompts
B=builds

all:
	@make clean
	@make minimal-vimode-path-git

clean:
	rm -f $B/*.zsh-theme

minimal-vimode-path-git:
	rm -f $B/$@.zsh-theme
	@echo "making $B/$@.zsh-theme"
	@for f in \
		$M/defaults.zsh \
		$M/user.zsh \
		$M/jobs.zsh \
		$M/status.zsh \
		$M/vimode.zsh \
		$M/path.zsh \
		$M/git.zsh \
		$P/$@.zsh; \
	do \
		(cat $$f; echo) >> $B/$@.zsh-theme; \
	done;
