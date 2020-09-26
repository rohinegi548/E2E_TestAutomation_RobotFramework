*** Settings ***
Library  SeleniumLibrary


*** Keywords ***
Checkout Preview Page Loaded
    Wait Until Page Contains  Checkout: Your Information

Enter First Name
    [Arguments]  ${firstname}
    Input Text  id=first-name  ${firstname}

Enter Last Name
    [Arguments]  ${lastname}
    Input Text  id=last-name  ${lastname}

Enter Postal Code
    [Arguments]  ${postal_code}
    Input Text  id=postal-code  ${postal_code}

Continue To Order Preview
    Click Button  CONTINUE