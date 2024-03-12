# Dotfiles

This directory contains dotfiles

## Ensure you have the following isntalled on your system,

### Git

```
sudo apt install git
```

### Stow

```
sudo apt install stow
```

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
