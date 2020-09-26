*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${SIGNUP_USERNAME}  id:sign-username
${SIGNUP_PASSWORD}  id:sign-password
${SIGNUP_MOD_POPUP}  id:signInModalLabel

*** Keywords ***
User Enters "Username" Field
    #[Arguments]  ${USERNAME}
    wait until element is visible  ${SIGNUP_USERNAME}
    input text  ${SIGNUP_USERNAME}  ${USERNAME}
    sleep  2s

User Enters "Passwrord" Field
    #[Arguments]  ${PASSWORD}
    wait until element is visible  ${SIGNUP_PASSWORD}
    input password  ${SIGNUP_PASSWORD}  ${PASSWORD}
    sleep  2s

User Click On "Signup" Button
    click button  Sign up
    sleep  2s

Signup Popup Should Be Loaded
    wait until element is visible  ${SIGNUP_MOD_POPUP}
    element should be visible  ${SIGNUP_MOD_POPUP}
    sleep  2s

Signup Should Be Successful
    handle alert  LEAVE
    run keyword   capture page screenshot
    ${alert_msg}  handle alert  ACCEPT  2s
    should be equal as strings  ${alert_msg}  Sign up successful.