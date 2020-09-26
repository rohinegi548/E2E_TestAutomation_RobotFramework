*** Settings ***
Documentation  Saucedemo e-commerce application automation
Resource  ../Resources/SaucedemoUI.robot
Resource  ../Resources/Common.robot
Resource  ../Data/InputData.robot

Test Setup  Begin Web Test  ${ENV_URLS}  ${BROWSER}
Test Teardown  End Web Test
Suite Teardown  Generate Allure Report
Test Template  Invalid Login Credentials Should Fail Login


*** Test Cases ***                          INVALID_USER_CREDENTIALS
Login With Invalid User And Password        ${INVALID_USER_PASSWD}
Login With Invalid User                     ${INVALID_USER}
Login With Invalid Password                 ${INVALID_PASSWORD}
Login With Blank User                       ${BLANK_USER}
Login With Blank Password                   ${BLANK_PASSWORD}
Login With Blank User And Password          ${BLANK_USER_PASSWD}


*** Keywords ***
Invalid Login Credentials Should Fail Login
    [Arguments]  ${invalidcredentials}
    Login As An Invalid User  ${invalidcredentials}