*** Settings ***
Library  SeleniumLibrary    implicit_wait=30

*** Variables ***
${HOME PAGE URL}                http://localhost/quicksite/
${BROWSER}                      chrome
${CART}                         ${HOME PAGE URL}cart/
${ENTER}                        RETURN
${CART TOTAL LOCATOR}           CSS=td[data-title="Total"]
${CART DISCOUNT LOCATOR}        css=tr.cart-discount
${CHECKOUT BUTTON}              css=a.checkout-button
${ITEM BEANIE}                  CSS=.button[data-product_id="16"]
${ITEM ALBUM}                   CSS=.button[data-product_id="24"]
${VIEW ITEMS CART}              CSS=a.cart-contents
${RETURN CUSTOMER MSG}          Returning customer? Click here to login
${RETURN CUSTOMER DISPLAY}      css=div.woocommerce-form-login-toggle


*** Test Cases ***
Add two items to the carts and check returning customers message is displayed

    Go to site local quicksite
    add two items to the cart
    verfiy returning customer message


*** Keywords ***
Go to site local quicksite
    set selenium implicit wait  10
    open browser    about:blank     ${BROWSER}
    go to                           ${HOME PAGE URL}

add two items to the cart
    click element                   ${ITEM BEANIE}
    wait until element contains     ${VIEW ITEMS CART}    1 item
    click element                   ${ITEM ALBUM}
    wait until element contains     ${VIEW ITEMS CART}    2 items

verfiy returning customer message
    go to                           ${CART}
    click element                   ${CHECKOUT BUTTON}
    element text should be          ${RETURN CUSTOMER DISPLAY}    ${RETURN CUSTOMER MSG}