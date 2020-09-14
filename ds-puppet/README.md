# ds-puppet

ds-puppet is a shell script that allows getting whole Datastore puppet env (configuration and our modules) deployed locally. It can also be used to pull changes for all (configuration + modules) or only some elements of "branch".

## Installation
### Clone
Clone this repo to `/any/dir/you/want` at your computer.

### Alias
Edit your `~/.bash_aliases` and add for example
```bash
alias ds-puppet="/any/dir/you/want/ds-puppet.sh"
```
Alternatives: `install` script or symlink it to `/usr/local/bin` - it's up to you.

## Config(uration)
### Local settings
```bash
$ cp /any/dir/you/want/config/local_settings{.sample,}
$ cat /any/dir/you/want/config/local_settings
datadir="/path/to/existing/directory/where/envs/should/be/deployed"
```
For `datadir` set directory where you want to store cloned repositories.
### Remote settings
This file will need to be edited only if we'll change something for DS envs. Send a MR if you find something that needs to be changed!

## Usage
### init
```bash
$ ds-puppet bigdatalab init
Working with env 'bigdatalab'

Cloning into 'configuration'...
remote: Enumerating objects: 3641, done.
remote: Counting objects: 100% (3641/3641), done.
remote: Compressing objects: 100% (1115/1115), done.
remote: Total 3641 (delta 2692), reused 3395 (delta 2487)
Receiving objects: 100% (3641/3641), 385.08 KiB | 0 bytes/s, done.
Resolving deltas: 100% (2692/2692), done.
Cloning into 'azkaban'...
remote: Enumerating objects: 1655, done.
(...)
Cloning into 'zookeeper'...
remote: Enumerating objects: 216, done.
remote: Counting objects: 100% (216/216), done.
remote: Compressing objects: 100% (128/128), done.
remote: Total 216 (delta 92), reused 184 (delta 69)
Receiving objects: 100% (216/216), 23.50 KiB | 0 bytes/s, done.
Resolving deltas: 100% (92/92), done.
```
Script is getting `configuration` repository, reads `Puppetfile` and gets all our modules as a final step.
### update all
```bash
$ ds-puppet update bigdatalab
Working with env 'bigdatalab'

Pulling changes for configuration
Already up-to-date.

Pulling changes for azkaban
Already up-to-date.
(...)
Pulling changes for zookeeper
Already up-to-date.
```
### update only what you want
```bash
$ ds-puppet update bigdatalab configuration datastore roles flink
Working with env 'bigdatalab'

Pulling changes for configuration
Already up-to-date.
Pulling changes for datastore
Already up-to-date.
Pulling changes for roles
Already up-to-date.
Pulling changes for flink
Already up-to-date.
```
### update without specifiny branch ("current dir mode")
When in directory for one of envs it's possible to use . (single dot) instead of env name. It also works for repo/module if inside one of them (check examples below). Environment (branch) and repository/repositories names will be computed by script.
```bash
$ pwd
/home/example/workshop/repos/ds_puppet/bigdatalab
$ ds-puppet update .
Working with env 'bigdatalab'

Pulling changes for configuration
Already up-to-date.

Pulling changes for azkaban
Already up-to-date.
(...)
Pulling changes for zookeeper
Already up-to-date.
```
It will pick up correct repo and repo only - it will ignore if you're one of repos subdirs.
```bash
$ pwd
/home/borys/workshop/repos/ds_puppet/bigdatalab/configuration/hieradata
$ ds-puppet update .
Working with env 'bigdatalab'

Pulling changes for configuration
Already up-to-date.
```
If you'll specify repo(s) on command-line it will take precedence over repo computed from where you're at the moment.
```bash
$ pwd
/home/borys/workshop/repos/ds_puppet/bigdatalab/configuration
$ ds-puppet update . flink
Working with env 'bigdatalab'

Pulling changes for flink
Already up-to-date.
```
