#lists all files, with columns
ls -lta 

#lists all files, one column, no extension name 
ls -1 | sed -e 's/\..*$//'
#or
ls | sed 's/\(.*\)\..*/\1/'
