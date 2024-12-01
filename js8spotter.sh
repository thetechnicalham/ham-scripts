cat << 'EOF' > install_js8spotter.sh && chmod +x install_js8spotter.sh && ./install_js8spotter.sh
#!/bin/bash

# Update package list
echo "Updating package list..."
sudo apt-get update

#Install required python packages
echo "Installing python packages..."
sudo apt install python3-tk -y
sudo apt install python3-pil -y
sudo apt install python3-pil.imagetk -y
sudo apt install python3-requests -y
sudo apt install python3-tksnack -y

# Download js8spotter package
echo "Downloading js8spotter zip..."
wget "https://kf7mix.com/files/js8spotter/js8spotter-112b.zip"

#Unzip js8spotter
echo "Unzipping js8spotter..."
unzip js8spotter-112b.zip

#Make js8spotter executable
echo "Making js8spotter executable..."
chmod a+x ~/js8spotter-112b/js8spotter.py

#Create desktop shortcut
echo "Creating js8spotter desktop shortcut..."
echo "[Desktop Entry]
Version=1.0
Name=JS8Spotter
Comment=JS8Spotter
Exec=python3 ~/js8spotter-112b/js8spotter.py
Icon=~/js8spotter-112b/js8spotter.ico
Path=~/js8spotter-112b/
Terminal=false
Type=Application" >> ~/Desktop/JS8Spotter.desktop

#Make file exectuable
chmod a+x ~/js8spotter-112b/js8spotter.py
gio set ~/Desktop/JS8Spotter.desktop  metadata::trusted true

#Make Desktop shortcut executable
chmod a+x ~/Desktop/JS8Spotter.desktop

# Clean up unnecessary files
echo "Cleaning up..."
sudo apt-get autoremove -y
sudo apt-get clean

# Verify installation
echo "Verifying js8spotter installation..."
js8spotter --version

echo "Installation complete. Enjoy using js8spotter!"
EOF