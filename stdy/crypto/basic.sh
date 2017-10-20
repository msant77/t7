#https://www.cryptoparty.in/learn/how-tos
#real deal article: 
#https://www.gnupg.org/gph/en/manual.html#AEN26

#generating a new keypair
gpg --gen-key

#list keys 
gpg --list-keys

#generating a revocation certificate 
gpg --output revoke.asc --gen-revoke mykey


#exporting the public key 
gpg --output <filename> --armor --export <mykey>


#encrypt file 
gpg -c <filename> 

#decrypt file 
gpg -d <encrypted filename>
