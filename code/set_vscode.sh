DOTPATH="${HOME}/dotfiles/code"
ln -s $DOTPATH/settings.json $HOME/Library/Application\ Support/Code/User/settings.json

cat ./extensions | while read line
do
 code --install-extension $line
done
