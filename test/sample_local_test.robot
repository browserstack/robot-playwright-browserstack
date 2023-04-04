*** Settings ***
Documentation       Playwright template.

Library             ./CustomLib.py
Library             String
Library             Browser    jsextension=${EXECDIR}/test/browserstackExecutor.js
Library             pabot.PabotLib

Suite Setup         Run Setup Only Once    CustomLib.startLocalTunnel
Suite Teardown      Run Teardown Only Once    CustomLib.stopLocalTunnel


*** Test Cases ***
Sample Local Test 1
    ${cdpURL}=    createCdpUrl    chrome
    ${platfromDetails}=    getPlatformDetails
    Connect To Browser    ${cdpURL}
    Set Browser Timeout    25s
    New Page    http://bs-local.com:45454
    ${assert}=    Run Keyword And Warn On Failure    Get Title    ==    BrowserStack Local
    SetStatus    ${assert[0]}    ${assert[1]}
    ${sessionName}=    Catenate    ${TEST_NAME}    ${platfromDetails}
    SetSessionName    ${sessionName}
    Close Browser

Sample Local Test 2
    ${cdpURL}=    createCdpUrl    firefox
    ${platfromDetails}=    getPlatformDetails
    Connect To Browser    ${cdpURL}
    Set Browser Timeout    25s
    New Page    http://bs-local.com:45454
    ${assert}=    Run Keyword And Warn On Failure    Get Title    ==    BrowserStack Local
    SetStatus    ${assert[0]}    ${assert[1]}
    ${sessionName}=    Catenate    ${TEST_NAME}    ${platfromDetails}
    SetSessionName    ${sessionName}
    Close Browser

Sample Local Test 3
    ${cdpURL}=    createCdpUrl    safari
    ${platfromDetails}=    getPlatformDetails
    Connect To Browser    ${cdpURL}
    Set Browser Timeout    25s
    New Page    http://bs-local.com:45454
    ${assert}=    Run Keyword And Warn On Failure    Get Title    ==    BrowserStack Local
    SetStatus    ${assert[0]}    ${assert[1]}
    ${sessionName}=    Catenate    ${TEST_NAME}    ${platfromDetails}
    SetSessionName    ${sessionName}
    Close Browser
