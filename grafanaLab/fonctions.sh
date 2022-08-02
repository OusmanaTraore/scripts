###  pause 
pause(){
    echo "Appuyer sur une touche pour continuer!"
    read x
}
####################### DEBUT INSTALLATION GRAFANALAB ############################
intro(){
echo "| Begining of installation ..."
sleep 2
    for filename in 0*
    do 
         echo "========================================="
         echo -n "ETAPE n° "$filename | cut -d "-" -f 1
         echo -n " |===>  "; echo $filename | cut -d "-" -f 2 | cut -d "." -f 1  | awk '{ print toupper($0) }'
         echo "========================================="
         echo "|====|"
    done
bash intro.sh
}
procedure(){
    echo -n "
    Choose the step to install,
    When you choose one step, 
    please make sure all previous step have been already done!
    
    "
    echo -n "You can check the step by choosing CHECK STEP!
    "
    echo ""
    select filename in 0* CHECK_STEP
    do
        echo "$filename"
        bash $filename
    done
}

addingGit(){
    if [[ ! -f .git ]]
    then
        git init
    fi
        echo -n "Choose to 'pull git' or 'push to git' ? 
        pg=pullGit, 
        pgt=pushToGit"

        echo ""
        read -p "|==> " x
        if [[ $x == "pg"  ]] 
        then 
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
            
            git remote add origin git@github.com:OusmanaTraore/scripts.git
            git commit -m "adding $file to repository"
            ###
            sleep 2
            echo " |==> GENERATING SSHKEY"
            ssh-keygen -t ed25519 -N '' -f ~/.ssh/gitpush
            eval $(ssh-agent -s)
            ssh-add ~/.ssh/gitpush
            cat ~/.ssh/gitpush.pub
            echo " add the key to your repository , then press key to continue" 
            read -p " |==> " k

            sleep 2 
            git push -u origin master
            else
            echo "You choose not to push in git repository"
            fi
        else 
            echo "Sorry you pressed wrong key !!!"
        fi

}
####################### FIN INSTALLATION GRAFANALAB ############################
