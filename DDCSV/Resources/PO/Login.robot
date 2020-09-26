*** Settings ***
Library  SeleniumLibrary
Resource  ../Data/InputData.robot

*** Variables ***
${LOGIN_USERNAME_FIELD}  id=user-name
${LOGIN_PASSWORD_FIELD}  id=password

*** Keywords ***
Enter Username
    [Arguments]  ${user_login_data}
    Input Text  ${LOGIN_USERNAME_FIELD}  ${user_login_data.username}

Enter Username For Invalid Logincheck
    [Arguments]  ${user_login_data}
    Input Text  ${LOGIN_USERNAME_FIELD}  ${user_login_data[0]}

Enter Password
    [Arguments]  ${user_login_data}
    Input Password  ${LOGIN_PASSWORD_FIELD}  ${user_login_data.password}

Enter Password For Invalid Logincheck
    [Arguments]  ${user_login_data}
    Input Password  ${LOGIN_PASSWORD_FIELD}  ${user_login_data[1]}

Submit Login Form With Credentials
    Press Keys  ${LOGIN_PASSWORD_FIELD}  RETURN

Wait For Error Message On Login Page
    [Arguments]  ${user_login_data}
    Wait Until Page Contains  ${user_login_data.error_msg}

Wait For Error Message On Login Page For Invalid Logincheck
    [Arguments]  ${user_login_data}
    run keyword and continue on failure  Wait Until Page Contains  ${user_login_data[2]}
    go to  ${ENV_URLS.${ENV}}
    #clear element text  ${LOGIN_PASSWORD_FIELD}
    #clear element text  ${LOGIN_PASSWORD_FIELD}

Loginpage Loaded
    ${title}=  get title
    Should Contain  ${title}  Swag  ignore_case=True

Loginpage URL Loaded
    ${main_url}=  Get location
    #Wait Until Page Contains  Accepted usernames are:
    Should Be Equal As Strings  ${main_url}  https://www.saucedemo.com/index.html