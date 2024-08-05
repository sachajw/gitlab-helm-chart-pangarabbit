#### zsh start ####
alias szsh='source ~/.zshrc'
alias ezsh='vi ~/.zshrc'
# .zshrc is sourced in interactive shells.
# It should contain commands to set up aliases,
# functions, options, key bindings, etc.
## auto complete
#allow tab completion in the middle of a word
setopt COMPLETE_IN_WORD
#colors
autoload -U colors
autoload -U +X bashcompinit && bashcompinit
autoload -U +X compinit && compinit
## never ever beep ever
setopt NO_BEEP
## allow inline comments
setopt INTERACTIVE_COMMENTS
## allow double single quotes to escape
setopt rcquotes
## treat $PROMPT as if it were a vanilla shell variable and it will be checked against for command substitution, parameter and arithmetic expansion
setopt PROMPT_SUBST
## keep background processes at full speed
setopt NOBGNICE
## restart running processes on exit
setopt HUP
## automatically decide when to page a list of completions
LISTMAX=0
## disable mail checking
MAILCHECK=0
## typeset -U path, where the -U stands for unique, tells the shell that it should not add anything to $path if it's there already.
typeset -U path
## history ##
## atuin history sync start ##
eval "$(atuin init zsh)"
## atuin history sync end ##
# Set history file location
export HISTFILE=~/.zsh_history
# More history in memory
export HISTSIZE=10000
# More history on disk
export SAVEHIST=10000
# ignore history
export HISTIGNORE='kubectl create secret*'
# export DOPPLER_TOKEN='dp.st.prd.xxxx'
export HISTIGNORE='export DOPPLER_TOKEN*'
# Append history incrementally
setopt INC_APPEND_HISTORY
# Ignore all duplicates
setopt HIST_IGNORE_ALL_DUPS
## history
setopt APPEND_HISTORY
## for sharing history between zsh processes
setopt SHARE_HISTORY
## Extended Globbing
setopt EXTENDED_GLOB
## Exclude from shell history
HISTORY_IGNORE="(doppler secrets set*)"
#### zsh end ####

#### doppler start ####
source <(doppler completion 2> /dev/null)
#### doppler end ####

#### cloud start ####
### aws start ###
## iam start ##
# granted start #
alias assume=". assume"
# granted end #
## iam end ##

## regions start ##
## af-south-1 ##
alias hackysack='ssh -i "~/.ssh/hacky-sack.pem" kali@ec2-13-245-7-104.af-south-1.compute.amazonaws.com'
## regions end ##

## code build ##
alias ccp='aws codebuild create-project --cli-input-json'
alias csb='aws codebuild start-build --project-name'
## code build end ##

## bastion ##
alias basinfra='aws-bastion -i i-0a4d6921083878c10 -p gsiinfra'
alias basnonprod='aws-bastion -i i-087943f8ce6109802 -p gsinonprod'
## bastion end ##

## eks start ##
alias awseks='aws eks --profile gsi update-kubeconfig --name adpk8s-infra-blue --region eu-central-1'
## eks end ##

## rds start ##
alias rdsreboot='aws rds reboot-db-instance --db-instance-identifier'
## rds end ##
### aws end ###

## azure start ##
## azure end ##

## gcp start ##
## gcp end ##
#### cloud end ####

#### shell start ####
## apple ##
alias amp='apple-music-presence'
## apple end ##

## column start ##
alias ct='column -t'
## column end ##

## clear screen start ##
alias c='clear'
## clear screen end ##

## date start ##
alias d='date +%F'
alias now='date +"%T"'
alias nowt=now
alias nowd='date +"%m-%d-%Y"'
## date end ##

## df start ##
alias df='df -hPT | column -t'
## df end ##

#### directories start ####
## jumpt to directories start ##
alias downloads='cd ~/Downloads'
alias documents='cd ~/Documents'
alias desktop='cd ~/Desktop'
alias music='cd ~/Music'
alias librarys='cd ~/Library'
alias movies='cd ~/Movies'
alias home='cd ~/'
alias lwd='cd -'
## jump to directories end ##

## mkdir start ##
# create parent directories on deman #
alias mkdir='mkdir -pv'
## mkdir end ##

## tvl repos start ##
alias aws='cd ~/Documents/repos/tvl/aws'
alias devsecops='cd ~/Documents/repos/tvl/devsecops'
alias iac='cd ~/Documents/repos/tvl/iac'
alias ortelius='cd ~/Documents/repos/tvl/devsecops/ortelius'
alias pangarabbit='cd ~/Documents/repos/tvl/pangarabbit'
alias pangarabbit-v2='cd ~/Documents/repos/tvl/pangarabbit-v2'
alias training='cd ~/Documents/repos/training'
alias tvl='cd ~/Documents/repos/tvl'
## tvl repos end ##

## i1 repos start ##
alias i1='cd ~/Documents/repos/i1'
## i1 repos end ##

## ww repos start ##
alias ww='cd ~/Documents/repos/ww'
## ww repos end ##

## directory jump start ##
alias ..='cd ..'
alias ...='cd ../../../'
alias ....='cd ../../../../'
alias .....='cd ../../../../'
alias .4='cd ../../../../'
alias .5='cd ../../../../..'
## directory jump end ##
#### directories end ####

## compression start ##
## tar start ##
alias untar='tar -xvzf'
alias listtar='tar -tzf'
alias dirtar='tar -xvzf -C':
alias createtar='tar -cvzf'
alias multitar='tar -cvf'
alias extracttar='tar -xvf'
## tar end ##
## compression end ##

## copy start ##
# confirmation #
#alias cp='cp -i'
# xcp copy on steriods #
alias cp='xcp'
## copy end ##

