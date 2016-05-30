sudo apt-add-repository ppa:numix/ppa
sudo add-apt-repository ppa:tualatrix/ppa
sudo add-apt-repository ppa:ubuntu-desktop/ubuntu-make
sudo add-apt-repository ppa:freyja-dev/unity-tweak-tool-daily
sudo apt-get -qq update
sudo apt-get -qq install golang
sudo apt-get -qq install zsh
sudo apt-get -qq install numix-icon-theme numix-icon-theme-circle
sudo apt-get -qq install autojump
sudo apt-get -qq install unity-tweak-tool
sudo apt-get install ubuntu-make
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

go get github.com/gogo/protobuf/proto
go get github.com/gogo/protobuf/protoc-gen-gogo
go get github.com/gogo/protobuf/gogoproto
go get github.com/gogo/protobuf/protoc-gen-gofast
go get github.com/rogeralsing/gam
go get -u github.com/golang/lint/golint
go get -u github.com/rogpeppe/godef

echo "eval \$(go env)" >> ~/.zshrc
echo "export GOPATH=~" >> ~/.zshrc
echo ". /usr/share/autojump/autojump.sh" >> ~/.zshrc
sed -i 's/robbyrussell/agnoster/g' ~/.zshrc
echo "export PATH=\"$PATH:/home/rogeralsing/proto:/home/rogeralsing/bin\""  >> ~/.zshrc
echo "DEFAULT_USER=`whoami`"  >> ~/.zshrc
gsettings set com.canonical.Unity.Launcher launcher-position Bottom
gsettings set org.gnome.desktop.interface icon-theme "Numix-Circle"
gsettings set org.gnome.desktop.interface cursor-size 48

#sudo apt-get --qq upgrade
