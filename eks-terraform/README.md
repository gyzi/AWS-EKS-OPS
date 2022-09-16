**Deploying and Managing EKS cluster**

- To create an AWS profile, you need to run aws configure and provide the profile name, in our case user "default".
#Then verify that you can access AWS services with that profile.
```
aws configure  # --profile default
```
- To let user "default user" to assume the eks-admin IAM role, we need to create another AWS profile with the role name. You need to replace role_arn with yours.
```
aws sts get-caller-identity  # --profile default
```


```
cat <<EOF >> ~/.aws/config
[profile eks-admin]
role_arn = arn:aws:iam: :***AWS_account_id ** :role/eks-admin
source_profile = default
EOF
```

- Let's test if we can assume the eks-admin IAM role.
```
aws sts get-caller-identity --profile eks-admin
```
- Now we can update Kubernetes config to use the eks-admin IAM role.

```
aws eks update-kubeconfig \
  --name my-eks \
  --region us-east-1 \
  --profile eks-admin
```

#If you try to access EKS right now, you'll get an error saying You must be logged in to the server (Unauthorized).

```kubectl auth can-i "*" "*" ```