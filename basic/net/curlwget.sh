#wget / curl to get content and grep/awk it 

curl -s <contentUrl> | grep <whatToGrep> 

 wget -q <contentUrl> -O - | grep <whatToGrep>

