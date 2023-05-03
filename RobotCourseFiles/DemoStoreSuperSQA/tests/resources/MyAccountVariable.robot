*** Variables ***
${my_account_home_url}          http://localhost/quicksite/my-account
${login_button}                 name=login
${error_msg_box}                css=#content > div > div.woocommerce > ul > li
${user_name_field}              name=username
${user_password_field}          name=password
${fakename}                     fakename
${fakepassword}                 fakepassword
${invalid_username_password}    Error: The username ${fakename} is not registered on this site. If you are unsure
...                             of your username, try your email address instead.