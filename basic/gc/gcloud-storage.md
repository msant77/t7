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

