# Basic Instructions to Setup Functions and DialogFlow at Google Cloud

1. Have your google cloud account up and running (sign up and credit card) 
> Once you have done that, all services are available and you should have granted to you something like US$ 300 to be used throughout the next 365 days

2. Download the SDK and refer to basic usage. 
> The whole platform is very well documented but this user has found a few shortcuts that could help out basic usage. Throughtout this document the commands are going to be explicit on its raw form, but simplifications can be found at my [T7 repository](http://github.com/msant77/t7)

> The complete set of T7 tools can be added from this [bashrc file](http://github.com/msant77/t7/master/bashrc/.bash_alias_gcloud).

> The complete and up to date considerations on studies and evolution on the platform can be found at [this folder](http://github.com/msant77/t7/master/stdy/gcloud)

3. Open the terminal and run the init command
```
gcloud init
```
> Go through the instructions and make it available

4. In order to test your connection to the platform, run the following command: 
```
gcloud compute instances list
```
> Unless it is one or more created instances, a list with zero running instances should be shown at this point

5. To check login, zone, region and project basic information run the following command : 
```
gcloud config list
```

6. Once you are up and running with the basics of gcloud, navigate to your functions folder and update your basic first function

7. The tutorial found at [https://dialogflow.com/docs/getting-started/basic-fulfillment-conversation](https://dialogflow.com/docs/getting-started/basic-fulfillment-conversation) is a little vague in terms of cloud configuration and readness. Be aware that in the following suggested command: 

```
gcloud beta functions deploy helloHttp --stage-bucket [BUCKET_NAME] --trigger-http
```

Nothing will actually work because of the following simple reasons

- helloHttp is probably not your DialogFlow project name
- the provided code refers to this same fake project name
- the bucket name must be referred to the one created when Dialog Flow automatically creates your project at Google Cloud

8. In order to know the project created by Dialog Flow, list your projects with: 
```
gcloud projects list
```

9. Change your current project in case you aren't yet on it
```
gcloud projects change <PROJECT_ID>
```

10. Now we are ready, we need to retrieve the bucket name, the command to do so is going to be: 
```
gsutil ls
```
My project name is `msant-weather`, a list like this should then appear: 
```
gs://msant-weather.appspot.com/
gs://staging.msant-weather.appspot.com/
```

11. Since now we have both project and bucket names, fix the code at the `index.js`...  :
 
```
exports.msant_weather = function msant_weather (req, res) {
  response = "This is a sample response from your webhook!";
  res.setHeader('Content-Type', 'application/json'); 
  res.send(JSON.stringify({ "speech": response, "displayText": response}));
};
```

12. Execute the following command from the folder containing the function: 
```
gcloud beta functions deploy msant_weather --stage-bucket msant-weather.appspot.com --trigger-http
```

The following output should be returned: 

```
Deploying function (may take a while - up to 2 minutes)...done.
availableMemoryMb: 256
entryPoint: msant_weather
httpsTrigger:
  url: https://us-central1-msant-weather.cloudfunctions.net/msant_weather
labels:
  deployment-tool: cli-gcloud
name: projects/msant-weather/locations/us-central1/functions/msant_weather
serviceAccountEmail: msant-weather@appspot.gserviceaccount.com
sourceArchiveUrl: gs://msant-weather.appspot.com/us-central1-projects/msant-weather/locations/us-central1/functions/msant_weather-cqtknbjlppkx.zip
status: ACTIVE
timeout: 60s
updateTime: '2018-03-21T21:55:50Z'
versionId: '1'
```
If the function aren't provided and written correctly (still with helloHttp name), an error like this should appear: 
```
ERROR: (gcloud.beta.functions.deploy) OperationError: code=3, message=Function load error: Node.js module defined by file index.js is expected to export function named msant-weather
```
> The creation of a dashed/underscored project name is clear an error, noticeable at this point. The project at Dialog Flow was made with an underscore `msant_weather`, the project created at gcloud came with a dash instead: `msant-weather`, the bucket name got a bunch of dashes and the function had to remain with underscore, an utter and complete *MESS*. _Avoid using dashed and/or underscored names_. The error was output when the function export was tried with the dash instead of an underscore: 
```
Deploying function (may take a while - up to 2 minutes)...failed.
ERROR: (gcloud.beta.functions.deploy) OperationError: code=3, message=Function load error: Code in file index.js can't be loaded.
Is there a syntax error in your code?
Detailed stack trace: /user_code/index.js:7
exports.msant-weather = function msant-weather (req, res) {
^^^^^^^^^^^^^^^^^^^^^

ReferenceError: Invalid left-hand side in assignment
    at createScript (vm.js:56:10)
    at Object.runInThisContext (vm.js:97:10)
    at Module._compile (module.js:542:28)
    at Object.Module._extensions..js (module.js:579:10)
    at Module.load (module.js:487:32)
    at tryModuleLoad (module.js:446:12)
    at Function.Module._load (module.js:438:3)
    at Module.require (module.js:497:17)
    at require (internal/module.js:20:19)
    at getUserFunction (/var/tmp/worker/worker.js:378:24)
```

Right after the command execution you have the following [https://us-central1-msant-weather.cloudfunctions.net/msant_weather](https://us-central1-msant-weather.cloudfunctions.net/msant_weather): 
```json
{"speech":"This is a sample response from your webhook!","displayText":"This is a sample response from your webhook!"}

```

> These few extra commands will give info about functions in the project
```
#list functions
gcloud beta functions list 

#get function details
gcloud beta functions describe <FUNCTION_NAME>
```

### Information on how to deploy mongodb into a kubernetes cluster
> Follow this link : [https://codelabs.developers.google.com/codelabs/cloud-mongodb-statefulset/index.html?index=..%2F..%2Findex#3](https://codelabs.developers.google.com/codelabs/cloud-mongodb-statefulset/index.html?index=..%2F..%2Findex#3)

