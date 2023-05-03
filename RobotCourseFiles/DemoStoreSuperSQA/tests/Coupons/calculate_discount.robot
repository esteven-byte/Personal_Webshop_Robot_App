*** Settings ***
Library  SeleniumLibrary    implicit_wait=30
Library  demostore.coupons.Coupons

*** Variables ***
${HOME PAGE URL}    http://localhost/quicksite/
${BROWSER}          chrome
${CART}             ${HOME PAGE URL}cart/
${ENTER}            RETURN
${CART TOTAL LOCATOR}   CSS=td[data-title="Total"]
${CART DISCOUNT LOCATOR}    css=tr.cart-discount

*** Test Cases ***
Coupon should be applied correctly
    Open browser    ${HOME PAGE URL}    ${BROWSER}
    click link      css=a.button.product_type_simple
    wait until element contains     css:span.count  1 item

    go to           ${CART}
    ${VALID COUPON}       get a valid coupon
    ${CODE}=    evaluate  ${VALID COUPON}.get('code')
    ${DISCOUNT PERCENT}     EVALUATE  ${VALID COUPON}.get('discount')

    # get the toatl amount displayed
    ${total before coupon}   get text    ${CART TOTAL LOCATOR}
    LOG TO CONSOLE  Total before coupon is: ${total before coupon}

    input text      id=coupon_code  ${CODE}
    press keys       id=coupon_code  ${ENTER}
    ${success message}  get text  class=woocommerce-message
    should be equal       ${success message}    Coupon code applied successfully.

    # get the new total price after the coupon is applied
#    wait until element is visible  ${CART DISCOUNT LOCATOR}
    wait until element does not contain  ${CART TOTAL LOCATOR}  ${total before coupon}
    ${total after coupon}   get text    ${CART TOTAL LOCATOR}
    LOG TO CONSOLE  Total after coupon is: ${total after coupon}

    discount should be calculated correctly  ${total before coupon}  ${total after coupon}   ${DISCOUNT PERCENT}