# Installing Watson AIOps Infra Automation 3.3 on ROK

This document explains about Installing IBM Watson AIOps Infra Automation 3.3.0 on ROKS.

Installation script is available in [files/10-install.sh](./files/10-install.sh).


## 1. Update Properties

#### 1.1 Update entitlement Keys

Update the below properties in `files/00-config.sh` file .

```
export ENTITLEMENT_KEY=eyJhbG...........................e4Zog
```

#### 1.2 Update entitlement Keys

Update the below properties in `files/00-config.sh` file .

```
export YOUR_LDAP_USER_GROUP=IM_GROUP
```

## 2. Install Infra-Automation

#### 2.1. Login to OCP Cluster

Login to OCP cluster using  `oc login` command .

#### 2.2. Run the install script

Goto the `files` folder and Run the install script as like below.

```
cd files
sh 10-install.sh
```

- It would take around 1hr to complete the istallation. 
- By default the installation is done on the namespace `cp4waiops`
- Keep checking the logs for the status. 
- The same script can be run again and again if the install stopped for any reason.

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

To get the Infra Automation URL, user and password anytime after Infra Automation install, you can run the below command. This will print the output as like above.

```
cd files
sh 19-print-url-usr-pwd.sh
```

## 4. UnInstall

Refer : https://github.com/IBM/cp4waiops-samples/tree/main/uninstall/3.3

## Reference

The script is based out of the following.

- Online installation of Infrastructure Automation
https://www.ibm.com/docs/en/cloud-paks/cloud-pak-watson-aiops/3.3.0?topic=automation-online-installation-infrastructure-only#operator

- Deploying Infrastructure management as a containerized deployment (podified).
https://www.ibm.com/docs/en/cloud-paks/cloud-pak-watson-aiops/3.3.0?topic=automation-online-installation-ai-manager
https://www.ibm.com/docs/en/cloud-paks/cloud-pak-watson-aiops/3.3.0?topic=management-deploying-infrastructure-as-containerized-deployment-podified#deploy-install-operand


## Note

This script can be installed on top existing IBM Watson AIOps AI Manager 3.3.0 instance.
