function ec2ssh
  ssh -i {$AWS_PEM_FILE} ubuntu@{$argv}
end
