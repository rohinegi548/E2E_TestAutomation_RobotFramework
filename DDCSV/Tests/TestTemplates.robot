*** Settings ***
Documentation  Saucedemo e-commerce application automation
Resource  ../Resources/SaucedemoUI.robot
Resource  ../Resources/Common.robot
Test Setup  Begin Web Test  ${ENV_URLS}  ${BROWSER}
Test Teardown  End Web Test
Suite Teardown  Generate Allure Report

*** Variables ***
#use of dictionary variable
&{cust_shipping_details} =  firstname=Alex  lastname=Casto  postalcode=160062
&{ENV_URLS} =  dev=https://www.saucedemo.com  qa=http://www.saucedemo.com  prod=https://www.saucedemo.com
${BROWSER}  chrome
${ENV}  qa

#user login data
&{valid_user} =  username=standard_user  password=secret_sauce
&{invalid_password} =  username=standard_user  password=hellopassword
&{invalid_user} =  username=hellouser  password=secret_sauce
&{blank_user} =  username=  password=secret_sauce
&{blank_password} =  username=standard_user  password=
&{blank_user_passwd} =  username=  password=

*** Test Cases ***
Verify Login Should Fail For Invalid Credentials
    [Documentation]  Verification of Negative Testing Scenario For Login
    [Tags]  NegativeScenario
    [Template]  Invalid Login Credentials Should Fail Login
    ${invalid_password}


Verify Login Should Fail For Invalid Credentials
    [Documentation]  Verification of Negative Testing Scenario For Login
    [Tags]  NegativeScenario
    [Template]  Invalid Login Credentials Should Fail Login
    ${invalid_user}

Verify Login Should Fail For Invalid Credentials
    [Documentation]  Verification of Negative Testing Scenario For Login
    [Tags]  NegativeScenario
    [Template]  Invalid Login Credentials Should Fail Login
    ${blank_user}

Verify Login Should Fail For Invalid Credentials
    [Documentation]  Verification of Negative Testing Scenario For Login
    [Tags]  NegativeScenario
    [Template]  Invalid Login Credentials Should Fail Login
    ${blank_password}

Verify Login Should Fail For Invalid Credentials
    [Documentation]  Verification of Negative Testing Scenario For Login
    [Tags]  NegativeScenario
    [Template]  Invalid Login Credentials Should Fail Login
    ${blank_user_passwd}

*** Keywords ***
Invalid Login Credentials Should Fail Login
    [Arguments]  ${invalidcredentials}
    Login As An Invalid User  ${invalidcredentials}