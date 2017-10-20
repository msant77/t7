  #generates a 2048 rsa key  
  ssh-keygen -t rsa -f ~/.ssh/id_rsa -C username
  cd ~/.ssh
  cat id_rsa.pub
  chmod 400 id_rsa