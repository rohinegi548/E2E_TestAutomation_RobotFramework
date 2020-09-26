*** Settings ***
Library  SeleniumLibrary
Library  OperatingSystem

*** Keywords ***
Begin Web Test
    [Arguments]  ${env_url}  ${browser}
    Open Browser  ${env_url.${ENV}}  ${browser}
    Maximize Browser Window

End Web Test
    Close Browser

Generate Allure Report
    Run  allure generate results/allure-results -o results/allure-report
    Copy Files  results/robot-report/*.png  results/allure-report/data/attachments