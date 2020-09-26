*** Settings ***
Documentation  Saucedemo e-commerce application automation
Resource  ../Resources/SaucedemoUI.robot
Resource  ../Resources/Common.robot
Test Setup  Begin Web Test  ${ENV_URLS}  ${BROWSER}
Test Teardown  End Web Test
Suite Teardown  Generate Allure Report
Test Template  Invalid Login Credentials Should Fail Login

*** Variables ***
#use of dictionary variable
&{cust_shipping_details} =  firstname=Alex  lastname=Casto  postalcode=160062
&{ENV_URLS} =  dev=https://www.saucedemo.com  qa=http://www.saucedemo.com  prod=https://www.saucedemo.com
${BROWSER}  chrome
${ENV}  qa

#user login data
&{valid_user} =  username=standard_user  password=secret_sauce
&{invalid_password} =  username=standard_user  password=hellopassword  error_msg=Username and password do not match any user in this service
&{invalid_user} =  username=hellouser  password=secret_sauce  error_msg=Username and password do not match any user in this service
&{invalid_user_passwd} =  username=hellouser  password=hellopasswd  error_msg=Username and password do not match any user in this service
&{blank_user} =  username=  password=secret_sauce  error_msg=Username is required
&{blank_password} =  username=standard_user  password=  error_msg=Password is required
&{blank_user_passwd} =  username=  password=  error_msg=Username is required

*** Test Cases ***                          INVALID_USER_CREDENTIALS
Login With Invalid User And Password        ${invalid_user_passwd}
Login With Invalid User                     ${invalid_user}
Login With Invalid Password                 ${invalid_password}
Login With Blank User                       ${blank_user}
Login With Blank Password                   ${blank_password}
Login With Blank User And Password          ${blank_user_passwd}


*** Keywords ***
Invalid Login Credentials Should Fail Login
    [Arguments]  ${invalidcredentials}
    Login As An Invalid User  ${invalidcredentials}