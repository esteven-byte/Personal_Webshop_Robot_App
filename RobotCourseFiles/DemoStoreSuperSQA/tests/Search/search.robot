*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${HOME PAGE URL}    http://demostore.supersqa.com/
${SEARCH FIELD ID}  woocommerce-product-search-field-0
${EXPECTED URL TEXT}    /product/album/
${ASCI CODE FOR ENTER}  RETURN
${EXISTING ITEM SEARCH TERM}    album

${NON EXISTING ITEM SEARCH TERM}    Fluying Ninja
${MSG BOX CLASS}    woocommerce-info
${NOT FOUND MSG}    No products were found matching your selection.


*** Test Cases ***
User should able to search for an existing product
    Open browser    about:blank  Chrome
    Go to   ${HOME PAGE URL}
    Input Text  ${SEARCH FIELD ID}   ${EXISTING iTEM SEARCH TERM}
    press keys  ${SEARCH FIELD ID}    ${ASCI CODE FOR ENTER}
    location should contain  ${EXPECTED URL TEXT}

User should see correct message when searching none existing item
    Open browser    about:blank  Chrome
    Go to   ${HOME PAGE URL}
    Input Text  ${SEARCH FIELD ID}   ${NON EXISTING iTEM SEARCH TERM}
    press keys  ${SEARCH FIELD ID}    ${ASCI CODE FOR ENTER}
    element text should be  class=${MSG BOX CLASS}  ${NOT FOUND MSG}