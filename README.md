# dotfiles

# Setup

## Mac

```shell
sh mac/setup.sh
```

## prezto

```shell
sh prezto/install_prezto.sh
```

## brew

```shell
sh brew/install_brew.sh
```

## iterm

- preference -> preference -> Load preferences from a custom folder or URL
  
  - import **com.googlecode.iterm2.plist**

- theme
  
  - https://gist.github.com/Revod/3f3115f8d4b90fc986fd4b61441c2567
  - https://github.com/Arc0re/Iceberg-iTerm2/blob/master/iceberg.itermcolors
  - https://github.com/dracula/iterm/blob/master/Dracula.itermcolors


## VSCode

- install code command from preferences

```shell
sh code/install_extensions.sh
```

- copy settings.json

## Other

**slack theme**

- Material

```
#263238,#2e3a40,#80CBC4,#FFFFFF,#13191C,#ffffff,#50fa7b,#FF5555,#2e3a40,#ffffff
```

- Dracula

```
#282A36,#44475A,#44475A,#8BE9FD,#6272A4,#FFFFFF,#50FA7B,#FF5555
```

- Blue

```
#003D67,#003D67,#FFFFFF,#003D67,#00548C,#FFFFFF,#0099FF,#006752,#003D67,#FFFFFF
```

# update

## brew

```shell
brew bundle dump
```

## code
```shell
code --list-extensions > extensions
```

## iterm
- updated automatically
  - **set Preference -> General -> Preference -> Save changes to Automatically**

## dotfiles

- all of them are in symbolic links

