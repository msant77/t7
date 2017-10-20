#wget / curl to get content and grep/awk it 

curl -s <contentUrl> | grep <whatToGrep> 

 wget -q <contentUrl> -O - | grep <whatToGrep>


#saves the content to a file
curl <anycontentFromAnyUrl> > <anyfile> 





#curl for getting a token from any given wep api, considering that password carries out special characters and therefore needs urlencoding 


curl -i -X POST --data-urlencode "userName=someuser" --data-urlencode "password=$%ˆ!@#" -d "grant_type=password" http://localhost/somePath/v1/Token

#now does the same but uses the tset function encurlit instead  
curl -X POST -d ‘username=someuser&password=‘`encurlit ‘&*$!@#’`‘&grant_type=password’ “http://somePath/v1/token”
