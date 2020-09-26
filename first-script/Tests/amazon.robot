*** Settings ***
Documentation  Data Driven Test for FSE Users
Library    SeleniumLibrary
Test Setup  Open WebURL in Browser
#Test Teardown  close browser
Test Template  Verfification for FSEs/Non-FSEs login functionalities

*** Variables ***
${options}
${browser}=  edge
${fse_user}=  qmlasmtestuser2
${fse_passwd}=  Lam12345
${nonfse_user}=  negiro
${nonfse_passwd}=  Lam@5764


*** Test Cases ***          Username            Passwd
Login with FSE User         ${fse_user}         ${fse_passwd}
Login with Non-FSE User     ${nonfse_user}      ${nonfse_passwd}


*** Keywords ***
Verfification for FSEs/Non-FSEs login functionalities
        [Arguments]  ${username}  ${password}
        Input username  ${username}
        Input passwd  ${password}
        click element  id=submitButton
        click element  id=CertificateAuthentication
        sleep  10s
        input text  id=iqmsNumberId     6779
        sleep  5s
        press keys  id=iqmsNumberId  RETURN
        sleep  5s
        #execute javascript  document.querySelector("#searchNCETable > tbody > tr > td:nth-child(8) > a").click();
        #click link  link=6779
        execute javascript  document.evaluate('//*[@id="searchNCETable"]/tbody/tr/td[2]/a',document.body,null,9,null).singleNodeValue.click();
        wait until element is visible  xpath=//li/a[contains(text(),'Message Log')]  timeout=30s
        sleep  5s

Input username
        [Arguments]  ${username}
        input text  id=userNameInput  ${username}
Input passwd
        [Arguments]  ${password}
        input password  id=passwordInput  ${password}

Run ie Browser
        open browser  http://qa-quality.mylam.com  ${browser}
        execute javascript  document.body.style.zoom = "100%";
        maximize browser window
        sleep  3s

Run firefox Browser
        open browser  http://qa-quality.mylam.com  ${browser}
        execute javascript  document.body.style.zoom = "100%";
        maximize browser window
        sleep  3s

Run edge Browser
        open browser  http://qa-quality.mylam.com  ${browser}
        execute javascript  document.body.style.zoom = "100%";
        maximize browser window
        sleep  3s

Run chrome Browser
        ${options}=  Evaluate  sys.modules['selenium.webdriver'].ChromeOptions()  sys, selenium.webdriver
        Call Method    ${options}    add_argument      start-maximized
        Create WebDriver  Chrome    chrome_options=${options}
        go to  http://qa-quality.mylam.com
        #sleep  3s
        #input text  id=userNameInput  negiro
        #input password  id=passwordInput  Lam!12345
        #click element  id=submitButton
Open WebURL in Browser
        run keyword if  '${browser}'=='ie'  Run ie Browser
        run keyword if  '${browser}'=='gc'  Run chrome Browser
        run keyword if  '${browser}'=='firefox'  Run firefox Browser
        run keyword if  '${browser}'=='edge'  Run edge Browser

        #data driven testing in robot framework

