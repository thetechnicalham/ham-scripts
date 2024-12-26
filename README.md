# Ham-Scripts

To make installing Ham Radio programs on Linux easier.

Start with making sure you have git installed:
```
sudo apt install git
```

Then, install everything with this command:
```
git clone https://github.com/thetechnicalham/ham-scripts.git $HOME/ham-scripts && bash $HOME/ham-scripts/install-ham-scripts.sh
```
**NOTE: Currently, JS8Spotter is not installing correctly onto the machine via cubic install. I am working on a fix for this, but for now you will need to run the script post install.**

Or choose the Ham software you want and 'wget' the raw url of that script. Then run 'sh ./(file name)'.

To check for updates to the repo, run this command from your home directory:
```
sh ./ham-scripts/install-ham-scripts.sh
```

If there are other programs you would like to see in here or if you run into issues with the code, please make a post in the 'issues' tab or click the following link:
```
https://github.com/thetechnicalham/ham-scripts/issues
```
