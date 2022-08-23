echo "installing prezto..."
git clone --recursive \
    https://github.com/sorin-ionescu/prezto.git \
    $HOME/.zprezto

echo "setting up prezto..."
cd ~/.zprezto/runcoms
rm -rf z*

DOTPATH="${HOME}/dotfiles"

ln -s $DOTPATH/.gitconfig $HOME/.gitconfig &&
ln -s $DOTPATH/.p10k.zsh $HOME/.p10k.zsh &&
ln -s $DOTPATH/.zlogin $HOME/.zlogin &&
ln -s $DOTPATH/.zlogout $HOME/.zlogout &&
ln -s $DOTPATH/.zpreztorc $HOME/.zpreztorc &&
ln -s $DOTPATH/.zprofile $HOME/.zprofile &&
ln -s $DOTPATH/.zshenv $HOME/.zshenv &&
ln -s $DOTPATH/.zshrc $HOME/.zshrc

ln -s $DOTPATH/.zlogin $HOME/.zprezto/runcoms/zlogin &&
ln -s $DOTPATH/.zlogout $HOME/.zprezto/runcoms/zlogout &&
ln -s $DOTPATH/.zpreztorc $HOME/.zprezto/runcoms/zpreztorc &&
ln -s $DOTPATH/.zprofile $HOME/.zprezto/runcoms/zprofile &&
ln -s $DOTPATH/.zshenv $HOME/.zprezto/runcoms/zshenv &&
ln -s $DOTPATH/.zshrc $HOME/.zprezto/runcoms/zshrc

echo "prezto installed!!!"
