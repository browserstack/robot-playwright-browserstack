*** Settings ***
Documentation       Playwright template.

Library             ./CustomLib.py
Library             String
Library             Browser    jsextension=${EXECDIR}/test/browserstackExecutor.js
Library             pabot.PabotLib

Suite Setup         Run Setup Only Once    startLocalTunnel
Suite Teardown      Run Teardown Only Once    stopLocalTunnel


*** Test Cases ***
Sample Test 1
    ${cdpURL}=    createCdpUrl    chrome
    ${platfromDetails}=    getPlatformDetails
    Connect To Browser    ${cdpURL}
    Set Browser Timeout    25s
    New Page    https://bstackdemo.com/
    Click    xpath=//*[@id="1"]/div[4]
    ${assert}=    Run Keyword And Warn On Failure
    ...    Get Element Count
    ...    xpath=//*[@id="__next"]/div/div/div[2]/div[2]/div[2]
    ...    ==
    ...    1
    SetStatus    ${assert[0]}    ${assert[1]}
    ${sessionName}=    Catenate    ${TEST_NAME}    ${platfromDetails}
    SetSessionName    ${sessionName}
    Close Browser

Sample Test 2
    ${cdpURL}=    createCdpUrl    firefox
    ${platfromDetails}=    getPlatformDetails
    Connect To Browser    ${cdpURL}
    Set Browser Timeout    25s
    New Page    https://bstackdemo.com/
    Click    xpath=//*[@id="1"]/div[4]
    ${assert}=    Run Keyword And Warn On Failure
    ...    Get Element Count
    ...    xpath=//*[@id="__next"]/div/div/div[2]/div[2]/div[2]
    ...    ==
    ...    1
    SetStatus    ${assert[0]}    ${assert[1]}
    ${sessionName}=    Catenate    ${TEST_NAME}    ${platfromDetails}
    SetSessionName    ${sessionName}
    Close Browser

Sample Test 3
    ${cdpURL}=    createCdpUrl    safari
    ${platfromDetails}=    getPlatformDetails
    Connect To Browser    ${cdpURL}
    Set Browser Timeout    25s
    New Page    https://bstackdemo.com/
    Click    xpath=//*[@id="1"]/div[4]
    ${assert}=    Run Keyword And Warn On Failure
    ...    Get Element Count
    ...    xpath=//*[@id="__next"]/div/div/div[2]/div[2]/div[2]
    ...    ==
    ...    1
    SetStatus    ${assert[0]}    ${assert[1]}
    ${sessionName}=    Catenate    ${TEST_NAME}    ${platfromDetails}
    SetSessionName    ${sessionName}
    Close Browser
