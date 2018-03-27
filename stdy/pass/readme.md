# Password Manager for Terminal 

> Usage website and aditional download information can be found at [https://www.passwordstore.org/](https://www.passwordstore.org/)

1. Install 

```
brew install pass
```

2. Init 

```
$ pass init --path=subfolder, -p subfolder gpg-id
$ #to generate a pass tree in the current folder 
$ pass init -p `pwd` <any_given_desired_name> 
```

3. Insert new password
```
$ pass insert <UpperLevel/LowerLevel> 
```
Tool should then ask for the password, that will be promptly saved.




. Throw password to clipboard (will expire in 45 seconds)
```
$ pass -c <pass_id>
```


TODO 

[x] check out gpg-id if a random won't work
[] generate a general exportable password manager 
[] check why `pass insert` won't work
[] check why the message `gpg: sf: skipped: No public key` won't work at gpg insert d/sf/1Password