## diff so fancy start ##
alias dsf='diff-so-fancy'
## diff so fancy end ##

## symbolic link start ##
# confirmation #
alias ln='ln -i'
## symbolic link end ##

## file manipulation start ##
alias cpover='\cp'
alias mvover='\mv'
alias lnover='\ln'
## file manipulation end ##

## find start ##
alias findfile='find . -type f -name'
## find end ##

## grep start ##
# find if there are files containing a particular text #
alias gpri='grep -Pri'
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
## grep end ##

## jailer start ##
alias jailer='java -jar ~/Downloads/jailer/jailer.jar'
## jailer end ##

## jobs start ##
alias j='jobs -l'
## jobs end ##

## ls start ##
# listing with detail seperation #
alias ls='ls -lahF'
# long listing format #
alias ll='ls -lrta'
## ls end ##

## lsd start ##
alias ll='lsd -alF'
alias la='lsd -A'
alias ls='lsd --header --color=always --group-directories-first'
# show hidden files #
alias l.='lsd -d .* --color=auto'
alias tree='lsd --tree'
## lsd end ##

## mount start ##
alias mount='mount | column -t'
## mount end ##

#### networking start ####
## curl start ##
# get web server headers #
alias header='curl -I'
# find out if remote server supports gzip / mod_deflate or not #
alias headerc='curl -I --compress'
## curl end ##

## local ip start ##
alias lip="ifconfig -a | grep -o 'inet6\? \(addr:\)\?\s\?\(\(\([0-9]\+\.\)\{3\}[0-9]\+\)\|[a-fA-F0-9:]\+\)' | awk '{ sub(/inet6? (addr:)? ?/, \"\"); print }'"
## local ip end ##

## hostfile start ##
# edit hostfile #
alias hosts="sudo vi /etc/hosts"
## hostfile end ##

## ports start ##
# show open ports #
alias nstcp='netstat -tulanp tcp'
alias nsudp='netstat -tulanp udp'
alias nsnlt='netstat -nlt'
## ports end ##

## ping start ##
# stop after sending count ECHO_REQUEST packets
alias ping='ping -c 5'
# do not wait interval 1 second go fast
alias fastping='ping -c 100 -s.2'
## ping end ##

## ip tables ##
# shortcut  for iptables and pass it via sudo#
alias ipt='sudo /sbin/iptables'
# display all rules
alias iptlist='sudo /sbin/iptables -L -n -v --line-numbers'
alias iptlistin='sudo /sbin/iptables -L INPUT -n -v --line-numbers'
alias iptlistout='sudo /sbin/iptables -L OUTPUT -n -v --line-numbers'
alias iptlistfw='sudo /sbin/iptables -L FORWARD -n -v --line-numbers'
alias firewall='iptlist'
## ip tables end ##

## ip start ##
alias pub='curl ipinfo.io/ip'
alias digpub='dig myip.opendns.com @resolver1.opendns.com'
## ip end ##
# set default interfaces for sys admin related commands
# vnstat is console based network traffic monitor
# dnstop is console tool to analyse DNS traffic
# tcptrack and iftop commmands display infor about tcp/ip
# All of our servers eth1 is connected to the Internets via vlan / router etc
alias dnstop='dnstop -l 5  eth1'
alias vnstat='vnstat -i eth1'
alias iftop='iftop -i eth1'
alias tcpdump='tcpdump -i eth1'
alias ethtool='ethtool eth1'
# work on wlan0 by default
# Only useful for laptop as all servers are without wireless interface
alias iwconfig='iwconfig wlan0'
#### networking end ####

#### packaging start ####
# dpkg start #
alias dpkgi='sudo dpkg -i'
# dpkg end #
#### packaging end ####

#### permissions start ####
## permissions preserve root
alias chown='chown --preserve-root'
alias chmod='chmod --preserve-root'
alias chgrp='chgrp --preserve-root'
## permissions preserve root end
#### permissions end ####

## reboot | halt | poweroff start ##
alias reboot='sudo /sbin/reboot'
alias poweroff='sudo /sbin/poweroff'
alias halt='sudo /sbin/halt'
alias shutdown='sudo /sbin/shutdown'
## reboot | halt | poweroff end ##

## file and folder deletion ##
alias rm='safe-rm'
## file and folder deletion end ##

## sha ##
# test the checksum
alias sha='shasum -a 256 '
## sha end ##

## sudo start ##
alias root='sudo -i'
alias su='sudo -i'
# sudo cache
alias scache='sudo -v '
# who has sudo
alias slu='sudo -l -U '
## sudo end

#### system start ####
## system memory, cpu usage and gpu memory info ##
## pass options to free ##
alias meminfo='free -m -l -t'
## get top process eating memory ##
alias psmem='ps auxf | sort -nr -k 4'
alias psmem10='ps auxf | sort -nr -k 4 | head -10'
## get top process eating cpu ##
alias pscpu='ps auxf | sort -nr -k 3'
alias pscpu10='ps auxf | sort -nr -k 3 | head -10'
## get server cpu info ##
alias cpuinfo='lscpu'
## older system use /proc/cpuinfo ##
alias cpuinfo='less /proc/cpuinfo'
## get GPU ram on desktop / laptop ##
alias gpumeminfo='grep -i --color memory /var/log/Xorg.0.log'
## resume wget by default ##
alias wget='wget -c'
## other defaults ##

## df start ##
alias df='df -H'
## df end ##

#### disk usage start ####
alias du='dust'
#### disk usage end ####

## top is atop, just like vi is vim ##
alias top='atop'
##

## version & codename start ##
alias version='uname -a'
## version and codename end ##

#### system end ####

