*** Variables ***

####################
## Appium Configs
####################


${APPIUMSERV}           http://localhost:4723/wd/hub

&{capabilities}         platformName=Android 
...                     platformVersion=7.1 
...                     deviceName=QV700SML0K 
...                     automationName=UIAutomator2 
...                     appPackage=com.android.browser 
...                     appActivity=com.android.browser.BrowserActivity
...                     browserName=Chrome
...		                connectHardwareKeyboard=false

#...                     app=chrome
# app: 'path/to/your.apk'
#...                     appPackage=com.android.chrome
#...                     appActivity=Main

#...                     appActivity=com.android.browser.BrowserActivity
#...                     browserName=Chrome

#...                     app=com.android.browser 

#		"automationName":"UIAutomator2"
#		"platformName":"Android"
#		"platformVersion":"7.1"
#		"deviceName":"Sony XZs"
#		"appPackage":"com.android.browser"
#		"appActivity":"com.android.browser.BrowserActivity"
#		"browserName":"Chrome"
#		"connectHardwareKeyboard":"false"
