*** Settings ***
Documentation       Playwright template.

Library             ./CustomLib.py
Library             String
Library     Browser    jsextension=${EXECDIR}/test/browserstackExecutor.js
Suite Setup    CustomLib.startLocalTunnel
Suite Teardown    CustomLib.stopLocalTunnel

*** Tasks ***
Sample Local task 1
    ${cdpURL}=    Create Cdp Url
    ${platfromDetails}=    getPlatformDetails
    Connect To Browser    ${cdpURL}
    New Page    http://localhost:45454/
    ${assert}=    Get Title    ==    "BrowserStack Local"
    SetStatus    ${assert[0]}    ${assert[1]}
    ${sessionName} =   Catenate    ${TEST_NAME}   ${platfromDetails}   
    SetSessionName    ${sessionName}
    Close Browser
Sample Local task 2
    ${cdpURL}=    Create Cdp Url
    ${platfromDetails}=    getPlatformDetails
    Connect To Browser    ${cdpURL}
    New Page    http://localhost:45454/
    ${assert}=    Get Title    ==    "BrowserStack Local"
    SetStatus    ${assert[0]}    ${assert[1]}
    ${sessionName} =   Catenate    ${TEST_NAME}   ${platfromDetails}   
    SetSessionName    ${sessionName}
    Close Browser