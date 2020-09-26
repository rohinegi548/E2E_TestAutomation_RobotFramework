*** Settings ***
Resource  ./PO/Login.robot
Resource  ./PO/Homepage.robot
Resource  ./PO/Cart.robot
Resource  ./PO/CheckoutPreview.robot
Resource  ./PO/OrderReview.robot
Resource  ./PO/OrderConfirmation.robot

*** Variables ***
#Valid Login Credentials
${username}=  standard_user
${password}=  secret_sauce

#Invalid Login Credentials
${inv_user}  hello
${inv_passwd}  there

#shipping details info
${firstname}=  Alex
${lastname}=  Casto
${postalcode}=  160062

*** Keywords ***
Verify Title Of The Landed Page
    Loginpage Loaded

Login As A Valid User
    Enter Username  ${username}
    Enter Password  ${password}
    Submit Login Form With Credentials
    Wait For Homepage Load After Login

Login As An Invalid User
    Enter Username  ${inv_user}
    Enter Password  ${inv_passwd}
    Submit Login Form With Credentials
    Wait For Error Message On Login Page

Verify Logged In Successfully
    Homepage Loaded

Select An Item And ADD It To The Cart
    Click On Add To Cart
    GoTo Cart Page

Verify Cart Page Gets Loaded
    Cart Page Loaded

Proceed To Checkout & Verify Checkout Page Loaded
    Click On Checkout Button
    Checkout Preview Page Loaded

Enter Shipping Details & Continue
    Enter First Name  ${firstname}
    Enter Last Name  ${lastname}
    Enter Postal Code  ${postalcode}
    Continue To Order Preview

Verify Checkout:Overview Page Loaded & Continue To Place Order
    Order Review Page Loaded
    Continue To Confirm Order

Verify Order Confirmation Page Loaded
    Order Confirmation Page Loaded

Logout From The SauceDemo Website
    Finding Logout Link & Clicking On It

Verify Logout Successfully
    Loginpage URL Loaded