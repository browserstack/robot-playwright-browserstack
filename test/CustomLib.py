from browserstack.local import Local
import json
import urllib.parse
import subprocess
import os 

class CustomLib:
    desired_cap = None
    bs_local = None
    
    desired_cap = {
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


    def createCdpUrl(self,browser):
        clientPlaywrightVersion = str(subprocess.getoutput('playwright --version')).strip().split(" ")[1]
        CustomLib.desired_cap['client.playwrightVersion'] = clientPlaywrightVersion
        if(browser=='chrome'):
            CustomLib.desired_cap['os']='Windows'
            CustomLib.desired_cap['os_version']='11'
            CustomLib.desired_cap['browser']='chrome'
    
            
                
        elif(browser=='firefox'):
            CustomLib.desired_cap['os']='OS X'
            CustomLib.desired_cap['os_version']='Ventura'
            CustomLib.desired_cap['browser']='playwright-firefox'
            
        else:
            CustomLib.desired_cap['os']='OS X'
            CustomLib.desired_cap['os_version']='Ventura'
            CustomLib.desired_cap['browser']='playwright-webkit'
        
        cdpUrl = 'wss://cdp.browserstack.com/playwright?caps=' + urllib.parse.quote(json.dumps(CustomLib.desired_cap))
        print(cdpUrl)
        return cdpUrl
    
    def getPlatformDetails(self):
        platformDetails = CustomLib.desired_cap['os'] + " " + CustomLib.desired_cap['os_version']+ " " + CustomLib.desired_cap['browser']+ " " + CustomLib.desired_cap['browser_version']
        print(platformDetails)
        return platformDetails
    
    def startLocalTunnel(self):
        global bs_local
        bs_local = Local()
        bs_local_args = { "key": os.environ['BROWSERSTACK_ACCESS_KEY'], "localIdentifier": "local_connection_name"}
        bs_local.start(**bs_local_args)

    
    def stopLocalTunnel(self):
        global bs_local
        if bs_local is not None:
            bs_local.stop()
    