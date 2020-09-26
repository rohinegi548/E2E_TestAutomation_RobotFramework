*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${LOGIN_USERNAME_FIELD}  id=user-name
${LOGIN_PASSWORD_FIELD}  id=password

*** Keywords ***
Enter Username
    [Arguments]  ${username}
    Input Text  ${LOGIN_USERNAME_FIELD}  ${username}

Enter Password
    [Arguments]  ${password}
    Input Password  ${LOGIN_PASSWORD_FIELD}  ${password}

Submit Login Form With Credentials
    Press Keys  ${LOGIN_PASSWORD_FIELD}  RETURN

Wait For Error Message On Login Page
    Wait Until Page Contains  Username and password do not match any user in this service

Loginpage Loaded
    ${title}=  get title
    Should Contain  ${title}  Swag  ignore_case=True

Loginpage URL Loaded
    ${main_url}=  Get location
    #Wait Until Page Contains  Accepted usernames are:
    Should Be Equal As Strings  ${main_url}  https://www.saucedemo.com/index.html