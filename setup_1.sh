sudo apt-get install aptitude
sudo aptitude install python3-pip python3-virtualenv python3-virtualenvwrapper

echo "export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python3" >> /home/frodo/.profile
echo "export WORKON_HOME=$HOME/.virtualenvs" >> /home/frodo/.profile
echo "export VIRTUALENVWRAPPER_VIRTUALENV=/home/frodo/.local/bin/virtualenv" >> /home/frodo/.profile
echo "source ~/.local/bin/virtualenvwrapper.sh" >> /home/frodo/.profile

source ~/.profile

