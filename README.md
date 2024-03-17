# Dotfiles

This directory contains dotfiles

## Ensure you have the following installed on your system,

### Git

```
sudo apt install git
```

### Stow

```
sudo apt install stow
```

### Nerd font

Install from [here](https://github.com/ryanoasis/nerd-fonts/releases)

(like JetBrainsMono)

## Installation

Clone the repository in the `$HOME` directory,

```
git clone git@github.com/muItilingualism/dotfiles.git
cd dotfiles
```

then use GNU stow to create symlinks,

```
stow .
```
