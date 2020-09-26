*** Settings ***
Documentation  Saucedemo e-commerce application automation
Resource  ../Resources/SaucedemoUI.robot
Resource  ../Resources/Common.robot
Resource  ../Resources/SauceDemoUI.robot
Resource  ../Resources/DataManager.robot
Resource  ../Data/InputData.robot

Test Setup  Begin Web Test  ${ENV_URLS}  ${BROWSER}
Test Teardown  End Web Test
Suite Teardown  Generate Allure Report

*** Test Cases ***
Verify Login Should Fail For Invalid Credentials
    [Documentation]  Verification of Negative Testing Scenario For Login
    [Tags]  NegativeScenarios
    [Teardown]  End Web Test
    ${invalid_login_scenarios}  Get CSV Data  ${INVALID_CRED_LOGINCHECK_CSV_PATH}
    Logincheck For Invalid Scenarios  ${invalid_login_scenarios}

