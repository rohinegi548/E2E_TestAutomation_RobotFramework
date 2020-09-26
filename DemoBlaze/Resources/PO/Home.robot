*** Settings ***
Library  SeleniumLibrary

*** Variables ***


*** Keywords ***
Homepage Loaded
    ${homepage_url}  get location
    should contain  ${homepage_url}  demoblaze.com