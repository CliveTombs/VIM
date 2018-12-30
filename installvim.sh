#!/bin/bash
#
echo " Script by Clive Tombs to compile, install vim with Python3 support addons through"
echo " Pathogen"
sleep 5
echo "Checking for pip. You will need pip!"
pip --version
read -p "Press enter to continue"
echo "Checking for git"
git --version
read -p "Press enter to continue"
sudo apt-get install libncurses5-dev libncursesw5-dev
echo "Install vim"
cd /tmp && git clone https://github.com/vim/vim.git && cd vim
./configure --enable-python3interp --with-features=huge
make && sudo make install
mkdir -p $HOME/bin
cd $HOME/bin
ln -s $HOME/opt/vim/bin/vim
which vim
vim --version
sleep 10
echo "install features -" 
echo "Setup Pathogen"
mkdir -p ~/.vim/autoload ~/.vim/bundle ~/.vim/ftplugin
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
echo "Install powerline"
cd ~/.vim/bundle
git clone git://github.com/Lokaltog/vim-powerline.git
#
echo "Install ctrlp"
cd ~/.vim/bundle
git clone https://github.com/kien/ctrlp.vim.git
#
echo "Install python-mode"
cd ~/.vim/bundle
git clone https://github.com/klen/python-mode
#
echo "Install ftplugin"
wget -O ~/.vim/ftplugin/python_editing.vim http://www.vim.org/scripts/download_script.php?src_id=5492
#
echo "Install the .rcfile"
wget -O ~/.vimrc https://raw.githubusercontent.com/CliveTombs/VIM/master/.vimrc
echo "Install supporting pycode."
pip install pylama --user
pip install linters --user