#### web server control start ####
# pass it via sudo so whoever is admin can reload it without calling you
alias nginxreload='sudo /usr/local/nginx/sbin/nginx -s reload'
alias nginxtest='sudo /usr/local/nginx/sbin/nginx -t'
alias lightyload='sudo /etc/init.d/lighttpd reload'
alias lightytest='sudo /usr/sbin/lighttpd -f /etc/lighttpd/lighttpd.conf -t'
alias httpdreload='sudo /usr/sbin/apachectl -k graceful'
alias httpdtest='sudo /usr/sbin/apachectl -t && /usr/sbin/apachectl -t -D DUMP_VHOSTS'
#### web server control end ###

#### shell end ####

#### bitwarden start ####
export ATLASSIAN_TOKEN='$(bws secret get 03284cd6-fe59-4c1e-9e26-b07b00d648cc | jq '.value')'
export BWS_ACCESS_TOKEN='0.bdb42419-c09d-4c7e-8875-b07b00d9289a.PebNBGFSuOmCoiZZ5H5MeXor8rtF35:X4rwfX0u4/bzgPE6jgrnbg=='
#export CLOUDSMITH_API_TOKEN='$(bws secret get b798726c-5392-45ca-8e73-b15d01004f15 | jq '.value')'
export CLOUDSMITH_API_TOKEN='b1e81125466803d4e550c7374e4a05df6697875c'
export CHATGPT_TOKEN='$(bws secret get ca9f22d2-efe2-49c9-b9f4-b081009f89e3 | jq '.value')'
export DEVOPS_TOKEN='$(bws secret get f374ab74-f93b-4448-a937-b0b600b1da0e | jq '.value')'
#export LOCALSTACK_API_KEY='$(bws secret get 8410d07b-d1f6-43e8-a6b6-b08100a8ecf7) | jq '.value')'
export LOCALSTACK_API_KEY='3aAxEvoaA3'
#### bitwarden end ####

#### crictl start ####
# export CONTAINER_RUNTIME_ENDPOINT='/Users/tvl/.config/crictl/crictl.yaml'
# export IMAGE_SERVICE_ENDPOINT='/Users/tvl/.config/crictl/crictl.yaml'
export CRI_CONFIG_FILE='/Users/tvl/.config/crictl/crictl.yaml'
#### crictl end ####

#### mob start ####
alias ms='mob start'
alias mn='mob next'
alias md='mob done'
alias moo='mob moo'
#### mob end ####

#### clustergit start ####
alias cg='clustergit'
alias cgexec='clustergit --execute'
alias cgall='clustergit --execute "git add . && git commit -t && git push"'
alias cgcap='clustergit --execute "git cap"'
alias cgnew='clustergit --execute "git new"'
alias cgimp='clustergit --execute "git imp"'
alias cgfix='clustergit --execute "git fix"'
alias cgrlz='clustergit --execute "git rlz"'
alias cgdoc='clustergit --execute "git doc"'
alias cgtst='clustergit --execute "git tst"'
alias cgbrk='clustergit --execute "git brk"'
alias cgmain='clustergit --execute "git checkout main"'
alias cgmaster='clustergit --execute "git checkout master"'
alias cgadd='clustergit --execute "git add ."'
alias cgcom='clustergit --execute "git commit -m"'
alias cgph='clustergit --push'
alias cgpl='clustergit --pull'
alias cgrm='clustergit --execute "git rm --cached -r . -f'
alias cgplhist='clustergit --execute "git pull --allow-unrelated-histories"'
alias cgfetch='clustergit --fetch'
alias cgfsck='clustergit && fsck'
#### clustergit end ####

#### diskutil start ####
alias dskl='diskutil list'
#### diskutil end ####

#### fluxcd start ####
#### fluxcd end ####

#### fsck start ####
alias fsck='fsck'
#### fsck end ####

#### gimlet start ####
alias gimsg='gimlet stack generate'
alias gimsu='gimlet stack update'
alias gimsuchk='gimlet stack update --check'
alias gimsc='gimlet stack configure'
#### gimlet end ####

#### git start ####
# git config
alias gcg='git config --edit --global'
alias gcl='git config --edit --local'
# git config end

# git status
alias gs='git status'
# git status end

# git push
alias gph='git push'
alias gphf='git push -f'
alias gpsu='git push --set-upstream origin'
# git push end

## git pull ##
alias gpl='git pull'
alias gplah='git pull --allow-unrelated-histories'
## git pull end ##

## git add start ##
alias gadd='git add .'
## git add end ##

## git checkout start ##
alias gcmr='git checkout master'
alias gcmn='git checkout main'
alias gcob='git checkout -b'
alias gco='git checkout'
## git checkout end ##

