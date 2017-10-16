*** Settings ***
#Library         Selenium2Library
#Library         String

*** Variables ***
${BROWSER}    gc

*** Keywords ***
Appstate
    [Documentation]
    [Arguments]    ${state}
    ${state}=    Convert To Lowercase    ${state}
    Run Keyword If     '${state}' == 'wellcome'
    ...     QentinelDemoWellcome
	Run Keyword If     '${state}' == 'kirjaudu'
    ...     QentinelDemoLogin


QentinelDemoWellcome
	Go To                               ${DEMO_MAINPAGE}
	Wait Browser
	Sleep                               1
	#VerifyText                          Quality gives you an edge


QentinelDemoLogin
    Go To                               https://pace.qentinel.com/login
	Sleep                               3


Start Suite
    [Documentation]                     Starts Browser
    Open Browser                        about:blank    ${BROWSER}
    Maximize Browser Window


End Suite
    Close All Browsers
