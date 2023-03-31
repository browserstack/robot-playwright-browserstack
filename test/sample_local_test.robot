*** Settings ***
Documentation       Playwright template.

Library    ./CustomLib.py
Library    String
Library     Browser    jsextension=${EXECDIR}/test/browserstackExecutor.js
Library     pabot.PabotLib
Suite Setup    Run Setup Only Once    CustomLib.startLocalTunnel
Suite Teardown    Run On Last Process    CustomLib.stopLocalTunnel

*** Test Cases ***
Sample Local Test 1
    ${cdpURL}=    createCdpUrl    chrome
    ${platfromDetails}=    getPlatformDetails
    Connect To Browser    ${cdpURL}
    New Page    http://bs-local.com:45454
    ${assert}    Run Keyword And Warn On Failure    Get Title    ==    BrowserStack Local
    SetStatus    ${assert[0]}    ${assert[1]}
    ${sessionName} =   Catenate    ${TEST_NAME}   ${platfromDetails}   
    SetSessionName    ${sessionName}
    Close Browser
Sample Local Test 2
    ${cdpURL}=    createCdpUrl    webkit
    ${platfromDetails}=    getPlatformDetails
    Connect To Browser    ${cdpURL}
    New Page    http://bs-local.com:45454
    ${assert}    Run Keyword And Warn On Failure    Get Title    ==    BrowserStack Local
    SetStatus    ${assert[0]}    ${assert[1]}
    ${sessionName} =   Catenate    ${TEST_NAME}   ${platfromDetails}   
    SetSessionName    ${sessionName}
    Close Browser