## git log ##
# Pretty log
alias glog='git log --graph --pretty=format:"%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset" --abbrev-commit'
# Log details compressed to one line
alias glog1='git log --oneline'
# Limits the number of commits to show to 2.
alias glog2='git log -2'
# Limits the number of commits to show to 3.
alias glog3='git log -3'
# Shows the commits that changed builtin/rev-list.c, including those commits that occurred before the file was given its present name.
# git log --follow builtin/rev-list.c
alias glogf='git log --follow'
alias glogfd='git log --full-diff'
alias glogsize='git log --log-size'
# show the whole commit history but skip any merges
alias glognm='git log --no-merges'
# Show all commits since version v2.6.12 that changed any file in the include/scsi or drivers/scsi subdirectories
# git log v2.6.12.. include/scsi drivers/scsi
alias glogversion='git log'
# Show the changes during the last two weeks to the file gitk. The -- is necessary to avoid confusion with the branch named gitk
alias glogsince2w='git log --since="2 weeks ago" -- gitk'
# Show the commits that are in the "test" branch but not yet in the "release" branch, along with the list of paths each commit modifies.
# git log --name-status release..test
alias glognsnp-pp='non-prod..pre-prod'
alias glognspp-p='pre-prod..main'
# Shows all commits that are in any of local branches but not in any of remote-tracking branches for origin (what you have that origin doesn’t).
alias glogbranchnotremoteorigin='git log --branches --not --remotes=origin'
# Shows all commits that are in local master but not in any remote repository master branches.
alias glognp='git log main --not --remotes=*/non-prod'
# Shows all commits that are in local master but not in any remote repository master branches.
alias glogpp='git log main --not --remotes=*/pre-prod'
# Shows all commits that are in local master but not in any remote repository master branches.
alias glogp='git log main --not --remotes=*/main'
# Shows the history including change diffs, but only from the “main branch” perspective, skipping commits that come from merged branches, and showing full diffs of changes introduced by the merges. This makes sense only when following a strict policy of merging all topic branches when staying on a single integration branch.
alias glogdiffsparent='git log -p -m --first-parent'
# Shows how the function main() in the file main.c evolved over time.
# git log -L '/int main/',/^}/:main.c
alias glogevolve='git log -L '/int main/',/^}/:main.c'
## git log end ##

## git diff start ##
alias gdf='git diff'
## git diff end ##

## git take out the garbage ##
alias gtgc='git gc'
## git take out the garbage end ##

## git prune start ##
alias gfrp='git fetch --all && git remote prune'
## git prune end ##

## git commit start ##
alias gcom='git commit'
alias gcomm='git commit -m'
alias gcoma='commitsubmodule.sh'
## git commit end ##

## git fetch ##
alias gfa='git fetch --all'
alias gfu='git fetch upstream'
## git fetch end ##

## git branch start ##
alias gb='git branch -a'
## git branch end ##

## git friendly delete start ##
alias gbd='git branch -d'
## git friendly delete end ##

## git angry delete start  ##
alias gbD='git branch -D'
## git angry delete end ##

## git clone start ##
alias gc='git clone'
alias gcm='git clone --mirror '
alias mc='multi-git-clone.sh *.list'
alias mc2='xargs -n1 git clone < repos.txt'
alias gremaup='git remote add upstream'
alias gphom='git push origin master'
alias gremv='git remote -v'
alias gremsuosshazt='git remote set-url origin git@github.developer.allianz.io:azt-grl/'
alias gremsuosslazt='git remote set-url origin https://github.developer.allianz.io/azt-grl/'
alias gremsuosshtad='git remote set-url origin git@github.developer.allianz.io/tad-azp/'
alias gremsuossltad='git remote set-url origin https://github.developer.allianz.io/tad-azp/'
alias gremsuogit='git remote set-url origin git@github.com:sachajw/'
## git clone end ##

## git whatchanged start ##
# Show as patches the commits since version v2.6.12 that changed any file in the include/scsi or drivers/scsi subdirectories
# git whatchanged -p v2.6.12.. include/scsi drivers/scsi
# git whatchanged --since="2 weeks ago" -- gitk
alias gwc='git whatchanged '
## git whatchanged end ##

## git restore start ##
alias grestore='git restore .'
## git restore end ##

## git reset start ##
# Reset the current branch to the last commit and discard all changes
alias grshard='git reset --hard HEAD^'
# Undo the last commmit and keep the changes as uncommitted
alias grssoft='git reset --soft HEAD^'
# Undo the last commit and keep the changes as modified int he working directory
alias grsmixed='git reset --mixed HEAD^'
## git reset end ##

## git remove start ##
alias grm='git rm'
alias grmf='git rm -f '
alias grmfc='git rm --cached -r . -f'
## git remove end ##

## git functions start ##
alias gcap='git cap'
alias gbuild='git build'
alias gci='git ci'
alias gch='git chore'
alias gdoc='git doc'
alias grev='git revert'
alias gsty='git style'
alias gnew='git new'
alias gimp='git imp'
alias gfix='git fix'
alias grel='git rel'
alias gref='git ref'
alias gtest='git test'
alias gbrk='git break'
## git functions end ##
#### git end ####

#### gitrp start ####
alias gitrs='gitr.sh status'
alias gitrpl='gitr.sh pull'
alias gitrps='gitr.sh push'
alias gitrall='gitr.sh add . && gitr.sh commit -m "initial commit" && gitr.sh push'
alias gitrf='gitr.sh fetch --all'
alias gitra='gitr.sh add . --all'
alias gitrcmr='gitr.sh checkout master'
alias gitrcmn='gitr.sh checkout main'
alias gitrcom='gitr.sh commit -m'
#### gitrp end ####

#### git quick stats ####
alias gqs='git-quick-stats'
# -r suggest code reviewers
alias gqsr='git-quick-stats -r'
# -T detailed list of git stats
alias gqsT='git-quick-stats -T'
# -R detailed list of git stats by branch
alias gqsR='git-quick-stats -R'
# -d displays a list of commits per day
alias gqsd='git-quick-stats -d'
# -m displays a list of commits per month
alias gqsm='git-quick-stats -m'
# -w displays a list of commits per weekday
alias gqsw='git-quick-stats -w'
# -o displays a list of commits per hour
alias gqso='git-quick-stats -o'
# -A displays a list of commits per hour by author
alias gqsA='git-quick-stats -A'
# -a displays a list of commits per author
alias gqsa='git-quick-stats -a'
# -S see your current daily stats
alias gqsS='git-quick-stats -S'
# -C see a list of everyone who contributed to the repo
alias gqsC='git-quick-stats -C'
# -b show an ASCII graph of the git repo branch history
alias gqsb='git-quick-stats -b'
# -D show branches by date
alias gqsD='git-quick-stats -D'
# -c see changelogs
alias gqsc='git-quick-stats -c'
# -L see changelogs by author
alias gqsL='git-quick-stats -L'
# -j save git log as a JSON formatted file to a specified area
alias gqsj='git-quick-stats -j'
# -h display this help text in the terminal
alias gqsh='git-quick-stats -h'
#### git quickstats end ####

