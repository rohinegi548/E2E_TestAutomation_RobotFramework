*** Settings ***
Library  SeleniumLibrary


*** Keywords ***
Cart Page Loaded
    Wait Until Page Contains  REMOVE
    Page Should Contain  CHECKOUT

Click On Checkout Button
    Click Element  xpath=//*[@id="cart_contents_container"]/div/div[2]/a[2]