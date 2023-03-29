*** Settings ***
Documentation       Playwright template.

Library             ./CustomLib.py
Library             String
Library     Browser    jsextension=${EXECDIR}/test/browserstackExecutor.js

*** Tasks ***
Sample task 1
        ${cdpURL}=    Create Cdp Url
        ${platfromDetails}=    getPlatformDetails
        Connect To Browser    ${cdpURL}
        New Page    https://bstackdemo.com/
        Click    xpath=//*[@id="1"]/div[4]
        ${assert}    Run Keyword And Warn On Failure    Get Element Count    xpath=//*[@id="__next"]/div/div/div[2]/div[2]/div[2]    ==    1
        SetStatus    ${assert[0]}    ${assert[1]}
        ${sessionName} =   Catenate    ${TEST_NAME}   ${platfromDetails}   
        SetSessionName    ${sessionName}
        Close Browser
    
Sample task 2-FAILING
        ${cdpURL}=    Create Cdp Url
        ${platfromDetails}=    getPlatformDetails
        Connect To Browser    ${cdpURL}
        New Page    https://bstackdemo.com/
        Click    xpath=//*[@id="1"]/div[4]
        ${assert}    Run Keyword And Warn On Failure    Get Element Count    xpath=//*[@id="__next"]/div/div/div[2]/div[2]/div[2]    ==    5
        SetStatus    ${assert[0]}    ${assert[1]}
        ${sessionName} =   Catenate    ${TEST_NAME}   ${platfromDetails}   
        SetSessionName    ${sessionName}
        Close Browser

Sample task 3-PASSING
        ${cdpURL}=    Create Cdp Url
        ${platfromDetails}=    getPlatformDetails
        Connect To Browser    ${cdpURL}
        New Page    https://bstackdemo.com/
        Click    xpath=//*[@id="1"]/div[4]
        ${assert}    Run Keyword And Warn On Failure    Get Element Count    xpath=//*[@id="__next"]/div/div/div[2]/div[2]/div[2]    ==    1
        SetStatus    ${assert[0]}    ${assert[1]}
        ${sessionName} =   Catenate    ${TEST_NAME}   ${platfromDetails}   
        SetSessionName    ${sessionName}
        Close Browser    ALL        
