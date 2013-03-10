## About
`url.rb` allows you to generate a signed URL to a file stored in [Amazon S3](http://aws.amazon.com/s3/).  This URL allows you to access the file without needing to grant access permissions in S3.  The signed URL is valid only for the specified amount of time and only for the specified file.  You must have an AWS ID and secret key with access to the file in order to generate the URL.

## Usage
Replace the `AWS_ID` and `AWS_KEY` constants in `url.rb` with your ID and secret key.  Then run the script passing in the bucket name and path to the file in the bucket:

    ruby url.rb my_bucket path/file.extension

The script will write the signed URL to the console.

