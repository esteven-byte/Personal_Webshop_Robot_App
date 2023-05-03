*** Settings ***
Library  demostore.miscLibraries.TheKeyDecorator


*** Test Cases ***
Refund calculate correctly
    The user have request a refund
    the order should be refunded fully