#!/bin/bash 
# 
# Update installed package managers 

# todo: check for brew, only update if installed

installed()
{
    command -v $1 >/dev/null 2>&1
}

check_homebrew()
{
    echo "checking for homebrew"
    if [ $installed "brew" ]; then
	echo "found homebrew"
	echo "updating brew"
	brew update 
	echo "upgrading brew packages"
	brew install `brew outdated`
    else 
	echo "homebrew not found. skipping"
    fi 
}

check_macports()
{
    echo "checking for macports"
    if [ $installed "port" ]; then 
	echo "macports found"
	echo "updating macports"
	sudo port selfupdate 
    else
	echo "macports not found. skipping."
    fi
}

check_rvm()
{
    echo "checking for rvm"
    if [ $installed "rvm" ]; then
	echo "rvm found" 
	echo "updating rvm"
	rvm get head 
    else 
	echo "rvm not found. skipping."
    fi
}

run()
{
    check_homebrew
    check_macports
    check_rvm
}

run 
