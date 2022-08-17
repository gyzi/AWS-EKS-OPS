
instances = aws ec2 describe-instance --filters Name=Env,Values=Dev

for each intance in instances
    aws ec2 terminate-instance (instance)
end for