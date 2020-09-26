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
    Verify Title Of The Landed Page
    Login As A Valid User
    Verify Logged In Successfully
    Select An Item And ADD It To The Cart
    Verify Cart Page Gets Loaded
    Proceed To Checkout & Verify Checkout Page Loaded
    Enter Shipping Details & Continue
    Verify Checkout:Overview Page Loaded & Continue To Place Order
    Verify Order Confirmation Page Loaded
    Logout From The SauceDemo Website
    Verify Logout Successfully