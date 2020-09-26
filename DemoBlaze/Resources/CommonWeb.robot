*** Settings ***
Library  SeleniumLibrary

*** Variables ***
#@{BROWSER_AND_URL}=  https://www.demoblaze.com/  chrome

*** Keywords ***
Begin Web Test
    #[Arguments]  @{BROWSER_AND_URL}
    #log  @{BROWSER_AND_URL}
    open browser  @{BROWSER_AND_URL}[0]  @{BROWSER_AND_URL}[1]
    maximize browser window

End Web Test
    close browser