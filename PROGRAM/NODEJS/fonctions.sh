#!/bin/bash
source variables.sh

###  pause 
pause(){
    echo "Appuyer sur une touche pour continuer!"
    read x
}
####################### Fonction de création de fichiers ###############
makefiles(){

ARRAY=( "intro" "back-end" "node works" "async" "express" "mongodb" "mongoose" "errors" "auth" "data"
        "rendering" "advanced" "deployement"
)

for i in "${!ARRAY[@]}"
do  
     dir=`echo  ${ARRAY[$i]} | tr 'a-z' 'A-Z'`
     if  (( $i < 10 )) && [[ ! -e "0"+$i-${ARRAY[$i]}.sh ]];then
        
        mkdir "0$i-$dir"
        echo " touching file => ${ARRAY[$i]}"       
        echo "#!/bin/bash" > "0$i-${ARRAY[$i]}.sh"
        mv "0$i-${ARRAY[$i]}.sh"  "0$i-$dir"
     elif (( $i > 9 )) && [[ ! -e $i-${ARRAY[$i]}.sh ]] ; then
        mkdir "$i-$dir"
        touch $i-${ARRAY[$i]}.sh
        echo "#!/bin/bash" > $i-${ARRAY[$i]}.sh
        mv "$i-${ARRAY[$i]}.sh" "$i-$dir"
      else
           echo "Making directory ${ARRAY[$i]}, skipped..."
          sleep 1
          echo "touching file ${ARRAY[$i]}, skipped..."
      fi
     
done

}

####################### DEBUT INSTALLATION  ############################
etape=1
# var="ls $dir"
intro(){
    echo "======================================================="
    echo "          Lancement du program $dir"
    echo "    |====>                                   <=====|   "
    echo ""
    sleep 2 
    for filename in 0* 1* 
    do 
         echo "=================================================="
         echo -n "STEP n°$etape"
         echo ""
         echo -n " |===>  "; echo $filename | cut -d "-" -f 2 | cut -d "." -f 1  | awk '{ print toupper($0) }'         
         echo "=================================================="
         ((etape++))
    done

}
procedure(){
    echo -n "
    Choose the step to install,
    When you choose one step, 
    please make sure all previous step have been already done!
    
    "
    #echo -n "You can check the step by choosing CHECK STEP!"

    echo ""
    select filename in 0* 1* 
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
####################### FIN INSTALLATION  ############################
