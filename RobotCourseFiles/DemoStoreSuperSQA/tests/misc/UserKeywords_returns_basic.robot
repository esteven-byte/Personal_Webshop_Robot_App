
*** Test Cases ***
Demo of user keyword returning 1 value

    ${now}  I get the current datetime
    log to console  Returned is: ${now}

Demo of user keyword returning multiple values

       ${n1}   ${n2}    ${n3}  I get 3 random numbers
       log to console  ${\n}
       log to console  ${n1}
       log to console  ${n2}
       log to console  ${n3}

Demo of user keyword returning multiple values and takes arguments
   ${n1}   ${n2}    ${n3}  I get 3 random numbers with upper and lower limit  50  100
   log to console  ${\n}
   log to console  ${n1}
   log to console  ${n2}
   log to console  ${n3}

*** Keywords ***
I get the current datetime

    ${current_time}     get time
    log to console  ${\n}
    log to console  The current times ${current_time}

    [Return]  ${current_time}

I get 3 random numbers

    ${num1}     evaluate  random.randint(0, 20)     modules=random
    ${num2}     evaluate  random.randint(0, 20)     modules=random
    ${num3}     evaluate  random.randint(0, 20)     modules=random

    [Return]  ${num1}   ${num2}     ${num3}

I get 3 random numbers with upper and lower limit

    [Arguments]  ${min}  ${max}

    ${num1}     evaluate  random.randint(${min}, ${max})     modules=random
    ${num2}     evaluate  random.randint(${min}, ${max})     modules=random
    ${num3}     evaluate  random.randint(${min}, ${max})     modules=random

    [Return]  ${num1}   ${num2}     ${num3}