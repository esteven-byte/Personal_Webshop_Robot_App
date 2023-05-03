*** Settings ***
Library  SeleniumLibrary    implicit_wait=30
Library  demostore.coupons.Coupons

*** Variables ***
${HOME PAGE URL}    http://localhost/quicksite/
${BROWSER}          firefox
${CART}             ${HOME PAGE URL}cart/
${ENTER}            RETURN

*** Test Cases ***
Valid coupon should show success message
    Open browser    ${HOME PAGE URL}    ${BROWSER}
    click link      css=a.button.product_type_simple
    wait until element contains     css:span.count  1 item
    go to           ${CART}
    ${VALID COUPON}       get a valid coupon
    log             The valid coupon is ${VALID COUPON}   console=True
    ${CODE}=    evaluate  ${VALID COUPON}.get('code')
    ${DISCOUNT PERCENT}     EVALUATE  ${VALID COUPON}.get('discount')

    input text      id=coupon_code  ${CODE}
    press keys       id=coupon_code  ${ENTER}

    ${success message}  get text  class=woocommerce-message
    should be equal       ${success message}    Coupon code applied successfully.
    close browser


Invalid coupon should show unsuccessful message
    Open browser    ${HOME PAGE URL}    ${BROWSER}
    click link      css=a.button.product_type_simple
    wait until element contains     css:span.count  1 item
    go to           ${CART}
    ${INVALID COUPON}       Get an expired coupon
    log             The valid coupon is ${INVALID COUPON}   console=True
    ${CODE}=    evaluate  ${INVALID COUPON}.get('code')
    ${DISCOUNT PERCENT}     EVALUATE  ${INVALID COUPON}.get('discount')

    input text      id=coupon_code  ${CODE}
    press keys       id=coupon_code  ${ENTER}

    wait until element is visible  class=woocommerce-error
    ${unsuccessful message}  get text  class=woocommerce-error
    should be equal       ${unsuccessful message}    Coupon "${CODE}" does not exist!
    close browser