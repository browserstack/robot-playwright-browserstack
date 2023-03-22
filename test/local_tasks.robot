*** Settings ***
Documentation       Playwright template.

Library             ./CustomLib.py
Library             String
Library     Browser    jsextension=${EXECDIR}/test/browserstackExecutor.js

*** Tasks ***
Local task1
    ${cdpURL}=    Run Local
    Connect To Browser    ${cdpURL}
    New Page    localhost:45454
    ${assert}=    Get Title    ==    "BrowserStack Local"
    SetStatus    ${assert}
    SetSessionName    ${TEST_NAME}
    Close Browser    ALL
Local task2
    ${cdpURL}=    Create Cdp Url
    Connect To Browser    ${cdpURL}
    New Page    localhost:45454
    ${assert}=    Get Title    ==    "BrowserStack Local"
    SetStatus    ${assert}
    SetSessionName    ${TEST_NAME}
    Close Browser    ALL