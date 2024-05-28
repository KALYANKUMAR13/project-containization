In your linux based system, to install
```
curl -O https://get.helm.sh/helm-v3.7.1-linux-amd64.tar.gz
```
A tar file will be downloaded.

Unzip it 
```
tar -zxvf helm-v3.7.1-linux-amd64.tar.gz
```

Move Helm Binary to a Directory in Your PATH
```
sudo mv linux-amd64/helm /usr/local/bin/helm
```

Now , you can check the version
```
helm version
```
Add Helm repositories to pull charts from and updte the repo:
```
helm repo add stable https://charts.helm.sh/stable
helm repo update
```
