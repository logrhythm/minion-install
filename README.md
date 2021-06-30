# minion-install
MistNet probe node salt minion installation script

You should have received a CCN DNS name and/or IP address to use with this script

To use:
```
sudo curl -sLO https://github.com/logrhythm/minion-install/raw/main/install-salt-minion.sh ; bash ./install-salt-minion.sh <CCN Address>
```

Examples:

CCN DNS Name
```
sudo curl -https://github.com/logrhythm/minion-install/raw/main/install-salt-minion.sh ; bash ./install-salt-minion.sh master.lr-example-production.mistnet.io
```

CCN IP
```
sudo curl -https://github.com/logrhythm/minion-install/raw/main/install-salt-minion.sh ; bash ./install-salt-minion.sh 1.2.3.4
```
