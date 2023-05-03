*** Settings ***
Library  demostore.miscLibraries.FirstPythonCustomLibraryClass
Library  demostore.miscLibraries.FirstPythonCustomLibraryModule


*** Test Cases ***
First test case with custom library

    first method in custom
    second method in custom

Second test case with custom library and class

    first keyword in class
    second keyword in class