*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${item1}    1
${item2}    2

*** Test Cases ***
50% coupon should discount total by half

    Add 2 items to cart     ${item1}    ${item2}
    Apply 50% off coupon    50-6

*** Keywords ***
Add 2 items to cart

    [Arguments]  ${item1 locator}   ${item2locator}
    log to console  ${item1 locator}
    log to console  ${item2locator}

Apply 50% off coupon

    [Arguments]  ${coupon_locator}  ${coupon_code}=xxz
    log to console  ${coupon_locator}
    log to console  ${coupon_code}
