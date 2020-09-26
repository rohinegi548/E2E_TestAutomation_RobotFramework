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
    [Arguments]  ${firstname}
    Input Text  ${CHK_PRV_FIRST_NAME}  ${firstname}

Enter Last Name
    [Arguments]  ${lastname}
    Input Text  ${CHK_PRV_LAST_NAME}  ${lastname}

Enter Postal Code
    [Arguments]  ${postal_code}
    Input Text  ${CHK_PRV_PSTL_CD}  ${postal_code}

Continue To Order Preview
    Click Button  CONTINUE