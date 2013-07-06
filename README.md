Running the Server
--------------

Production should have the following environment variables present to enable uploading the S3 properly: `AWS_ACCESS_KEY`, `AWS_SECRET_KEY`.

In development mode you can pass the flag `LOCALSTORE` to use a local file store and skip the s3 uploading.
