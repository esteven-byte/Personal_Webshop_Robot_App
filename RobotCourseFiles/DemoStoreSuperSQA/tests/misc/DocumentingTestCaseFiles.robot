*** Settings ***
Documentation  This is the documentation for DocumentingTestCaseFiles.robot.
...            We can also break into lines if the documentation is too long
...             The 3 dots (...) represent continuation.
...             ${\n} Also we add can a new line.


*** Test Cases ***
First test case
    [Documentation]  This is documentation for the first test case.
    ...              This is actually on a second line.
    ...              ${\n}This is a new line break
    I am user keyword 1
Second test case
    I am user keyword 2
Third test case
    I am user keyword 3


*** Keywords ***
I am user keyword 1
    log to console  I just ran user keyword 1

I am user keyword 2
    [Documentation]  This documentation for user Keyword.
    ...               This is the 2nd line for user Keyword
    log to console  I just ran user keyword 2

I am user keyword 3
    log to console  I just ran user keyword 3