#!/bin/bash
############################  BEGINING OF VARIABLES ##############################
evalSSH(){
eval $(ssh-agent -s)
ssh-add ~/.ssh/gitpush
cat ~/.ssh/gitpush.pub
}
############################  END OF  VARIABLES ##################################

addingGit(){
#if [[ ! -f .git ]]
#then
 #       git init
#else
        git status
        echo "Enter file to send : "
        echo -n "Choose to 'pull git' or 'push to git' ?
                pg=pullGit,
                ptg=pushToGit"

        echo ""
        read -p "|==> " x
        if [[ $x == "pg"  ]]
        then
                echo "|Pull from git >> "
                git pull git@github.com:OusmanaTraore/scripts.git
        elif [[ $x == "ptg"  ]]
        then
                echo  "Push to git ? , yes or NO! "
                read -p "|==> " pushGit
                        if [[ $pushGit == "yes"  ]] || [[ $pushGit == "y"  ]] || [[ $pushGit == "o"  ]]
                        then
                                echo "Add files to push : file1 file2 ..."
                                read -p "|==> " file
                                git config --global user.name "Ousmana Traore"
                                git config --global user.email "traoreosman@yahoo.fr"
                                for i in $file
                                do
                                git add $i
                                done
                                testGit=$(git remote -v | grep  git@github.com:OusmanaTraore/scripts.git)
                                addingRemote=$(echo $testGit | cut -d " " -f2)
                                        if [[ ! $testGit  ]]
                                        then 
                                                echo " |==> Adding remote : $addingRemote  >>"
                                                git remote add origin $addingRemote
                                        else 
                                                echo " |==> Remote :  >>"
                                                echo $testGit
                                        fi
                                git commit -m "adding $file to repository"
             
                                sleep 2
                    
                                echo " |==> CHECKING SSHKEY ... >> "
                                sleep 2
                                        if [[ ! -f ~/.ssh/gitpush.pub ]]
                                        then
                                                echo " |==> GENERATING SSHKEY... >>"
                                                ssh-keygen -t ed25519 -N '' -f ~/.ssh/gitpush
                                                evalSSH
                                                echo " add the key to your repository , then press key to continue"
                                                read -p " |==> " k
                                        else
                                                echo " |==> SSHKEY FOUND... >>"
                                                evalSSH
                                        fi
                                sleep 2
                                echo "|Push to git \"script\"  repository >>"
                                git push -u origin master
                                else
                                        echo "You choose not to push in git repository"
                                fi
        else
        echo "Sorry you pressed wrong key !!!"
        fi
#fi
}

addingGit

