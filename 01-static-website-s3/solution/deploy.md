# Deployment Instructions

1. **Log in to AWS Console**.
2. **Go to S3** and create a new bucket (e.g., `my-devops-project-01`).
3. **Uncheck "Block all public access"** (for demo purposes).
4. **Upload `index.html`** from this folder.
5. **Go to Properties** > **Static website hosting** > **Enable**.
6. **Set Index document** to `index.html`.
7. **Go to Permissions** > **Bucket policy** and add:
   ```json
   {
       "Version": "2012-10-17",
       "Statement": [
           {
               "Sid": "PublicReadGetObject",
               "Effect": "Allow",
               "Principal": "*",
               "Action": "s3:GetObject",
               "Resource": "arn:aws:s3:::YOUR_BUCKET_NAME/*"
           }
       ]
   }
   ```
8. **Save changes** and browse the provided endpoint.
