*** Settings ***
Documentation       BrowserStack SDK + robotframework-browser sample, BrowserStack Local.
...                 The SDK starts and stops the Local tunnel for you when
...                 `browserstackLocal: true` is set in browserstack.yml.

Library             Browser


*** Test Cases ***
Open Local Page
    [Documentation]    Hits a host reachable only via BrowserStack Local
    ...                (a tiny page served from your machine on port 45454).
    New Browser    chromium    headless=False
    New Context
    New Page    http://bs-local.com:45454
    Set Browser Timeout    25s
    Get Title    ==    BrowserStack Local
    Close Browser