#### history start ####
alias hs='history'
alias hsg='history grep -i'
#### history end ####

#### homebrew start ####
alias bup='brew update && brew upgrade'
alias bl='brew list'
alias bdeps='brew deps --tree installed'
alias bun='brew uninstall'
alias bar='brew autoremove'
alias bdoc='brew doctor'
alias bform='brew formula'
alias bclean='brew cleanup'
alias bout='brew outdated'
alias bprune='brew prune'
alias bre='brew reinstall'
alias bri='brew info'
alias buses='brew uses --installed'
alias bundle='brew bundle dump'
#### homebrew end ###

#### helm start ####
alias hlminstall='helm install'
alias hlmrepoadd='helm repo add'
alias hlmrepoindex='helm repo index'
alias hlmreporemove='helm repo remove'
alias hlmrepoupdate='helm repo update'
alias hlmsearch='helm search'
alias hlmsearchhub='helm search hub'
alias hlmlist='helm list'
alias hlmuninstall='helm uninstall'
alias hlmpull='helm pull'
alias hlmpulluntar='helm pull --untar'
alias hlmupgrade='helm upgrade'
alias hlmrollback='helm rollback'
alias hlmhist='helm history'
alias hlmpack='helm package'
alias hlmverify='helm verify'
# helm debugging
alias hlmlint='helm lint'
alias hlmtemp='helm template'
alias hlmdry='helm dryrun'
#### helm end

#### iac start ####
# terramate
alias tm='terramate'
export PATH="/Users/tvl/go/bin:$PATH"
# terramate end

# terraspace
alias ts='terraspace'
# terraspace end

# terraform
alias tfinit='terraform init'
alias tfp='terraform plan'
alias tfa='terraform apply'
alias tfd='terraform destroy'
# terraform end
#### iac end ####

