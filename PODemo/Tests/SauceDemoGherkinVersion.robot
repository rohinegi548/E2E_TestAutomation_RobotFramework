*** Settings ***
Documentation  Saucedemo e-commerce application automation
Resource  ../Resources/SaucedemoUI.robot
Resource  ../Resources/Common.robot
Test Setup  Begin Web Test
Test Teardown  End Web Test
Suite Teardown  Generate Allure Report

*** Test Cases ***
Verify An Invalid User Is Not Able To Login
    [Documentation]  Verification of Negative Testing Scenario For Login
    [Tags]  NegativeScenario
    Login As An Invalid User


Verify E2E Product Order Flow For A Valid User
    [Documentation]  E2E Product Order Flow For A Valid User
    [Tags]  Smoke  PostivieScenario
    Given Verify Title Of The Landed Page
    When Login As A Valid User
    Then Verify Logged In Successfully
    When Select An Item And ADD It To The Cart
    Then Verify Cart Page Gets Loaded
    When Proceed To Checkout & Verify Checkout Page Loaded
    And Enter Shipping Details & Continue
    Then Verify Checkout:Overview Page Loaded & Continue To Place Order
    And Verify Order Confirmation Page Loaded
    When Logout From The SauceDemo Website
    Then Verify Logout Successfully