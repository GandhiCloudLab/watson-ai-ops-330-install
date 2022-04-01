# Installing Watson AIOps Event Manager 3.3 on ROKS 

This document explains about Installing IBM Watson AIOps Event Manager 3.3.0 on ROKS.

Installation script is available in [files/10-install.sh](./files/10-install.sh).


## 1. Update Properties

#### 1.1. Update entitlement Keys

Update the below properties in `files/00-config.sh` file .

```
export ENTITLEMENT_KEY=eyJhbG...........................e4Zog
```

#### 1.3. Login to OCP Cluster

Login to OCP cluster using  `oc login` command .


## 2. Install Event Manager

#### 2.1. Login to OCP Cluster

Login to OCP cluster using  `oc login` command .

#### 2.2. Run the install script

Goto the `files` folder and Run the install script as like below.

```
cd files
sh 10-install.sh
```

- It would take around 30 to 50 minutes to complete the istallation. 
- By default the installation is done on the namespace `cp4waiops-emgr`
- Keep checking the logs for the status. 
- The same script can be run again and again if the install stopped for any reason.

#### 2.3. Output
 
The installation would be completed and the output could be like this.

```
=====================================================================================================
URL : https://netcool-evtmanager.aaaaaaaa.appdomain.cloud
USER: smadmin
PASSWORD: rJ........u
=====================================================================================================
```

You can use this to login into the WAIOps Console.

## 3. Printing URL, Usr and Pwd

To get the AIMgr URL, user and password anytime after AIMgr install, you can run the below command. This will print the output as like above.

```
cd files
sh 11-print-url-usr-pwd.sh
```

## 4. UnInstall

Goto the `files` folder and Run the uninstall script as like below.

```
cd  files
sh  20-uninstall.sh
```

Refer : https://github.com/IBM/cp4waiops-samples/tree/main/uninstall/3.3

## Reference

The script is based out of https://www.ibm.com/docs/en/cloud-paks/cloud-pak-watson-aiops/3.3.0?topic=manager-starter-installation