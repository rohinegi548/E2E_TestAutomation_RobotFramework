*** Settings ***

*** Test Cases ***
TEST CASE1
    [Documentation]  TC1 DOCUMENTATION
    [Tags]  TC1
    Do Something
    Do Something Else

TEST CASE2
    [Documentation]  TC2 DOCUMENTATION
    [Tags]  TC2
    Do Another thing
    Do Something Else


*** Keywords ***
Do Something
    log  i am doing something
    log to console  i am doing something
Do Something Else
    log  i am doing something else
    log to console  i am doing something else
Do Another thing
    log  i did another thing
    log to console  i did another thing

