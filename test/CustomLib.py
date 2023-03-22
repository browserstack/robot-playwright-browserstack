from robot.api import logger
from robot.libraries.BuiltIn import BuiltIn
import json
import urllib.parse
import subprocess
import os

class CustomLib:
    desired_cap = {
    'os': 'Windows',
    'os_version': '10',
    'browser': 'chrome',  # allowed browsers are `chrome`, `edge`, `playwright-chromium`, `playwright-firefox` and `playwright-webkit`
    'browser_version': 'latest', # this capability is valid only for branded `chrome` and `edge` browsers and you can specify any browser version like `latest`, `latest-beta`, `latest-1` and so on.
    'browserstack.username': os.environ['BROWSERSTACK_USERNAME'],
    'browserstack.accessKey': os.environ['BROWSERSTACK_ACCESS_KEY'],
    'browserstack.geoLocation': 'FR',
    'project': 'My First Project',
    'build': 'playwright-python-browser-library-sid',
    'buildTag': 'reg',
    'resolution': '1280x1024',
    'browserstack.local': 'true',
    'browserstack.localIdentifier': 'local_connection_name',
    'browserstack.playwrightVersion': '1.latest',
    'client.playwrightVersion': '1.latest',
        'browserstack.debug': 'true',  # enabling visual logs
        'browserstack.console': 'info',  # Enabling Console logs for the test
        'browserstack.networkLogs': 'true',  # Enabling network logs for the test
        'browserstack.networkLogsOptions':
        {
            'captureContent': 'true'
        }
    }

    def createCdpUrl(self):
        clientPlaywrightVersion = str(subprocess.getoutput('playwright --version')).strip().split(" ")[1]
        CustomLib.desired_cap['client.playwrightVersion'] = clientPlaywrightVersion
        cdpUrl = 'wss://cdp.browserstack.com/playwright?caps=' + urllib.parse.quote(json.dumps(CustomLib.desired_cap))
        print(cdpUrl)
        return cdpUrl
    