*** Settings ***
Library  OperatingSystem

*** Keywords ***
Clean Stuff Before Test Run
    #Remove Files  results/allure/*.*  results/robot-report/*.png
    Remove Files  Results/allure-results/*.*
    Remove Directory  Results/allure-report  recursive=yes
    #Remove Files  Results/robot-report/*.png
    Remove Files  Results/robot-report/*.png  Results/robot-report/*.html  Results/robot-report/*.log
Post Run Steps
    Close Browser
    Run  allure generate results/allure-results -o results/allure-report
    Copy Files  results/robot-report/*.png  results/allure-report/data/attachments