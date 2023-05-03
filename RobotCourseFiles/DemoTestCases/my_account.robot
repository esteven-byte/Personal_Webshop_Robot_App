*** Settings ***
Documentation     Simple example using SeleniumLibrary.
Library           SeleniumLibrary

*** Variables ***
${LOGIN URL}      http://localhost/quicksite/
${BROWSER}        Firefox

*** Test Cases ***
Valid Login
    Open Browser To Login Page
    Search For Beanies  beanie
    [Teardown]    no operation

*** Keywords ***
Open Browser To Login Page
    Open Browser    ${LOGIN URL}    ${BROWSER}
    Title Should Be    Quick Site

Input Username
    [Arguments]    ${username}
    Input Text    username_field    ${username}

Input Password
    [Arguments]    ${password}
    Input Text    password_field    ${password}

Submit Credentials
    Click Button    login_button

Welcome Page Should Be Open
    Title Should Be    Welcome Page

Search For Beanies
    [Arguments]   ${search}
    Input Text      css=input#woocommerce-product-search-field-0  ${search}
    press keys      css=input#woocommerce-product-search-field-0  RETURN