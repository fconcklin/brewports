#!/bin/bash 
# 
# Update installed package managers 

# todo: check for brew, only update if installed
brew update 
brew install `brew outdated`

# todo: check for macports, only update if installed 
sudo port selfupdate 

# todo: check for rvm, only update if installed
rvm get head 
