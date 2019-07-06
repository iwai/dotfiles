#!/usr/bin/env bash

DIST=$(awk '/DISTRIB_ID=/' /etc/*-release | sed 's/DISTRIB_ID=//')

# sh -c "$(curl -fsSL https://raw.githubusercontent.com/Linuxbrew/install/master/install.sh)"
