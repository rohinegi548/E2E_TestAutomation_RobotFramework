*** Settings ***
Library  SeleniumLibrary


*** Keywords ***
Order Review Page Loaded
    Wait Until Page Contains  Checkout: Overview

Continue To Confirm Order
    Click Element  xpath=//*[@id="checkout_summary_container"]/div/div[2]/div[8]/a[2]