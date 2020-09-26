*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${ORDR_RVW_FINISH}  xpath=//*[@id="checkout_summary_container"]/div/div[2]/div[8]/a[2]

*** Keywords ***
Order Review Page Loaded
    Wait Until Page Contains  Checkout: Overview

Continue To Confirm Order
    Click Element  ${ORDR_RVW_FINISH}