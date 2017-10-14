#https://help.github.com/articles/changing-author-info/
repo_name="$1"
repo_path="$2"

git clone --bare $repo_path

cd $repo_name



git filter-branch --env-filter '
OLD_EMAIL="$3"
CORRECT_NAME="$4"
CORRECT_EMAIL="$5"
if [ "$GIT_COMMITTER_EMAIL" = "$OLD_EMAIL" ]
then
    export GIT_COMMITTER_NAME="$CORRECT_NAME"
    export GIT_COMMITTER_EMAIL="$CORRECT_EMAIL"
fi
if [ "$GIT_AUTHOR_EMAIL" = "$OLD_EMAIL" ]
then
    export GIT_AUTHOR_NAME="$CORRECT_NAME"
    export GIT_AUTHOR_EMAIL="$CORRECT_EMAIL"
fi
' --tag-name-filter cat -- --branches --tags

git push --force --tags origin 'refs/heads/*'

echo "######"
echo  ""
echo ""
echo "Done and Done:"
echo " - now rememmber to purge this folder"
echo ""
echo "######" 

