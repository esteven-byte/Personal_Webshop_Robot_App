*** Settings ***
Library  SeleniumLibrary
Library  demostore.homepage.homepage

*** Test Cases ***
Home page should have 16 items displayed

    open browser    about:blank        Firefox
    go to  http://demostore.supersqa.com/
    verify 16 products are displayed
    close browser