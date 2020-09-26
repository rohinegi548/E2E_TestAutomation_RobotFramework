*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${CHK_PRV_FIRST_NAME}  id=first-name
${CHK_PRV_LAST_NAME}  id=last-name
${CHK_PRV_PSTL_CD}  id=postal-code

*** Keywords ***
Checkout Preview Page Loaded
    Wait Until Page Contains  Checkout: Your Information

Enter First Name
    [Arguments]  ${cust_ship_data}
    Input Text  ${CHK_PRV_FIRST_NAME}  ${cust_ship_data.firstname}

Enter Last Name
    [Arguments]  ${cust_ship_data}
    Input Text  ${CHK_PRV_LAST_NAME}  ${cust_ship_data.lastname}

Enter Postal Code
    [Arguments]  ${cust_ship_data}
    Input Text  ${CHK_PRV_PSTL_CD}  ${cust_ship_data.postalcode}

Continue To Order Preview
    Click Button  CONTINUE