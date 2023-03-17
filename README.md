# robot-playwright-browserstack
Creating a sample repo for different Playwright languages and runners

## Guideline

* Follow the default robot directory structure

* Keep the tests inside the tests folder

* Keep all BrowserStack-related configs in a separate file

* Run tests in parallel & local

## References:

* GitHub - browserstack/robot-browserstack at sdk 

* GitHub - robocorp/template-robot-framework-playwright 
List of capabilities that need to be added

```
  os: 'osx',
  os_version: 'catalina',
  browser: 'chrome',
  browser_version: 'latest',
  'browserstack.username': process.env.BROWSERSTACK_USERNAME || 'sdsds',
  'browserstack.accessKey': process.env.BROWSERSTACK_ACCESS_KEY || 'sdsdsds',
  project: 'BStack Project',
  build: 'browserstack-build-1',
  name: 'should be dynamic',
  buildTag: 'Regression',
  'browserstack.local': 'true',
  'browserstack.localIdentifier': 'local_connection_name',
  //resolution: '1280x1024',
  //'browserstack.geoLocation': 'FR',
  //'browserstack.playwrightVersion': '1.latest',
  //'client.playwrightVersion': '1.latest',
  'browserstack.debug': 'true',  // enabling visual logs
  'browserstack.console': 'info'  // Enabling Console logs for the test
  'browserstack.networkLogs': 'true'  // Enabling network logs for the test
  'browserstack.networkLogsOptions':
      {
        'captureContent': 'true'
      }
}
```