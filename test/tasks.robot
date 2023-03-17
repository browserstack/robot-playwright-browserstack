*** Settings ***
Documentation       Playwright template.

Library             ./CustomLib.py
Library             String
Library     Browser    jsextension=${EXECDIR}/test/browserstackStatus.js

*** Tasks ***
Minimal task
    ${cdpURL}=    Create Cdp Url
    Connect To Browser    ${cdpURL}
    New Page    https://bstackdemo.com/
    Click    xpath=//*[@id="1"]/div[4]
    ${assert}=    Get Element Count    xpath=//*[@id="__next"]/div/div/div[2]/div[2]/div[2]    ==    1
    Log To Console    "HELLOO"
    Log To Console    ${PREV_TEST_STATUS}
    Log To Console    ${TEST_NAME}    
    SetStatus    ${PREV_TEST_STATUS}
    SetSessionName    ${TEST_NAME}
    Close Browser    ALL