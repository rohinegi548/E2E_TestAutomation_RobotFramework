*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${TOP_NAV_SIGNUP_LNK}  id:signin2

*** Keywords ***
User Click On "Signup" Link
    click link  ${TOP_NAV_SIGNUP_LNK}