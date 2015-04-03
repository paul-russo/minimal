M=modules
P=prompts
B=builds

all:
	@make clean
	@make minimal
	@make minimal-vimode
	@make minimal-vimode-path-git
	@make minimal-path
	@make minimal-path-host
	@make minimal-path-git
	@make minimal-path-git-host

clean:
	rm $B/*.zsh-theme

minimal:
	rm -f $B/$@.zsh-theme
	@echo "making $B/$@.zsh-theme"
	@for f in \
		$M/defaults.zsh \
		$M/user.zsh \
		$M/jobs.zsh \
		$M/status.zsh \
		$P/$@.zsh; \
	do \
		(cat $$f; echo) >> $B/$@.zsh-theme; \
	done;

minimal-vimode:
	rm -f $B/$@.zsh-theme
	@echo "making $B/$@.zsh-theme"
	@for f in \
		$M/defaults.zsh \
		$M/user.zsh \
		$M/jobs.zsh \
		$M/status.zsh \
		$M/vimode.zsh \
		$P/$@.zsh; \
	do \
		(cat $$f; echo) >> $B/$@.zsh-theme; \
	done;

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

minimal-path:
	rm -f $B/$@.zsh-theme
	@echo "making $B/$@.zsh-theme"
	@for f in \
		$M/defaults.zsh \
		$M/user.zsh \
		$M/jobs.zsh \
		$M/status.zsh \
		$M/path.zsh \
		$P/$@.zsh; \
	do \
		(cat $$f; echo) >> $B/$@.zsh-theme; \
	done;

minimal-path-host:
	rm -f $B/$@.zsh-theme
	@echo "making $B/$@.zsh-theme"
	@for f in \
		$M/defaults.zsh \
		$M/user.zsh \
		$M/jobs.zsh \
		$M/status.zsh \
		$M/path.zsh \
		$M/host.zsh \
		$P/$@.zsh; \
	do \
		(cat $$f; echo) >> $B/$@.zsh-theme; \
	done;

minimal-path-git:
	rm -f $B/$@.zsh-theme
	@echo "making $B/$@.zsh-theme"
	@for f in \
		$M/defaults.zsh \
		$M/user.zsh \
		$M/jobs.zsh \
		$M/status.zsh \
		$M/path.zsh \
		$M/git.zsh \
		$P/$@.zsh; \
	do \
		(cat $$f; echo) >> $B/$@.zsh-theme; \
	done;

minimal-path-git-host:
	rm -f $B/$@.zsh-theme
	@echo "making $B/$@.zsh-theme"
	@for f in \
		$M/defaults.zsh \
		$M/user.zsh \
		$M/jobs.zsh \
		$M/status.zsh \
		$M/path.zsh \
		$M/git.zsh \
		$M/host.zsh \
		$P/$@.zsh; \
	do \
		(cat $$f; echo) >> $B/$@.zsh-theme; \
	done;
