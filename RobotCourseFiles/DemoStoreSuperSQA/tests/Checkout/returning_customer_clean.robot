*** Settings ***
Library  SeleniumLibrary    implicit_wait=30

Resource  ../resources/checkout_page_resources.robot

*** Test Cases ***
Add two items to the carts and check returning customers message is displayed

    Go to site local quicksite
    add two items to the cart
    verfiy returning customer message