#### k8s start ####
## variables ##
export KUBECONFIG_CONTEXT_DEADLINE="300"
export do="--dry-run=client -oyaml"
export now="--force --grace-period 0"
## apply ##
alias kaf='kubectl apply -f'
alias kak='kubectl apply -k'
alias kdf='kubectl delete -f'
## cluster ##
alias kci='kubectl cluster-info'
## context ##
alias kconset='kubectl config set-context --current --namespace '
alias kctxdevmgmt='kubectx arn:aws:eks:eu-central-1:705024100793:cluster/adpk8s-ec1-dev-mgmt'
alias kctxdevint='kubectx arn:aws:eks:eu-central-1:705024100793:cluster/adpk8s-ec1-dev-int'
alias kctxgsiinf='kubectx arn:aws:eks:eu-central-1:054819306458:cluster/adpk8s-infra-blue'
alias kctxgsinon='kubectx arn:aws:eks:eu-central-1:359426635176:cluster/adpk8s-nonprod-blue'
alias kctxtadshared='kubectx arn:aws:eks:eu-central-1:424602064546:cluster/adpk8s-ec1-shared-b'
alias kctxtaddev='kubectx arn:aws:eks:eu-central-1:397911151343:cluster/adpk8s-ec1-dev-b'
alias kctxtadle='kubectx arn:aws:eks:eu-central-1:347619616300:cluster/adpk8s-ec1-lowerenv-b'
alias kctxkind='kubectx kind-kind'
alias kctxcrp2='kubectx kind-crp2-in-a-box'
alias kctxortbox='kubectx kind-ortelius-in-a-box'
alias kctxort='kubectx kind-ortelius'
## copy ##
alias kcp='kubectl cp'
alias kcptools='kubectl cp "install-tools.sh" ubuntu-developer:/root/install-tools.sh'
## delete ##
alias kdelallpod='kubectl delete pods --all=true'
alias kdelallpodsns='kubectl delete pods --all-namespaces=true'
alias kdelpod='kubectl delete pods'
## deployment ##
alias kgdep='kubectl get deployment'
alias kdeldep='kubectl delete deployment'
alias kdesdep='kubectl describe deployment'
## updating resources ##
# manage the rollout of one or many resources.
# valid resource types include:
# deployments
# daemonsets
# statefulsets
# Rolling update "www" containers of "frontend" deployment, updating the image
alias ksimage='kubectl set image '
# Check the history of deployments including the revision
alias krollhist='kubectl rollout history deploy '
# Rollback to the previous deployment
alias krollundo='kubectl rollout undo deploy '
# Watch rolling update status of "frontend" deployment until completion
alias krollstatus='kubectl rollout status deploy  -w'
# Rolling restart of the "frontend" deployment
alias krollrestart='kubectl rollout restart deploy '
## pods ##
alias kdelp='kubectl delete pods'
alias kdesp='kubectl describe pods'
alias kgpod='kubectl get pods'
alias kgpodall='kubectl get pods --all-namespaces -owide'
alias kgpwide='kubectl get pods -o wide'
alias kgpodwc='kubectl get pods --no-headers | wc -l'
## etcd ##
# kubectl how long is it taking the apiserver to interact with etcd #
alias kgmer='kubectl get --raw /metrics | grep etcd_request'
# kubectl how big is the db #
alias kgmeoc='kubectl get --raw /metrics | grep etcd_object_counts'
## explain ##
alias kexp='kubectl explain pod --recursive'
## exec ##
alias kexub='kubectl exec -it ubuntu-developer -c ubuntu-developer  -- bash'
alias kexdeb='kubectl exec -it debian-developer -c debian-developer -- bash'
alias kexjen='kubectl exec -it jenkins-builder -c jenkins-builder -- bash'
alias kexora='kv exec -it oracle-db -c oracle-db -- bash'
## events ##
alias kge="kubectl get events --sort-by='.metadata.creationTimestamp'"
## ingress ##
alias kging='kubectl get ingress'
alias kgingr='kubectl get ingressroutes.traefik.io'
## jobs ##
alias kgjob='kubectl get job '
alias kdesjob='kubectl describe job '
alias kejob='kubectl edit job '
alias kdeljob='kubectl delete job '
## kubectl ##
alias kvs='kubectl version -short'
alias k='kubecolor'
alias kubectl='kubecolor'
alias kgall='kubectl get all'
alias kgcs='kubectl get componentstatus'
alias kapi='kubectl api-resources -o wide --sort-by name'
alias kgpallw='kubectl get pods -A -o wide'
## logs ##
alias klogs='kubectl logs '
alias klogsf='kubectl logs -f '
## namespaces ##
alias kgns='kubectl get ns'
alias kgnswc='kubectl get ns --no-headers | wc -l'
alias kdelns='kubectl delete ns '
## nodes ##
alias kgnodes='kubectl get nodes -owide'
alias kdesn='kubectl describe nodes '
alias kgnw='kubectl get nodes -owide'
alias kgnv='kubectl get nodes -v=10'
## port forward ##
alias kpf='sudo HOME=/home/sacha kubectl port-forward -n adp-istio-system svc/istio-ingaressgateway 443:443'
## pv ##
alias kgpv='kubectl get pv '
alias kdelpv='kubectl delete pv '
alias kdespv='kubectl describe pv '
## pvc ##
alias kgpvc='kubectl get pvc '
alias kdelpvc='kubectl delete pvc '
alias kdespvc='kubectl describe pvc '
## replicasets ##
alias kgrep='kubectl get replicaset '
alias kdesrep='kubectl describe replicaset '
alias kdelrep='kubectl delete replicaset'
## run and replace
alias krepff='kubectl replace --force -f'
alias krun='kubectl run '
alias krunbusy='kubectl run busybox --rm -it --image=busybox /bin/sh'
## secrets
alias kgsec='kubectl get secrets'
alias kdessec='kubectl describe secrets '
alias kesec='kubectl edit secrets '
alias kdelsec='kubectl delete secrets '
alias kcsec='kubectl create secret docker-registry regcred --docker-server=container-registry.oracle.com --docker-username=sacha.wharton@kubevisor.com --docker-password=YumMYtoOtH^784 --docker-email=sacha.wharton@kubevisor.com'
## service accounts ##
alias kgsa='kubectl get sa '
alias kdessa='kubectl describe sa'
alias kdelsa='kubectl delete sa '
## services ##
alias kgsvc='kubectl get svc '
alias kgsvcwc='kubectl get svc --no-headers | wc -l'
alias kdessvc='kubectl describe svc '
alias kdelsvc='kubectl delete svc '
## storage class ##
alias kgstorc='kubectl get sc '
alias kdesstorc='kubectl describe sc '
alias kdelstorc='kubectl delete sc '
## switcher
alias swns='switcher ns '
alias swct='switcher set-context '
alias swlist='switcher list-contexts'
## kubectl tail ##
alias ktail='kubectl tail'
## top nodes and pods ##
alias ktn='kubectl top nodes'
alias ktp='kubectl top pods'
#### k8s end ####

## kustomize start ##
alias kzcf='kustomize cfg fmt'
alias kzb='kustomize build'
## kustomize end ##

## kpt start ##
alias kptpt='kpt pkg tree'
alias kptfn='kpt fn'
alias kptfnren='kpt fn render'
alias kptli='kpt live init'
alias kptlapp='kpt live apply --reconcile-timeout=15m'
alias kptldest='kpt live destroy'
alias kptcf='kpt cfg fmt'
## kpt end ##

## krew start ##
alias krewin='kubectl install'
## krew end ##
#### k8s end ####

#### localstack start ####
alias lskver='localstack --version'
alias lskdeb='localstack --debug'
alias lskhelp='localstack --help'
alias lskprof='localstack --profile'
alias lsklogin='localstack login'
alias lsklogout='localstack logout'
alias lskupd='localstack update'
alias lskconf='localstack config'
alias lskstart='localstack start'
alias lskstop='localstack stop'
alias lskwait='localstack wait'
alias lskstatus='localstack status'
alias lskdaem='localstack daemon'
alias lskdns='localstack dns'
alias lskdnsup='localstack dns-update'
alias lskdnsdel='localstack dns-delete'
alias lskdnsadd='localstack dns-add'
alias lskdnslist='localstack dns-list'
alias lskdnsresolve='localstack dns-resolve'
alias lskdnssearch='localstack dns-search'
alias lskdnsupdate='localstack dns-update'
alias lskdnsupdateip='localstack dns-update-ip'
alias lskdnsupdateipv6='localstack dns-update-ipv6'
alias lskdnsupdateipv4='localstack dns-update-ipv4'
alias lskext='localstack extensions'
alias lskpod='localstack pod'
alias lskreset='localstack reset'
alias lskssh='localstack ssh'
# localstack tflocal
alias tfli='tflocal init'
alias tfla='tflocal apply -auto-approve'
alias tflp='tflocal plan'
alias tfld='tflocal destroy -auto-approve'
# localstack awslocal
alias awslocal="AWS_ACCESS_KEY_ID=fake AWS_SECRET_ACCESS_KEY=fake AWS_DEFAULT_REGION=${DEFAULT_REGION:-$AWS_DEFAULT_REGION} aws --endpoint-url=http://${LOCALSTACK_HOST:-localhost}:4566"
#### localstack end ####

