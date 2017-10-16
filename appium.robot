*** Settings ***

Library         Collections
Library         AppiumLibrary
#Library        Selenium2Library

Library        String
Resource       ${EXECDIR}/resources/ElementLocators.robot
Resource       ${EXECDIR}/resources/AppiumConfig.robot
Resource       ${EXECDIR}/resources/AppiumKeywords.robot

#Suite Setup    Start Suite
#Suite Teardown End Suite



# run tests with:
# robot -d output -L DEBUG -b debug.txt tests/appium.robot
# Test Case
# robot -d output -L DEBUG -b debug.txt -t "test case name" tests/appium.robot
# Tags
# robot -d output -L DEBUG -b debug.txt --include Appium tests/appium.robot
# robot -d output -L DEBUG -b debug.txt --exclude Test tests/appium.robot
# Variable
# robot -d output -L DEBUG -b debug.txt --variable GAME:Royale tests/appium.robot

# robot -d output -L DEBUG -b debug.txt --include Royale tests/appium.robot

*** Test Cases ***

# robot -d output -L DEBUG -b debug.txt --include App3 tests/appium.robot

Appium Open Browser
    [Documentation]     Based on Jarkko's Example
    [Tags]              AppWeb
    ${index}=     AppiumLibrary.Open Application    ${APPIUMSERV}    &{capabilities}

    AppiumLibrary.Go To Url   http://www.google.com
    Sleep    2 secs
    AppiumLibrary.Input Text     id=lst-ib    Offroad
    AppiumLibrary.Click Element  id=tsbb
    Sleep    1 secs
    AppiumLibrary.Capture Page Screenshot    # output kansioon...
    Sleep    5 secs
    AppiumLibrary.Close Application

    # lst-ib
    # //*[@id="tsf"]/div[2]/div[1]/button/div/span/svg


Appium Open Appl-1
    [Documentation]     Try to open some application
    [Tags]              Application
    # modify capabilities
    &{app_cap}=    Create Dictionary
    Set To Dictionary       ${app_cap}      platformName        Android
    Set To Dictionary       ${app_cap}      platformVersion     7.1
    Set To Dictionary       ${app_cap}      deviceName          QV700SML0K
    Set To Dictionary       ${app_cap}      automationName      UIAutomator2
    Set To Dictionary       ${app_cap}      appPackage
    ...                     com.klabjan.movethematchespuzzles
    Set To Dictionary       ${app_cap}      appActivity
    ...                     com.klabjan.movethematchespuzzles.GameMatchesActivity
    Log Many         &{app_cap}
    ${index}=     AppiumLibrary.Open Application    ${APPIUMSERV}    &{app_cap}
    Sleep    3 secs
    AppiumLibrary.Capture Page Screenshot   ${EXECDIR}/images/App_1.png
    Sleep    10 secs
    AppiumLibrary.Close Application

# adb shell loitsu
# com.klabjan.movethematchespuzzles/.GameMatchesActivity

Open Clash Royale
    [Documentation]     Open Clash Royale
    [Tags]              Application     Royale
    # modify capabilities
    &{app_cap}=    Create Dictionary
    Set To Dictionary       ${app_cap}      platformName        Android
    Set To Dictionary       ${app_cap}      platformVersion     7.1
    Set To Dictionary       ${app_cap}      deviceName          QV700SML0K
    Set To Dictionary       ${app_cap}      automationName      UIAutomator2
    Set To Dictionary       ${app_cap}      appPackage
    ...                     com.supercell.clashroyale
    Set To Dictionary       ${app_cap}      appActivity
    ...                     com.supercell.clashroyale.GameApp
    Log Many         &{app_cap}
    ${index}=     AppiumLibrary.Open Application    ${APPIUMSERV}    &{app_cap}
    Sleep    3 secs
    AppiumLibrary.Capture Page Screenshot   ${EXECDIR}/images/App_1.png
    Sleep    10 secs
    AppiumLibrary.Close Application




