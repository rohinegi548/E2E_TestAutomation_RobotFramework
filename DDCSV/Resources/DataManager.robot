*** Settings ***
Documentation  Use this layer to get data from CSV File
Library  ../CustomLib/CSV.py

*** Keywords ***
Get CSV Data
    [Arguments]  ${filepath}
    ${data}  read csv file  ${filepath}
    [Return]  ${data}