#### slack start ####
alias slack='slack-term-linux-amd64'
#### slack end ####

#### ssh start ####
## pangarabbit lair of the leopard start ##
#alias pi01='ssh -i ~/.ssh/pinodes tvl@192.168.0.48'
#alias pi02='ssh -i ~/.ssh/pinodes tvl@192.168.0.107'
#alias pi03='ssh -i ~/.ssh/pinodes tvl@192.168.0.141'
alias pi01='mosh --ssh="ssh -i ~/.ssh/pinodes" tvl@192.168.0.48'
alias pi02='mosh --ssh="ssh -i ~/.ssh/pinodes" tvl@192.168.0.107'
alias pi03='mosh --ssh="ssh -i ~/.ssh/pinodes" tvl@192.168.0.141'
alias syno='mosh --ssh="ssh -i ~/.ssh/syno-walle" walle@192.168.0.152'
## pangarabbit lair of the leopard start ##
## i1 solutions zerotier end ##
alias m8s01zt='ssh -i ~/.ssh/i1-all tvl@192.168.191.223'
alias m8s02zt='ssh -i ~/.ssh/i1-all tvl@192.168.191.179'
alias m8s03zt='ssh -i ~/.ssh/i1-all tvl@192.168.191.166'
alias nfs01zt='ssh -i ~/.ssh/i1-wg tvl@192.168.191.243'
## i1 solutions zerotier end ##
## i1 solutions wireguard end ##
alias m8s01wg='ssh -i ~/.ssh/i1-wg tvl@10.20.0.160'
alias m8s02wg='ssh -i ~/.ssh/i1-wg tvl@10.20.0.161'
alias m8s03wg='ssh -i ~/.ssh/i1-wg tvl@10.20.0.162'
alias nfs01wg='ssh -i ~/.ssh/i1-wg tvl@10.20.0.166'
## i1 solutions wireguard end ##
## aws eu-central-1 ##
alias crp2='ssh -i "~/.ssh/crp2.pem" "ec2-user@ec2-13-245-172-130.af-south-1.compute.amazonaws.com"'
#alias ssh="assh wrapper ssh --"
#### ssh end ####

#### podman ####
# switch to podman
#alias docker='podman'
# search
alias psapp='podman search {app_name}'
alias psregimagename='podman search registry_name/{image_to_name}'
alias pscurl='podman search curl'
# Limit search for the number of results (default is 25)
alias pslimit='podman search --limit 5 php8'
# Only search for docker.io registry curl image
alias psdocker='podman search docker.io/curl'
# List the available tags in the repository for the specified image
alias pslisttags='podman search --list-tags curlimages/curl'
# Only search for the official nginx image
alias psfilteroofficial='podman search --filter=is-official'
#### podman end ####

#### pre-commit start ####
alias pcinstall='pre-commit install'
alias pcuninstall='pre-commit uninstall'
alias pcall='pre-commit run --all-files'
alias pcup='pre-commit autoupdate'
#### pre-commit end ####

#### quirky start ####
## train ##
alias sl='sl'
alias sla='sl -a'
alias sll='sl -l'
alias slf='sl -F'
alias sle='sl -e'
## matrix ##
alias matrix='cmatrix'
## fire ##
alias fire='aafire'
# fortune
alias fortune='fortune'
# oneko
#alias oneko='oneko'
#alias onekog='oneko -dog'
# toilet
alias toilet='toilet'
# cow say
alias cowsay='cowsay'
# fake identity
alias rig='rig'
# asciiquarium
alias fish='asciiquarium'
#### quirky end ####

## topgrade start ##
alias tg='topgrade --disable system'
## topgrade end ##

## weather start ##
alias weather='curl wttr.in/cape+town'
## weather end ##

## vim start ##
alias vi='vim'
## vim end ##

## warp start ##
alias cb='clear blocks'
alias ytg='yadm date && tg'
## warp end ##

#### yadm dotfiles start ####
alias yhome='cd .local/share/yadm'
alias ys='yadm status'
alias yadd='yadm add .'
alias ycomm='yadm commit -m'
alias ycom='yadm commit'
alias yph='yadm push'
alias ypl='yadm pull'
alias yc='yadm clone'
alias yfsck='yadm fsck'
alias ypsu='yadm push --set-upstream origin'
alias yrm='yadm rm --cached -r . -f'
alias ylist='yadm list -a'
alias ygc='yadm gc'
alias ygcprune='yadm gc --prune'
alias yl1='yadm log --oneline'
alias ylog='yadm log --graph --pretty=format:"%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset" --abbrev-commit'

## yadm reset start ##
# Reset the current branch to the last commit and discard all changes
alias yrshard='yadm reset --hard HEAD^'
# Undo the last commmit and keep the changes as uncommitted
alias yrssoft='yadm reset --soft HEAD^'
# Undo the last commit and keep the changes as modified int he working directory
alias yrsmixed='yadm reset --mixed HEAD^'
## yadm reset end ##

## yadm functions start ##
alias ycap='yadm cap'
alias ynew='yadm new'
alias yimp='yadm imp'
alias yfix='yadm fix'
alias yrel='yadm rel'
alias ydoc='yadm doc'
alias ytest='yadm test'
alias ybrk='yadm break'
alias ydate='yadm date'
## yadm functions end ##
#### yadm end ####

