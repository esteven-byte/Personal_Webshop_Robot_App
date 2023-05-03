*** Settings ***
Library  SeleniumLibrary
Resource  ../resources/MyAccountVariable.robot


*** Test Cases ***
Login without username and password should show correct error

    open browser    about:blank     Chrome
    Go to           ${my_account_home_url}
    click element   ${login_button}
    ${act_msg}  get text        ${error_msg_box}
    should be equal  ${act_msg}     Error: Username is required.
    close browser

Login without password should show correct error

    open browser    about:blank     Chrome
    Go to           ${my_account_home_url}
    input text      ${user_name_field}      ${fakename}
    click element   ${login_button}
    ${act_msg}  get text        ${error_msg_box}
    should be equal  ${act_msg}     Error: The password field is empty.
    close browser

Login with invalid username and password should show correct error

    open browser    about:blank     Chrome
    Go to           ${my_account_home_url}
    input text      ${user_name_field}      ${fakename}
    input text      ${user_password_field}  ${fakepassword}
    click element   ${login_button}
    ${act_msg}  get text        ${error_msg_box}
    should be equal  ${act_msg}     ${invalid_username_password}
    close browser