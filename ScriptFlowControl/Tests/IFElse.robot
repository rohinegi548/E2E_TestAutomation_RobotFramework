*** Settings ***
Library  BuiltIn

*** Variables ***
${marvar} =  2

*** Test Cases ***
IFElseDemo
    Run Keyword If  ${marvar} > 3  keyword1
    Run Keyword If  ${marvar} > 3  keyword1  ELSE  keyword2
    Run Keyword If  ${marvar} > 3  keyword1 ELSE IF  ${marvar} < 3  keyword2  ELSE  keyword3

*** Keywords ***
keyword1
    log  iamin1
keyword2
    log  iamin2
keyword3
    log  iamin3
keyword4
    log to console  keyword4