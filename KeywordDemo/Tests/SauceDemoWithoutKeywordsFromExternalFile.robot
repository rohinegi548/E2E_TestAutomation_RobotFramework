*** Settings ***
Documentation  saucedemo e-commerce application automation
Library  SeleniumLibrary
Library  OperatingSystem
Suite Teardown  Close Browser

*** Variables ***
${username}=  standard_user
${password}=  secret_sauce
${firstname}=  Alex
${lastname}=  Casto
${postalcode}=  160062


*** Test Cases ***
Verify E2E Product Order Flow For A Valid User
    [Documentation]  E2E Product Order Flow For A Valid User
    [Tags]  Smoke
    Launch SauceDemo Website
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

*** Keywords ***
Launch SauceDemo Website
    Open Browser  https://www.saucedemo.com  ff

Verify Title Of The Landed Page
    ${title}=  get title
    Should Contain  ${title}  Swag  ignore_case=True

Login As A Valid User
    Input Text  id=user-name  ${username}
    Input Password  id=password  ${password}
    Press Keys  id=password  RETURN
    Wait Until Page Contains  Products

Verify Logged In Successfully
    ${curr_url}=  Get Location
    Should Contain  ${curr_url}  inventory

Select An Item And ADD It To The Cart
    Click Button  ADD TO CART
    Click Element  xpath=//*[@id="shopping_cart_container"]/a

Verify Cart Page Gets Loaded
    Wait Until Page Contains  REMOVE
    Page Should Contain  CHECKOUT

Proceed To Checkout & Verify Checkout Page Loaded
    Click Element  xpath=//*[@id="cart_contents_container"]/div/div[2]/a[2]
    Wait Until Page Contains  Checkout: Your Information

Enter Shipping Details & Continue
    Input Text  id=first-name  ${firstname}
    Input Text  id=last-name  ${lastname}
    Input Text  id=postal-code  ${postalcode}
    Click Button  CONTINUE

Verify Checkout:Overview Page Loaded & Continue To Place Order
    Wait Until Page Contains  Checkout: Overview
    Click Element  xpath=//*[@id="checkout_summary_container"]/div/div[2]/div[8]/a[2]

Verify Order Confirmation Page Loaded
    Wait Until Page Contains  THANK YOU FOR YOUR ORDER
    Page Should Contain  Your order has been dispatched, and will arrive

Logout From The SauceDemo Website
    Click Button  Open Menu
    Wait Until Element is Visible  logout_sidebar_link
    Click Link  logout_sidebar_link

Verify Logout Successfully
    ${main_url}=  Get location
    #Wait Until Page Contains  Accepted usernames are:
    Should Be Equal As Strings  ${main_url}  https://www.saucedemo.com/index.html