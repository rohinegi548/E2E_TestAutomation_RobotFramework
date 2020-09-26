*** Settings ***
Library  SeleniumLibrary

*** Keywords ***
Enter Username
    [Arguments]  ${username}
    Input Text  id=user-name  ${username}

Enter Password
    [Arguments]  ${password}
    Input Password  id=password  ${password}

Submit Login Form With Credentials
    Press Keys  id=password  RETURN

Wait For Error Message On Login Page
    Wait Until Page Contains  Username and password do not match any user in this service

Loginpage Loaded
    ${title}=  get title
    Should Contain  ${title}  Swag  ignore_case=True

Loginpage URL Loaded
    ${main_url}=  Get location
    #Wait Until Page Contains  Accepted usernames are:
    Should Be Equal As Strings  ${main_url}  https://www.saucedemo.com/index.html