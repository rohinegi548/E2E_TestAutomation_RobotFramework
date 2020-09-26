*** Settings ***
Documentation  "Signup Feature Test"
Resource  ../Resources/PO/Signup.robot
Resource  ../Resources/PO/Home.robot
Resource  ../Resources/PO/TopNav.robot
Resource  ../Resources/CommonWeb.robot
Test Setup  Begin Web Test
Test Teardown  End Web Test

*** Variables ***
${USERNAME}  mike.casto.548
${PASSWORD}  mikecasto#1234
@{BROWSER_AND_URL}=  https://www.demoblaze.com/  chrome

*** Test Cases ***
User Should Be Able To "Sign Up"
    [Documentation]  "User is trying to signup and should be able to signup"
    [Tags]  Smoke  Signup
    Given Homepage Loaded
    When User Click On "Signup" Link
    Then Signup Popup Should Be Loaded
    And User Enters "Username" Field
    And User Enters "Passwrord" Field
    And User Click On "Signup" Button
    Then Signup Should Be Successful
