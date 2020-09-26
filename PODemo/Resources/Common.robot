*** Settings ***
Library  SeleniumLibrary
Library  OperatingSystem

*** Keywords ***
Begin Web Test
    Open Browser  https://www.saucedemo.com  gc
    Maximize Browser Window

End Web Test
    Close Browser

Generate Allure Report
    Run  allure generate results/allure-results -o results/allure-report
    Copy Files  results/robot-report/*.png  results/allure-report/data/attachments