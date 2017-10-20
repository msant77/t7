#google cloud storage 
https://cloud.google.com/storage/docs/quickstart-gsutil


 `gsutil | grep bucket`

will output the following very nice indeed set of tools 

 ```
  acl             Get, set, or change bucket and/or object ACLs
  cors            Get or set a CORS JSON document for one or more buckets
  defacl          Get, set, or change default ACL on buckets
  defstorageclass Get or set the default storage class on buckets
  **iam**             Get, set, or change bucket and/or object IAM permissions.
  **label**           Get, set, or change the label configuration of a bucket.
  lifecycle       Get or set lifecycle configuration for a bucket
  logging         Configure or retrieve logging on buckets
  **ls**              List providers, buckets, or objects
  **mb**              Make buckets
  **rb**              Remove buckets
  rsync           Synchronize content of two buckets/directories
  versioning      Enable or suspend versioning for one or more buckets
  web             Set a main page and/or error page for one or more buckets
  ``` 

  `gsutil mb gs://linuximage` 
creates bucket named linuximage


## Public a static website with Google Storage 

## [Tutorial](https://cloud.google.com/storage/docs/hosting-static-website)


[x] First, get the work with your registrar in order to verify ownership of the domain.

In [here](https://www.google.com/webmasters/verification/home?hl=en) this can be done. And in [here](https://cloud.google.com/storage/docs/domain-name-verification) one can learn some more about the process.

[x] If it is a subdomain bucket, create the CNAME record pointing to `c.storage.googleapis.com`.

[x] Create the bucket with the name of the final url path. If the path to intended url is http://mybucketsubdomain.bucketdomain.com, your bucket name will have to have the same name. Just replace the protocol `http/https` by the one used for `gsutil` access: `gs://`

```
gsutil mb gs://mybucketsubdomain.bucketdomain.com
```

Bucket name from now on will be referred as `gs://thy-bucket.com`

[x] Copy the contents from either another bucket or files from the your computer

```
gsutil rsync -R ./ gs://thy-bucket.com
``` 

[x] List the constents of your bucket, if you feel so inclined 

```
gsutil ls gs://thy-bucket.com
```

[x] Next, reading access must be given to all files you want to make available

```
gsutil acl ch -r -u AllUsers:R gs://thy-bucket.com
```

[x] To end the process, set either 404 and default page 
```
 gsutil web set -m index.html -e 404.html gs://thy-bucket.com
```

There you have it. Fast, high available and secure web server. 