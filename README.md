# dotfiles

## Install

```shell
/bin/sh $(curl -fsSL https://raw.githubusercontent.com/iwai/dotfiles/master/setup.sh)
```

## anyenv

```shell
anyenv install goenv
anyenv init - fish > ~/._dotfiles/.config/fish/conf.d/anyenv.fish
```

## LSP

```shell
npm install -g intelephense
composer global install

cd .config/composer
composer run-script --working-dir=vendor/felixfbecker/language-server parse-stubs
```
