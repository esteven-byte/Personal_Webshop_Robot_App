*** Settings ***
Library  SeleniumLibrary
Resource  ../resources/MyAccountVariable.robot

Suite Setup  Open browser   about:blank     Chrome
Suite Teardown  Close browser

*** Test Cases ***
Login without username and password should show correct error

    Go to           ${my_account_home_url}
    click element   ${login_button}
    ${act_msg}      get text        ${error_msg_box}
    should be equal  ${act_msg}     Error: Username is required.

Login without password should show correct error

    Go to           ${my_account_home_url}
    input text      ${user_name_field}      ${fakename}
    click element   ${login_button}
    ${act_msg}      get text        ${error_msg_box}
    should be equal  ${act_msg}     Error: The password field is empty.

Login with invalid username and password should show correct error

    Go to           ${my_account_home_url}
    input text      ${user_name_field}      ${fakename}
    input text      ${user_password_field}  ${fakepassword}
    click element   ${login_button}
    ${act_msg}      get text        ${error_msg_box}
    should be equal  ${act_msg}     ${invalid_username_password}