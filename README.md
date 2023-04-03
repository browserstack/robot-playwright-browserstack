![Logo](https://www.browserstack.com/images/static/header-logo.jpg)

# BrowserStack Robot-Playwright Framework <a href="https://robotframework.org/"><img src="https://upload.wikimedia.org/wikipedia/commons/e/e4/Robot-framework-logo.png" alt="Robot" height="30" /></a> <a href="https://www.python.org//"><img src="https://www.python.org/static/img/python-logo@2x.png" alt="python" height="22" /></a>

## Introduction

Robot Framework is a generic open source automation framework which can be used for test automation. It is open and extensible and can be integrated with many tools to create powerful and flexible automation solutions.
Robot Framework has easy syntax, utilising human-readable keywords and its capabilities can be extended by libraries implemented with Python or Java.

This BrowserStack Example repository demonstrates a Playwright test library, called [Browser](https://robotframework-browser.org/) written in [Robot Framework](https://robotframework.org/) with parallel testing capabilities. The test scripts are written for the open source [BrowserStack Demo web application](https://bstackdemo.com) ([Github](https://github.com/browserstack/browserstack-demo-app)). This BrowserStack Demo App is an e-commerce web application which showcases multiple real-world user scenarios. The app is bundled with offers data, orders data and products data that contains everything you need to start using the app and run tests out-of-the-box.

The tests in this repo are run on BrowserStack real device/browser using various run configurations and test capabilities.

---

# BrowserStack

[BrowserStack](https://browserstack.com) provides instant access to 3,000+ real mobile devices and browsers on a highly reliable cloud infrastructure that effortlessly scales as testing needs grow.

## Repository setup

- Clone the repository
    ```sh
    git clone https://github.com/browserstack/robot-playwright-browserstack.git
    ```
    
- It is recommended to use a virtual environment to install dependencies. To create a virtual environment:
   ```sh
   python3 -m venv env
   source env/bin/activate # on Mac
   env\Scripts\activate # on Windows
   ```
- Library installation requires both Python and NodeJs:

  Install [Python™](https://www.python.org/downloads/)

  Install [Node.js®](https://nodejs.org/en/download/)
- Ensure you have the dependencies installed on the machine as mentioned in the `requirements.txt file`
    
    To Install the requirements:
    ```sh
    pip install -r requirements.txt
    ```
- rfbowser init:

  ```sh
  rfbrowser init
  ```
  This installs the NodeJS [dependencies](https://github.com/MarketSquare/robotframework-browser/blob/main/package.json)
  , installation is done by default to `site-packages/Browser/wrapper/node_modules/` directory.
  This also install browser binaries under the `node_modules` folder, which easily can be
  +700Mb for each Browser library installation.


## About the tests in this repository

  Navigate to bstackdemo, Add an item to the card and Verify the item is added to the cart.

## Running Your Tests on Browserstack

## Prerequisites to run your tests on Browserstack

- Create a new [BrowserStack account](https://www.browserstack.com/users/sign_up) or use an existing one.
- Identify your BrowserStack username and access key from the [BrowserStack Automate Dashboard](https://automate.browserstack.com/) and export them as environment variables using the below commands.

    - For unix based and Mac machines:

  ```sh
  export BROWSERSTACK_USERNAME=<browserstack-username> &&
  export BROWSERSTACK_ACCESS_KEY=<browserstack-access-key>
  ```

    - For Windows:

  ```shell
  set BROWSERSTACK_USERNAME=<browserstack-username>
  set BROWSERSTACK_ACCESS_KEY=<browserstack-access-key>
  ```
  

### Run the entire test suite in parallel

- How to run the test?

  To run the entire test suite parallely in browserstack, you will require [pabot dependency](https://pabot.org/).

  Use the following command:
  
  ```sh
  pabot --pabotlib --testlevelsplit --processes 3 ./test/sample_test.robot
  ```
  You can also use the other combinations as described in [pabot](https://pabot.org/) to run your tests parallely. 

- Output

  This run profile executes the entire test suite parallely in browserstack 

  
--- 

### Run tests in Parallel on BrowserStack which need Local Environment access

- How to run the test?

  To run the entire test suite parallely in browserstack, you will require [pabot dependency](https://pabot.org/) and [pabotlib dependecy](https://pabot.org/PabotLib.html), PabotLib helps in parallel execution with pabot. These allow control to when and where a keyword will be executed.
  -  Run Setup Only Once is used for starting the local testing connection
  -  Run Teardown Only Once is used for killing the local testing connection

  **Using Language Bindings**

  Follow the steps below:
  ```
  pip install browserstack-local
  ```
  ```sh
  pabot --pabotlib --testlevelsplit --processes 2 ./test/sample_local_test.robot   
  ```


## Additional Resources

- View your test results on the [BrowserStack Automate dashboard](https://www.browserstack.com/automate)
- Customizing your platform capabilities on BrowserStack using our [Capability documentation](https://www.browserstack.com/docs/automate/playwright/playwright-capabilities)
- [List of Browsers & mobile devices](https://www.browserstack.com/docs/automate/playwright/browsers-and-os) for automation testing on BrowserStack
- [Using Automate REST API](https://www.browserstack.com/automate/rest-api) to access information about your tests via the command-line interface
- Understand how many parallel sessions you need by using our [Parallel Test Calculator](https://www.browserstack.com/automate/parallel-calculator?ref=github)
- For testing public web applications behind IP restriction, [Inbound IP Whitelisting](https://www.browserstack.com/local-testing/inbound-ip-whitelisting) can be enabled with the [BrowserStack Enterprise](https://www.browserstack.com/enterprise) offering
