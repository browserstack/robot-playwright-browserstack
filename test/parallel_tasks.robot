*** Settings ***
Documentation       Playwright template.

Library             ./CustomLib.py
Library             String
Library     Browser    jsextension=${EXECDIR}/test/browserstackExecutor.js

*** Tasks ***
Parallel task1
    ${cdpURL}=    Create Cdp Url
    Connect To Browser    ${cdpURL}
    New Page    https://bstackdemo.com/
    Click    xpath=//*[@id="1"]/div[4]
    ${assert}=    Get Element Count    xpath=//*[@id="__next"]/div/div/div[2]/div[2]/div[2]    ==    1
    SetStatus    ${assert}
    SetSessionName    ${TEST_NAME}
    Close Browser    ALL
Parallel task2
    ${cdpURL}=    Create Cdp Url
    Connect To Browser    ${cdpURL}
    New Page    https://bstackdemo.com/
    Click    xpath=//*[@id="1"]/div[4]
    ${assert}=    Get Element Count    xpath=//*[@id="__next"]/div/div/div[2]/div[2]/div[2]    ==    1
    SetStatus    ${assert}
    SetSessionName    ${PREV_TEST_NAME}
    Close Browser    ALL
Parallel task3
    ${cdpURL}=    Create Cdp Url
    Connect To Browser    ${cdpURL}
    New Page    https://bstackdemo.com/
    Click    xpath=//*[@id="1"]/div[4]
    ${assert}=    Get Element Count    xpath=//*[@id="__next"]/div/div/div[2]/div[2]/div[2]    ==    1
    SetStatus    ${assert}
    SetSessionName    ${PREV_TEST_NAME}
    Close Browser    ALL