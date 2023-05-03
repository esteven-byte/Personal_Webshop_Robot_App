*** Settings ***
Library  SeleniumLibrary
Resource  ../resources/MyAccountVariable.robot
Resource  ../resources/MyAccountKeywords.robot

Test Setup  I go to my account page
Test Teardown  Close browser

*** Test Cases ***
Login without username and password should show correct error

    click element   ${login_button}
    ${act_msg}      get text        ${error_msg_box}
    should be equal  ${act_msg}     Error: Username is required.

Login without password should show correct error

    input text      ${user_name_field}      ${fakename}
    click element   ${login_button}
    ${act_msg}      get text        ${error_msg_box}
    should be equal  ${act_msg}     Error: The password field is empty.


Login with invalid username and password should show correct error

    input text      ${user_name_field}      ${fakename}
    input text      ${user_password_field}  ${fakepassword}
    click element   ${login_button}
    ${act_msg}      get text        ${error_msg_box}
    should be equal  ${act_msg}     ${invalid_username_password}