## Deploying a containerized web application
[Tutorial](https://cloud.google.com/kubernetes-engine/docs/tutorials/hello-app)


Install GCP Kubernete components if it isn't installed
```
gcloud components install kubectl
```

Set up your project and zone
```
gcloud config set project [PROJECT_ID]
gcloud config set compute/zone us-central1-b
```

### Step 1 : Build the container image

Build the container image. In the following example, a simple hello world rest service written in go.
```
git clone https://github.com/GoogleCloudPlatform/kubernetes-engine-samples
cd kubernetes-engine-samples/hello-app
```

Set the Project_ID (it will be used in many further commands) 
```
export PROJECT_ID="$(gcloud config get-value project -q)"
```

Build the image based on the local file
```
docker build -t gcr.io/${PROJECT_ID}/hello-app:v1 .
```
Now `docker images` should list the recently added image


#### Step 2 : Upload the container image 


Push the image to gcp project dockers list 
```
gcloud docker -- push gcr.io/${PROJECT_ID}/hello-app:v1
```

### Step 3 : Run your container locally

Run the container: 
```
docker run --rm -p 8080:8080 gcr.io/${PROJECT_ID}/hello-app:v1
```

Test the output with curl
```
curl http://localhost:8080
```

### Step 4 : Create a container cluster
The following command creates a three-node cluster named `hello-cluster`
```
gcloud container clusters create hello-cluster --num-nodes=3

```

After a little while `gcloud compute intances list` list command should provide three extra new virtual machines for that project.


### Step 5 : Deploy your application

Execute the following command to deploy the application on port 8080
```
kubectl run hello-web --image=gcr.io/${PROJECT_ID}/hello-app:v1 --port 8080
```

In order to list the kubernetes pods execute: 
```
kubectl get pods
```

### Step 6: Expose your application to the Internet
By default, the containers you run on Kubernetes Engine are not accessible from the Internet, because they do not have external IP addresses. You must explicitly expose your application to traffic from the Internet, run the following command:

```
kubectl expose deployment hello-web --type=LoadBalancer --port 80 --target-port 8080
```

After a while, executing `kubectl get service` will get the cluster list with the new cluster assigned external ip  
```
$ kubectl get service
NAME         CLUSTER-IP      EXTERNAL-IP     PORT(S)          AGE
hello-web    10.3.251.122    203.0.113.0     80:30877/TCP     3d
```

### Step 7 : Scale up your application 
(TODO Next) 
