![Logo](https://www.browserstack.com/images/static/header-logo.jpg)

# BrowserStack Robot-Playwright Framework — BrowserStack SDK <a href="https://robotframework.org/"><img src="https://upload.wikimedia.org/wikipedia/commons/e/e4/Robot-framework-logo.png" alt="Robot" height="30" /></a> <a href="https://www.python.org//"><img src="https://www.python.org/static/img/python-logo@2x.png" alt="python" height="22" /></a>

## Introduction

This branch shows how to run [Robot Framework](https://robotframework.org/) tests using the [Browser](https://robotframework-browser.org/) Playwright library on BrowserStack via the [BrowserStack Python SDK](https://pypi.org/project/browserstack-sdk/). The SDK reads `browserstack.yml`, supplies platform capabilities, runs the matrix in parallel, manages BrowserStack Local, and reports test status to the Automate dashboard for you. Your `.robot` files use vanilla `Browser` library keywords — no CDP URL construction, no manual cap merging, no manual Local start/stop.

For the legacy non-SDK example with hand-built CDP URLs, see the [`main`](https://github.com/browserstack/robot-playwright-browserstack/tree/main) branch.

The test scripts target the open-source [BrowserStack Demo web application](https://bstackdemo.com) ([Github](https://github.com/browserstack/browserstack-demo-app)).

---

# BrowserStack

[BrowserStack](https://browserstack.com) provides instant access to 3,000+ real mobile devices and browsers on a highly reliable cloud infrastructure that effortlessly scales as testing needs grow.

## Repository setup

- Clone the repository and check out this branch
    ```sh
    git clone https://github.com/browserstack/robot-playwright-browserstack.git
    cd robot-playwright-browserstack
    git checkout browserstack-sdk-playwright
    ```

- It is recommended to use a virtual environment to install dependencies. To create a virtual environment:
   ```sh
   python3 -m venv env
   source env/bin/activate # on Mac
   env\Scripts\activate # on Windows
   ```
- Library installation requires both Python and NodeJs:

  Install [Python™](https://www.python.org/downloads/)

  Install [Node.js®](https://nodejs.org/en/download/) — **Node 18+ required, Node 20 recommended.** The Robot `Browser` library bundles its own Playwright Node wrapper which silently fails to start on older Node versions.
- Install the dependencies listed in `requirements.txt` (this branch adds `browserstack-sdk` and drops `browserstack-local` — the SDK manages the tunnel for you):

    ```sh
    pip install -r requirements.txt
    ```
- `rfbrowser init` installs the NodeJS dependencies and browser binaries used by the Robot `Browser` library:

  ```sh
  rfbrowser init
  ```

## About the tests in this repository

- `test/sdk_sample_test.robot` — navigates to bstackdemo, adds an item to the cart, and verifies the cart drawer shows one item.
- `test/sdk_sample_local_test.robot` — opens a page served on `bs-local.com:45454` via BrowserStack Local and asserts the title.

## Running Your Tests on BrowserStack

## Prerequisites

- Create a new [BrowserStack account](https://www.browserstack.com/users/sign_up) or use an existing one.
- Identify your BrowserStack username and access key from the [BrowserStack Automate Dashboard](https://automate.browserstack.com/) and either set them in `browserstack.yml` (and the variants under `config/`) or export them as environment variables (env vars take precedence):

    - For unix-based and Mac machines:

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

  The default `browserstack.yml` declares three platforms (Windows 11 Chrome, OS X Sonoma Firefox, OS X Sonoma Safari). The SDK runs them in parallel for you when you invoke `pabot` through the SDK wrapper:

  ```sh
  browserstack-sdk pabot --testlevelsplit --processes 3 ./test/sdk_sample_test.robot
  ```

  Add or remove entries under `platforms:` in `browserstack.yml` to change the matrix; bump `parallelsPerPlatform` to fan out further.

- Output

  Three sessions appear on your [BrowserStack Automate dashboard](https://automate.browserstack.com/) under the build named in `browserstack.yml`.

---

### Run tests on BrowserStack which need Local Environment access

- How to run the test?

  The local-mode example uses a single-platform config with `browserstackLocal: true`. The SDK starts and stops the BrowserStack Local tunnel for you — no Python `browserstack-local` package, no `Run Setup Only Once` boilerplate.

  Copy the local config in place and run:

  ```sh
  cp config/browserstack.local.yml browserstack.yml
  browserstack-sdk robot ./test/sdk_sample_local_test.robot
  ```

  When you're done, restore the parallel default by checking out `browserstack.yml` from git or re-copying nothing — `git restore browserstack.yml` is the simplest reset.

  To exercise the local flow against a real local server, run a tiny static server in another terminal first:

  ```sh
  python3 -m http.server 45454
  ```

  with an `index.html` whose `<title>` is `BrowserStack Local`.

## How the SDK changes things from `main`

- One `browserstack.yml` declares platforms; the SDK picks them up automatically — no `CustomLib.createCdpUrl()` per-browser branching.
- The SDK constructs the Playwright CDP URL and routes the `Browser` library's connection to BrowserStack — no `Connect To Browser    ${cdpURL}` calls in the `.robot` files.
- The SDK runs platforms in parallel for you — no per-test variants like `Sample Test 1/2/3`.
- The SDK starts and stops BrowserStack Local when `browserstackLocal: true` — no `BrowserStack::Local` start/stop in `CustomLib.py`.
- The SDK reports test status and session names to BrowserStack — no `browserstackExecutor.js` `setSessionStatus` / `setSessionName` boilerplate.
- The CLI is `browserstack-sdk pabot ...` or `browserstack-sdk robot ...` instead of `pabot ...` / `robot ...` directly.

## Additional Resources

- View your test results on the [BrowserStack Automate dashboard](https://www.browserstack.com/automate)
- [BrowserStack Python SDK](https://pypi.org/project/browserstack-sdk/) on PyPI
- Customizing your platform capabilities using our [Capability documentation](https://www.browserstack.com/docs/automate/playwright/playwright-capabilities)
- [List of Browsers & mobile devices](https://www.browserstack.com/docs/automate/playwright/browsers-and-os) for automation testing on BrowserStack
- [Using Automate REST API](https://www.browserstack.com/automate/rest-api) to access information about your tests via the command-line interface
- Understand how many parallel sessions you need by using our [Parallel Test Calculator](https://www.browserstack.com/automate/parallel-calculator?ref=github)
- For testing public web applications behind IP restriction, [Inbound IP Whitelisting](https://www.browserstack.com/local-testing/inbound-ip-whitelisting) can be enabled with the [BrowserStack Enterprise](https://www.browserstack.com/enterprise) offering
