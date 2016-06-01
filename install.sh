sudo apt-add-repository ppa:numix/ppa
sudo add-apt-repository ppa:tualatrix/ppa
sudo add-apt-repository ppa:ubuntu-desktop/ubuntu-make
sudo add-apt-repository ppa:freyja-dev/unity-tweak-tool-daily
sudo apt-get -qq update
sudo apt-get -qq install -y mono-complete
sudo apt-get -qq install -y golang
sudo apt-get -qq install -y zsh
sudo apt-get -qq install -y numix-icon-theme numix-icon-theme-circle
sudo apt-get -qq install -y autojump
sudo apt-get -qq install -y unity-tweak-tool
sudo apt-get -qq install -y ubuntu-make
umake ide visual-studio-code


cd ~
sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
chsh -s $(which zsh)

mkdir ~/proto
cd ~/proto
wget -qO- -O tmp.zip https://github.com/google/protobuf/releases/download/v3.0.0-beta-3/protoc-3.0.0-beta-3-linux-x86_64.zip  && unzip tmp.zip && rm tmp.zip

mkdir ~/powerline
cd ~/powerline
git clone https://github.com/powerline/fonts.git
cd fonts
./install.sh


#wget -O /tmp/intellij.tar.gz http://download.jetbrains.com/idea/ideaIC-12.0.4.tar.gz &&
#tar xfz /tmp/intellij.tar.gz &&
#cd idea-IC-123.169/bin &&
#./idea.sh

eval $(go env)
export GOPATH=~/

go get -u github.com/gogo/protobuf/proto
go get -u github.com/gogo/protobuf/protoc-gen-gogo
go get -u github.com/gogo/protobuf/gogoproto
go get -u github.com/gogo/protobuf/protoc-gen-gofast
go get -u github.com/rogeralsing/gam
go get -u github.com/golang/lint/golint
go get -u github.com/rogpeppe/godef

echo "eval \$(go env)"                                                >> ~/.zshrc
echo "export GOPATH=~"                                                >> ~/.zshrc
echo ". /usr/share/autojump/autojump.sh"                              >> ~/.zshrc
sed -i 's/robbyrussell/agnoster/g'                                       ~/.zshrc
echo "export PATH=\"$PATH:/home/`whoami`/proto:/home/`whoami`/bin\""  >> ~/.zshrc
echo "DEFAULT_USER=`whoami`"                                          >> ~/.zshrc

gsettings set com.canonical.Unity.Launcher launcher-position Bottom
gsettings set org.gnome.desktop.interface icon-theme "Numix-Circle"
gsettings set org.gnome.desktop.interface cursor-size 48
