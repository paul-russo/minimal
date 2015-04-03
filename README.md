M_N_M_L
=======
Here's a screenshot of **minimal-path-git** variant:

![alt tag](https://raw.github.com/S1cK94/minimal/master/screen.gif)

Damn son! Show me teh codez!!
=============================
Antigen:
```
antigen theme S1cK94/minimal builds/minimal-path-git
```

Oh-my-zsh:
```
cd path/to/ohmyzsh/custom/themes
wget https://raw.github.com/S1cK94/minimal/master/builds/minimal-path-git.zsh-theme
```
and set `ZSH_THEME="minimal-path-git"` somewhere in .zshrc

Or you can always grab the build you want & source it.

Customization
=============
If you just don't like the color palette, you can use your own!  
Before you source the theme, you can alter these variable value to suit your
needs:
* **PROMPT_CHAR**: if you need another character in the prompt (default `❯`)
* **ACCENT_COLOR**: by default is `$fg[green]`, is used to show statuses (root
permissions, bg jobs, exit status == 0, branch is clean, vi insert mode).
* **ERROR_COLOR**: by default is `$fg[red]`, is used to show error statuses
(exit status != 0, branch is dirty).
* **NORMAL_COLOR**: by default is `$reset_color`, is used to show normal
statuses (user isn't root, no bg jobs, vi normal/command mode).
* **PATH_COLOR**: by default is `[38;5;244m`, is the color used for path
* **HOST_COLOR**: by default is `[38;5;244m`, is the color used for host

Modules
=======
I splitted the functionalities of this theme into modules, so it's easier to
maintain, fork and create your own variant by rearranging item and/or adding more
functionalities.

Defaults module
---------------
It contains some default values used by every variant.  
Basically it enables colors, prompt substitution and sets default colors.  
Can be omitted if you have those already in your .zshrc.
It's loaded by all variants.

User module
-----------
Prints a `$PROMPT_CHAR`. Uses `$ACCENT_COLOR` if you're logged in as a
privileged user, otherwise uses `$NORMAL_COLOR`.

Jobs module
-----------
Prints a `$PROMPT_CHAR`. Uses `$ACCENT_COLOR` if you have 1 or more background
jobs, otherwise uses `$NORMAL_COLOR`

Vimode module
-----------
Prints a `$PROMPT_CHAR`. Uses `$ACCENT_COLOR` if you're in **INSERT** mode,
uses `$NORMAL_COLOR` if you're in **NORMAL** mode.

Status module
-----------
Prints a `$PROMPT_CHAR`. Uses `$ACCENT_COLOR` if your last command exited with
status 0, otherwise uses `$ERROR_COLOR`.

Path module
-----------
Prints current working directory. `$HOME` is rendered as `~`. Shows only 2 last
segments. Uses `$PATH_COLOR`.

Git module
-----------
Prints current branch when in a git repo. Uses `$ACCENT_COLOR` if branch is
clean, otherwise uses `$ERROR_COLOR`.

Host module
-----------
Prints hostname up to the first dot. Uses `$HOST_COLOR`.


Variants
========
There are 6 variants:

* **minimal**: which shows *user*, *jobs* and *status*.
* **minimal-vimode**: which shows *user*, *jobs*, *status* and *vimode*.
* **minimal-path**: which shows *user*, *jobs*, *status* and *path*.
* **minimal-path-host**: which shows *user*, *jobs*, *status*, *path* and
*host*.
* **minimal-path-git**: which shows *user*, *jobs*, *status*, *path* and *git*.
* **minimal-vimode-path-git**: which shows *user*, *jobs*, *status*, *vimode*,
*path* and *git*.
* **minimal-path-git-host**: which shows *user*, *jobs*, *status*, *path*,
*git* and *host*.

LICENSE
=======
MIT (see LICENSE file)
