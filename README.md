M_N_M_L
=======

Minimal theme for oh-my-zsh. Also works on antigen (with `antigen use oh-my-zsh`).

Here's a screenshot of **minimal-path-git** variant:

![alt tag](https://raw.github.com/S1cK94/minimal/master/minimal.gif)

There are 4 variants:

* **minimal**: it features only the basic prompt.
* **minimal-path**: it inherits from **minimal** and adds `pwd` informations.
* **minimal-path-host**: it inherits from **minimal-path** and shows hostname.
* **minimal-path-git**: it inherits from **minimal-path** and adds info for current git branch.
* **minimal-path-git-host**: it inherits from both **minimal-path-git** and **minimal-path-host**

minimal.zsh-theme
-----------------
The left prompt is very discrete but useful:
```
❯❯❯
```
* The first ❯ will light up (becomes green) if you have super user privileges.
* The second ❯ will light up (becomes green) if you have 1 or more background jobs.
* The third ❯ will become green if the exit status of your last command is 0, otherwise will become red

minimal-path.zsh-theme
----------------------
It will show the last 2 segments of your current directory in the right prompt.
Home directory is abbreviated with `~`.
```
❯❯❯                                         Workspace/minimal
```

minimal-path-host.zsh-theme
---------------------------
It will display the hostname (up to the first `.`) in the right prompt.
```
❯❯❯                                                  Workspace/minimal  SierraX
```

minimal-path-git.zsh-theme
--------------------------
If you work with git, you will appreciate this.  
It will show branch information in the right prompt.
The branch name will be red if is dirty, otherwise will be green.

```
❯❯❯                                                    Workspace/minimal master
```

minimal-path-git-host.zsh-theme
-------------------------------
It shouldn't be hard to guess, but here the example anyway.
```
❯❯❯                                           Workspace/minimal master  SierraX
```
