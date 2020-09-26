*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${LOGIN_USERNAME_FIELD}  id=user-name
${LOGIN_PASSWORD_FIELD}  id=password

*** Keywords ***
Enter Username
    [Arguments]  ${user_login_data}
    Input Text  ${LOGIN_USERNAME_FIELD}  ${user_login_data.username}

Enter Password
    [Arguments]  ${user_login_data}
    Input Password  ${LOGIN_PASSWORD_FIELD}  ${user_login_data.password}

Submit Login Form With Credentials
    Press Keys  ${LOGIN_PASSWORD_FIELD}  RETURN

Wait For Error Message On Login Page
    [Arguments]  ${user_login_data}
    Wait Until Page Contains  ${user_login_data.error_msg}

Loginpage Loaded
    ${title}=  get title
    Should Contain  ${title}  Swag  ignore_case=True

Loginpage URL Loaded
    ${main_url}=  Get location
    #Wait Until Page Contains  Accepted usernames are:
    Should Be Equal As Strings  ${main_url}  https://www.saucedemo.com/index.html