#### PATHING AND CONFIGS ####
#### globals start ####
export PATH="$PATH/bin/:$PATH"
export PATH="$PATH/opt/homebrew/bin/:$PATH"
export PATH="$PATH/opt/homebrew/Cellar:$PATH"
#### globals end ####

#### cargo start ####
export PATH="$PATH:/opt/homebrew/bin/cargo"
#### cargo end ####

#### devbox start ####
eval "$(devbox global shellenv --init-hook)"
#### debbox end ####

#### docker start ####
export DOCKER_LOCAL_NAME=tvlreg
export DOCKER_ECR_TAG=latest
#### docker end ####

#### fluxcd start ####
# Enable flux completion
command -v flux >/dev/null && . <(flux completion zsh)
#### fluxcd end ####

#### github start ####
export GITHUB_SECRET="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"
export EMAIL_REPORTER_SMTP_PASSWORD="Litigator-Scribing-Playpen2"
#### github end ####

#### granted start ####
export GRANTED_ENABLE_AUTO_REASSUME=true
#### granted end ####

#### homebrew start ####
export PATH="$PATH:/opt/homebrew/bin"
# auto complete
if type brew &>/dev/null
then
  FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"
  autoload -Uz compinit
  compinit
fi
# auto complete end
eval "$(/opt/homebrew/bin/brew shellenv)"
export PATH="$PATH:/opt/homebrew/sbin"
#### homebrew end ####

#### fzf start ####
eval "$(fzf --zsh)"
#### fzf end ####

#### IBM start ####
# ibm app connect
export MQSI_WORKPATH="/Users/tvl/IBM/Contents/mqsi/server/bin"
export MQSI_PROFILE="/Users/tvl/IBM/Contents/mqsi/server/bin/mqsiprofile"
source /Users/tvl/IBM/Contents/mqsi/server/bin/mqsiprofile
# maven ibm ace plugin
export toolkitInstallDir="/Users/tvl/IBM/Contents/mqsi/server/bin"
export aceRunDir="/Users/tvl/IBM/Contents/mqsi/server/bin"
#### IBM end ####

#### java start ####
export JAVA_HOME='/opt/homebrew/opt/java'
#### java end ####

#### k8s start ####
## vars start ##
export dry="--dry-run=client -o yaml"
export now="--force --grace-period 0"
## vars end ##
#### k8s end ####

## krew start ##
export PATH="$PATH:${KREW_ROOT:-$HOME/.krew}/bin"
## krew end ##

#### localstack  start ####
export PERSISTENCE=1
export IMAGE_NAME=localstack/localstack-pro
#### localstack end ####

#### mise start ####
eval "$(/opt/homebrew/bin/mise activate zsh)"
#### mise end ####

#### nvm start ####
export NVM_DIR="$HOME/.nvm"
## this loads nvm
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"
## this loads nvm bash_completion
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"
#### nvm end ####

#### openssl start ###
export CRYPTOGRAPHY_OPENSSL_NO_LEGACY=1
#### openssl end ####

#### pnpm start ####
#export PNPM_HOME="/Users/tvl/Library/pnpm"
export PATH="$PATH:$PNPM_HOME"
export PATH="$PATH:/opt/homebrew/lib/node_modules/npm"
#### pnpm end ####

#### pulumi ####
## add pulumi to the PATH
#export PATH=$PATH:$HOME/.pulumi/bin
##### pulumi end ####

#### python start ####
export PATH="$PATH:/opt/homebrew/opt/python@3.12/libexec/bin"
## pipx start ##
export PATH="$PATH:/opt/homebrew/python@3.12/libexec/bin"
## pipx end ####
## poetry dependency management start ##
fpath+=~/.zfunc
## poetry dependency management end ##
#### python end ####

#### ruby gems start ####
export LDFLAGS="-L/opt/homebrew/opt/ruby/lib"
export CPPFLAGS="-I/opt/homebrew/opt/ruby/include"
export PKG_CONFIG_PATH="/opt/homebrew/opt/ruby/lib/pkgconfig"
#export PATH="/Users/tvl/.gem/ruby/2.6.0/bin:$PATH"

if [ -d "/opt/homebrew/opt/ruby/bin" ]; then
  export PATH="$PATH:/opt/homebrew/opt/ruby/bin"
  export PATH="$PATH:`gem environment gemdir`/bin"
fi
#### ruby gems end ####

#### uname start ####
export KERNEL_NAME=$( uname | tr '[:upper:]' '[:lower:]' )
#### uname end ####

#### sdkman start ####
export SDKMAN_DIR="/Users/tvl/.sdkman"
source "$HOME/.sdkman/bin/sdkman-init.sh"
#### sdkman end ####

#### starship  start ####
eval "$(starship init zsh)"
#export PATH="/opt/homebrew/bin/starship:$PATH"
#### starship end ####

#### stern start ####
source <(stern --completion=zsh)
#### stern end ####

#### surge start ####
#export all_proxy=socks5://192.168.0.8:6153
#export all_proxy=socks5://127.0.0.1:6153
#### surge end ####
#### terramate start ####
complete -o nospace -C /opt/homebrew/bin/terramate terramate
#### terramate end ####

#### the fuck ####
eval $(thefuck --alias)
#### the fuck end ####

#### vscode start ####
export PATH="$PATH:/opt/homebrew/bin/code"
#### vscode end ####

#### wireguard ####
alias wgup='sudo wg-quick up wg0'
alias wgdown='sudo wg-quick down wg0'

#### yarn start ####
#export PATH="$PATH:/opt/homebrew/Cellar/yarn"
## yarn completion start ##
#export PATH="$(yarn global bin):$PATH"
## yarn completion end
#### yarn end ####

#### zoxide  start ####
eval "$(zoxide init zsh)"
#### zoxide end ####
