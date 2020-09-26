*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${CART_CHECKOUT_BTN}  xpath=//*[@id="cart_contents_container"]/div/div[2]/a[2]

*** Keywords ***
Cart Page Loaded
    Wait Until Page Contains  REMOVE
    Page Should Contain  CHECKOUT

Click On Checkout Button
    Click Element  ${CART_CHECKOUT_BTN}