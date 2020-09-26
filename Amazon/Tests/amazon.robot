*** Settings ***
Documentation  This is a sample suite to launch Amazon website
Library  SeleniumLibrary
Library  OperatingSystem
Resource  ../Resources/Cleaning.robot
Suite Setup  Clean Stuff Before Test Run

*** Variables ***


*** Test Cases ***
Launch Amazon Website
    [Documentation]  This is sample test case to Launch Amazon website
    [Tags]  This is a smoke test
    [Teardown]  Close Browser
    Open Browser  http://amazon.com  ff
    ${title}=  get title
    Should Contain  ${title}  Amazon.com: Online Shopping For  ignore_case=True
    Input Text  //input[@id='twotabsearchtextbox']  t470 lenovo thinkpad
    Press Keys  //input[@id='twotabsearchtextbox']  RETURN
    Sleep  10s
    Scroll Element Into View  xpath://*[@id="search"]/div[1]/div/div[1]/div/span[3]/div[2]/div[1]/div/span/div/div/div/div/div[2]/div[2]/div/div[1]/div/div/div[1]/h2/a
    Sleep  5s
    Click Image  xpath://*[@id="search"]/div[1]/div/div[1]/div/span[3]/div[2]/div[1]/div/span/div/div/div/div/div[2]/div[2]/div/div[1]/div/div/div[1]/h2/a
    Wait Until Element Is Visible  //input[@value='Add to Cart']
    Click Button  //input[@value='Add to Cart']
    Wait Until Element Is Visible  xpath://*[@id="attach-sidesheet-checkout-button"]/span/input

    Click Button  xpath://*[@id="attach-sidesheet-checkout-button"]/span/input
    ${curr_title}=  get title
    Should Contain  ${curr_title}  Amazon Sign-In

*** Keywords ***

