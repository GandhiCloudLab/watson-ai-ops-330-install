# Installing Watson AIOps 3.3 on ROKS 

This document helps to install the following on ROKS.

- Installing Watson AIOps AI Manager
<!-- - Installing Watson AIOps Event Manager -->
- Installing Watson AIOps Infra Automation

## 1. Update Properties

### Update AI Manager config.sh

Update the below properties in [../01-install-aimgr-on-roks/files/00-config.sh](../01-install-aimgr-on-roks/files/00-config.sh) file .


```
export ENTITLEMENT_KEY=eyJhbG...........................e4Zog
```

<!-- ### Update Event Manager config.sh

Update the below properties in [../02-install-eventmgr-on-roks/files/00-config.sh](../02-install-eventmgr-on-roks/files/00-config.sh) file .

```
export ENTITLEMENT_KEY=eyJhbG...........................e4Zog
``` -->

### Update Infra Automation config.sh

Update the below properties in [../04-install-infra-automation-on-roks/files/00-config.sh](../04-install-infra-automation-on-roks/files/00-config.sh) file .

```
export ENTITLEMENT_KEY=eyJhbG...........................e4Zog
export YOUR_LDAP_USER_GROUP=IM_GROUP
```

## 2. Install 

#### 2.1. Login to OCP Cluster

Login to OCP cluster using  `oc login` command .

#### 2.2. Run the install script

Goto the [files](./files) folder and Run the install script as like below.

```
cd files
sh 10-install.sh
```

It will install the following.

- Installing Watson AIOps AI Manager
<!-- - Installing Watson AIOps Event Manager -->
- Installing Watson AIOps Infra Automation

#### 2.3. Output
 
The installation would be completed and the output could be like this.

```
=====================================================================================================
URL : https://cpd-cp4waiops.aaaaaaaa.ams03.containers.appdomain.cloud
USER: admin
PASSWORD: EpU2m........................jYUz
=====================================================================================================

```

You can use this to login into the WAIOps Console.

## 3. Printing URL, Usr and Pwd

To get the AIMgr URL, user and password anytime after AIMgr install, you can run the below command. This will print the output as like above.

```
cd files
sh 19-print-url-usr-pwd.sh
```

## 4. UnInstall

Refer : https://github.com/IBM/cp4waiops-samples/tree/main/uninstall/3.3

## Reference

The script is based out of https://www.ibm.com/docs/en/cloud-paks/cloud-pak-watson-aiops/3.3.0?topic=manager-starter-installation-cli

