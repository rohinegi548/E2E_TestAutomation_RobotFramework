*** Settings ***
Documentation  saucedemo e-commerce application automation
Library  SeleniumLibrary
Library  OperatingSystem
Resource  ../Resources/Cleaning.robot
#Suite Setup  Remove Files  Results/allure/*.*  Results/*.png
Suite Teardown  Post Run Steps

*** Variables ***
${username}=  standard_user
${password}=  secret_sauce
${firstname}=  Alex
${lastname}=  Casto
${postalcode}=  160062


*** Test Cases ***
Launch SauceDemo Website
    [Documentation]  SauceDemo Homepage should be loaded
    [Tags]  Smoke
    Open Browser  https://www.saucedemo.com  ff
    ${title}=  get title
    Should Contain  ${title}  Swag  ignore_case=True

Login with Correct Credentials
    [Documentation]  User should be able to login successfully
    [Tags]  Login
    Input Text  id=user-name  ${username}
    Input Password  id=password  ${password}
    Press Keys  id=password  RETURN
    Wait Until Page Contains  Products
    ${curr_url}=  Get Location
    Should Contain  ${curr_url}  inventory

Select an Item and add to cart
    [Documentation]  Add item to cart from product page
    [Tags]  AddToCart
    Click Button  ADD TO CART
    Click Element  xpath=//*[@id="shopping_cart_container"]/a
    Wait Until Page Contains  REMOVE
    Page Should Contain  CHECKOUT

Proceed to Checkout
    [Documentation]  Proceeding for checkoout
    [Tags]  Checkout
    Click Element  xpath=//*[@id="cart_contents_container"]/div/div[2]/a[2]
    Wait Until Page Contains  Checkout: Your Information
    Input Text  id=first-name  ${firstname}
    Input Text  id=last-name  ${lastname}
    Input Text  id=postal-code  ${postalcode}
    Click Button  CONTINUE
    Wait Until Page Contains  Checkout: Overview
    Click Element  xpath=//*[@id="checkout_summary_container"]/div/div[2]/div[8]/a[2]
    Wait Until Page Contains  THANK YOU FOR YOUR ORDER
    Page Should Contain  Your order has been dispatched, and will arrive

Logout the user
    [Documentation]  User should be logout
    [Tags]  Logout
    Click Button  Open Menu
    Wait Until Element is Visible  logout_sidebar_link
    Click Link  logout_sidebar_link
    ${main_url}=  Get location
    #Wait Until Page Contains  Accepted usernames are:
    Should Be Equal As Strings  ${main_url}  https://www.saucedemo.com/index.html


*** Keywords ***

