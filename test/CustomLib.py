from browserstack.local import Local
import json
import urllib.parse
import subprocess
import os 

class CustomLib:
    desired_cap = None
    bs_local = None
    
    def __init__(self):
        self.desired_cap = {
            'browser_version': 'latest',
            'browserstack.username': os.environ['BROWSERSTACK_USERNAME'],
            'browserstack.accessKey': os.environ['BROWSERSTACK_ACCESS_KEY'],
            'project': 'BStack Project',
            'build': 'browserstack-build-1',
            'buildTag': 'Regression',
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
        
        self.bs_local = None
    
    def createCdpUrl(self,browser):
        clientPlaywrightVersion = str(subprocess.getoutput('playwright --version')).strip().split(" ")[1]
        self.desired_cap['client.playwrightVersion'] = clientPlaywrightVersion
        if(browser=='chrome'):
            self.desired_cap['os']='Windows'
            self.desired_cap['os_version']='11'
            self.desired_cap['browser']='chrome'
    
            
                
        elif(browser=='firefox'):
            self.desired_cap['os']='OS X'
            self.desired_cap['os_version']='Ventura'
            self.desired_cap['browser']='playwright-firefox'
            
        else:
            self.desired_cap['os']='OS X'
            self.desired_cap['os_version']='Ventura'
            self.desired_cap['browser']='playwright-webkit'
        
        cdpUrl = 'wss://cdp.browserstack.com/playwright?caps=' + urllib.parse.quote(json.dumps(self.desired_cap))
        print(cdpUrl)
        return cdpUrl
    
    def getPlatformDetails(self):
        platformDetails = self.desired_cap['os'] + " " + self.desired_cap['os_version']+ " " + self.desired_cap['browser']+ " " + self.desired_cap['browser_version']
        print(platformDetails)
        return platformDetails
    
    def startLocalTunnel(self):
        if not self.bs_local:
            self.bs_local = Local()
            bs_local_args = { "key": os.environ['BROWSERSTACK_ACCESS_KEY'], "localIdentifier": "local_connection_name"}
            self.bs_local.start(**bs_local_args)

    
    def stopLocalTunnel(self):
        if self.bs_local:
            self.bs_local.stop()
            self.bs_local = None
