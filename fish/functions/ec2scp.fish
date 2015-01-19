function ec2scp
  scp -i {$AWS_PEM_FILE} -o 'User ubuntu' {$argv}
end
