*** Settings ***

*** Variables ***

${BROWSER}    gc

*** Keywords ***

Open Android Application
    [Arguments]             ${APP_PACK}   ${APP_ACT}
    [Documentation]         Start application on Android device.
    ...                     Device configuration in config file.
    &{app_cap}=    Create Dictionary
    Set To Dictionary       ${app_cap}      platformName        ${APP_PLATFORM}
    Set To Dictionary       ${app_cap}      platformVersion     ${APP_PLAT_VER}
    Set To Dictionary       ${app_cap}      deviceName          ${APP_DEV_NAME}
    Set To Dictionary       ${app_cap}      automationName      ${APP_AUT_NAME}
    Set To Dictionary       ${app_cap}      appPackage          ${APP_PACK}
    Set To Dictionary       ${app_cap}      appActivity         ${APP_ACT}
    Log Many                &{app_cap}
    ${index}=     AppiumLibrary.Open Application    ${APPIUMSERV}    &{app_cap}





Read Index From File
    [Documentation]         Read Screenshot index from config file.
    ${contents}=            Get File            ./tests/config.txt
    @{lines}=               Split to lines      ${contents}
    :FOR    ${line}      IN         @{lines}
    \    Exit For Loop If 	        '${line}' == ''
    \    @{tmp}=             Split String    ${line}       :
    \    ${SS_INDEX}=        Set Variable       @{tmp}[1]



Take Index Screenshot
    [Arguments]             ${DIRE}   ${NAME}
    [Documentation]         Take screenshot and add index.
    ${tmp}=                 Evaluate     ${SS_INDEX} + 1
    #${SS_INDEX}=            Set Suite Variable          ${tmp}
    Set Suite Variable      ${SS_INDEX}     ${tmp}
    ${index_string}=        build index string          ${SS_INDEX}
    Log     ${index_string}
    ${NAME}=                Catenate    SEPARATOR= 	    ${NAME}    _     ${index_string}    .png
    AppiumLibrary.Capture Page Screenshot   ../${DIRE}/${NAME}
    Return From Keyword     ${NAME}


Check Needle List
    [Arguments]             ${ref_needles}   ${picture}
    [Documentation]         Walk thrue needle list and return coordinate if match.
    ...                     py mokkula ei toimi, lista unicode
    ${exit}=            Set Variable       NO
    :FOR    ${tmp-needle}      IN         @{ref_needles}
    \    Exit For Loop If 	        '${exit}' == 'YES'
    \    ${cv_loc}=          image Location      ${NEEDLE_DIR}/${tmp-needle}    ${picture}
    \    Log                 ${NEEDLE_DIR}
    \    Log                 ${tmp-needle}
    \    Log                 ${picture}
    \    Log Many            ${cv_loc}
    \    ${cv_loc_tmp}=      Get From List     ${cv_loc}  0
    \    ${coordinates}=     Set Variable If      ${cv_loc_tmp} != -1      ${cv_loc}
    \    ${exit}=            Set Variable If      ${cv_loc_tmp} != -1      YES
    Log     ${coordinates}
    Return From Keyword     ${coordinates}      ${tmp-needle}




Google Account Selection
    [Arguments]             ${xy_coordinates}
    [Documentation]         Select Google Account. Vain yksi vaihtoehto.
    Log         ${xy_coordinates}
    Click Element At Coordinates     340    1192
    Sleep    2 secs
    #AppiumLibrary.Capture Page Screenshot    .${IMAGES_DIR}/Google_PIN_2.png
    #Click Text      4

    Click Element At Coordinates     179    1361
    Click Element At Coordinates     898    1686

    #${cv_loc4}=          image Location      ./needles/B_4.png    ./images/Google_PIN_2.png
    #Log                 ${cv_loc4}
    #${cv_loc0}=          image Location      ./needles/B_0.png    ./images/Google_PIN_2.png
    #Log                 ${cv_loc0}
    #${cv_loc3}=          image Location      ./needles/B_3.png    ./images/Google_PIN_2.png
    #Log                 ${cv_loc3}
    #${cv_loc8}=          image Location      ./needles/B_8.png    ./images/Google_PIN_2.png
    #Log                 ${cv_loc8}

    #${cv_locR}=          image Location      ./needles/B_R.png    ./images/Google_PIN_2.png
    #Log                 ${cv_locR}

    Sleep    2 secs
    AppiumLibrary.Capture Page Screenshot    .${IMAGES_DIR}/Google_PIN_3.png

Google Account Alert
    [Arguments]             ${xy_coordinates}
    [Documentation]         Google Accout Alert, Cancel / Yes
    ...                     kumpaa pitaa painaa




Get Device Name
    [Documentation]         Get Android device name with ADB command.
    ...                     varmaan tarvii sys....
    No Operation


Start Game
    [Documentation]         Starting the game, select the options to start
    ...                     mita tulee vastaan ....
    No Operation

Start Suite
    [Documentation]         Suite setup tasks
    Read Index From File

    # Set default sceenshot dire .... ei kai tarvii kun Lib:Screenshot ei kaut.
    # Read image index

End Suite
    AppiumLibrary.Close Application
    # Write image index
