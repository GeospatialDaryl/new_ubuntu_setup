sudo apt-get install aptitude
sudo aptitude install python3-pip python3-virtualenv python3-virtualenvwrapper
sudo aptitude install ccache doxygen graphviz qttools5-dev-tools libhidapi-dev libusb-1.0-0-dev libprotobuf-dev protobuf-compiler libudev-dev build-essential cmake pkg-config libboost-all-dev libssl-dev libzmq3-dev libpgm-dev libnorm-dev libunbound-dev libsodium-dev libunwind8-dev liblzma-dev libreadline6-dev libexpat1-dev libgtest-dev
sudo aptitude install libavahi-client-dev libavahi-core-dev

echo "export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python3" >> /home/frodo/.profile
echo "export WORKON_HOME=$HOME/.virtualenvs" >> /home/frodo/.profile
echo "export VIRTUALENVWRAPPER_VIRTUALENV=/home/frodo/.local/bin/virtualenv" >> /home/frodo/.profile
echo "source ~/.local/bin/virtualenvwrapper.sh" >> /home/frodo/.profile

ln -s ~/.local/bin/virtualenvwrapper.sh /usr/share/virtualenvwrapper/virtualenvwrapper.sh
#disable sleepies
sudo systemctl mask sleep.target suspend.target hibernate.target hybrid-sleep.target


source ~/.profile



sudo apt-get install libavahi-glib-dev -y

mkdir ~/repos
cd repos
git clone https://github.com/openprinting/cups
cd cups
