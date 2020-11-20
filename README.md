# dotfiles

## Install

```shell
/bin/sh $(curl -fsSL https://raw.githubusercontent.com/iwai/dotfiles/master/setup.sh)
```

## anyenv

```shell
anyenv install goenv
anyenv init - bash > ~/.anyenv-init-bash
```

```
brew install bzip2 libiconv icu4c libedit tidy-html5 libzip

env PHP_BUILD_CONFIGURE_OPTS="--with-bz2=/usr/local/opt/bzip2 --with-iconv=/usr/local/opt/libiconv" \
    PKG_CONFIG_PATH="/usr/local/opt/openssl@1.1/lib/pkgconfig:/usr/local/opt/icu4c/lib/pkgconfig:/usr/local/opt/libedit/lib/pkgconfig" \
    phpenv install 7.4.9
```

### Knowledge


```
> nodenv rehash
nodenv: cannot rehash: /Users/your/.anyenv/envs/nodenv/shims/.nodenv-shim exists

# If you get a dot file existence error in rehash, remove it.
> rm /Users/your/.anyenv/envs/nodenv/shims/.nodenv-shim
```

## LSP

```shell
npm install -g intelephense
composer global install

cd .config/composer
composer run-script --working-dir=vendor/felixfbecker/language-server parse-stubs
```

## Clean-up `PATH` variable

Bashからfishを起動する場合、それぞれで path\_helper が実行されるため、 .profile や .bash\_profile で設定した内容が、変更されおかしくなる問題を回避するため
path\_helper 実行前に一度、掃除してから実行するようにする

```
# System-wide .profile for sh(1)

if [ -x /usr/libexec/path_helper ]; then
        PATH=""
        eval `/usr/libexec/path_helper -s`
fi

if [ "${BASH-no}" != "no" ]; then
        [ -r /etc/bashrc ] && . /etc/bashrc
fi
```

http://www.softec.lu/site/DevelopersCorner/MasteringThePathHelper


## Xcode Command line tools

Install from https://developer.apple.com/download/more/
