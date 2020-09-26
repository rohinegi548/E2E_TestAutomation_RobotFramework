*** Variables ***
#use of dictionary variable
&{cust_shipping_details} =  firstname=Alex  lastname=Casto  postalcode=160062
&{ENV_URLS} =  dev=https://www.saucedemo.com  qa=http://www.saucedemo.com  prod=https://www.saucedemo.com
${BROWSER}  chrome
${ENV}  qa

#user login data
&{VALID_USER} =  username=standard_user  password=secret_sauce
&{INVALID_PASSWORD} =  username=standard_user  password=hellopassword  error_msg=Username and password do not match any user in this service
&{INVALID_USER} =  username=hellouser  password=secret_sauce  error_msg=Username and password do not match any user in this service
&{INVALID_USER_PASSWD} =  username=hellouser  password=hellopasswd  error_msg=Username and password do not match any user in this service
&{BLANK_USER} =  username=  password=secret_sauce  error_msg=Username is required
&{BLANK_PASSWORD} =  username=standard_user  password=  error_msg=Password is required
&{BLANK_USER_PASSWD} =  username=  password=  error_msg=Username is required