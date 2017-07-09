#procedures to make a directory being listed as directory browsing

# create a user to list as administrators with full control and give it all to the 
# folder that it is intended to be listed

# on IIS, create an app pool and assign the created user to it 

# on IIS, create an virtual directory/app pointing to the wishy listing folder

# on the folder/app features view, select MIME types, add the extensions and Mime types needed to be either opened, downloaded or executed on that folder

# restart IIS 

# test 

# trim down permissions to decrease security risks 
   # petty user will do
   # permissions on the folder only to read and list folder content
   
 #ALL CHANGES DEMAND AN IIS RESTART IN ORDER TO TAKE EFFECT 
