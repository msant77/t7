
# Getting Started
[Script base to consider under tset public repo](https://github.com/marcosantana77/tset/blob/master/basic/gc/basic.sh)

## Script set 

- Install Python
- Download SDK 
- Install SDK `$ ./google-cloud-sdk/install.sh`
- Source SDK Path `$ source ./google-cloud-sdk/path.bash.inc`
- Init SDK `gcloud init`
- Go through the detailed initialization process

Special Attention to 
```
You must log in to continue. Would you like to log in (Y/n)?  Y
```

Then in your browser, log in to your Google user account when prompted and click Allow to grant permission to access Google Cloud Platform resources.

:neutral_face: If one doesn't feel comfortable enough to go and grant such ambitious permissions to our beloved cloud provider and be so bold and deny them this concessions, the following message will be shown and thy access to your cloud resources shall be denied:  

```
ERROR: There was a problem with web authentication. Try running again with --no-launch-browser.
ERROR: (gcloud.auth.login) Unable to authenticate.
ERROR: (gcloud.init) Failed command: [auth login --force --brief] with exit code [1]
```
If this was your case, restart the process by the `init` step

:smile: Obedient user that gave Google all permissions shall be comtemplated with the following message: 

`You are logged in as: [youremail@yourdomain.com].`

Next step is to choose one project to act as default 

```
Pick cloud project to use: 
 [1] proj-name
 [2] proj2
 [3] Create a new project
Please enter numeric choice or text value (must exactly match list 
item):  2

Your current project has been set to: [proj-name].

```
And then, the inevitable Yes [link will take you to a basic instruction page concerning compute engine]: 
```
Do you want to configure Google Compute Engine 
(https://cloud.google.com/compute) settings (Y/n)?  Y
```

Next step will demand a lot more attention, because setting the wrong zone will isolate the resource from the rest of company's ones: 
```

Which Google Compute Engine zone would you like to use as project 
default?
If you do not specify a zone via a command line flag while working 
with Compute Engine resources, the default is assumed.
```
And by the time of the elaboration of this document (2017' September), default region was: 
```
 [23] southamerica-east1-a


 Please enter numeric choice or text value (must exactly match list 
item):  23

Your project default Compute Engine zone has been set to [southamerica-east1-a].
You can change it by running [gcloud config set compute/zone NAME].

Your project default Compute Engine region has been set to [southamerica-east1].
You can change it by running [gcloud config set compute/region NAME].

Your Google Cloud SDK is configured and ready to use!

* Commands that require authentication will use marco@portaltelemedicina.com.br by default
* Commands will reference project `proj-name` by default
* Compute Engine commands will use region `southamerica-east1` by default
* Compute Engine commands will use zone `southamerica-east1-a` by default

Run `gcloud help config` to learn how to change individual settings

This gcloud configuration is called [default]. You can create additional configurations if you work with multiple
Run `gcloud topic configurations` to learn more.

Some things to try next:

* Run `gcloud --help` to see the Cloud Platform services you can interact with. And run `gcloud help COMMAND` to 
* Run `gcloud topic -h` to learn about advanced features of the SDK like arg files and output formatting

```

End of initial setup.
