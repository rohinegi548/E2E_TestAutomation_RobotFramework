*** Settings ***
Library  SeleniumLibrary


*** Keywords ***
Wait For Homepage Load After Login
    Wait Until Page Contains  Products

Homepage Loaded
    ${curr_url}=  Get Location
    Should Contain  ${curr_url}  inventory

Click On Add To Cart
    Click Button  ADD TO CART

GoTo Cart Page
    Click Element  xpath=//*[@id="shopping_cart_container"]/a

Finding Logout Link & Clicking On It
    Click Button  Open Menu
    Wait Until Element is Visible  logout_sidebar_link
    Click Link  logout_sidebar_link