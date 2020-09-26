*** Settings ***
Library  SeleniumLibrary


*** Keywords ***
Order Confirmation Page Loaded
    Wait Until Page Contains  THANK YOU FOR YOUR ORDER
    Page Should Contain  Your order has been dispatched, and will arrive
