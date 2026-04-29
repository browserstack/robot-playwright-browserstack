*** Settings ***
Documentation       BrowserStack SDK + robotframework-browser sample.
...                 The SDK reads platforms from browserstack.yml and runs each test
...                 against every platform. No CDP URL or capabilities are constructed
...                 here — the SDK injects them at runtime.

Library             Browser


*** Test Cases ***
Add Product To Cart
    [Documentation]    Adds the first product on bstackdemo to the cart and
    ...                asserts the cart drawer shows one item.
    New Browser    chromium    headless=False
    New Context
    New Page    https://bstackdemo.com/
    Set Browser Timeout    25s
    Click    xpath=//*[@id="1"]/div[4]
    Get Element Count    xpath=//*[@id="__next"]/div/div/div[2]/div[2]/div[2]    ==    1
    Close Browser
