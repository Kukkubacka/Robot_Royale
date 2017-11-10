*** Settings ***

Library        Collections
Library        AppiumLibrary
#Library        Selenium2Library
Library        String
Library        OperatingSystem
Library        ../libs/clashroyaleUtils.py

Resource       ../resources/clashroyaleConfig.robot
Resource       ../resources/clashroyaleKeywords.robot

Suite Setup         Start Suite
#Suite Teardown      End Suite



# run tests with:
# robot -d output -L DEBUG -b debug.txt tests/clashroyale.robot
# Test Case
# robot -d output -L DEBUG -b debug.txt -t "test case name" tests/clashroyale.robot
# Tags
# robot -d output -L DEBUG -b debug.txt --include Appium tests/clashroyale.robot
# robot -d output -L DEBUG -b debug.txt --exclude Test tests/clashroyale.robot
# Variable
# robot -d output -L DEBUG -b debug.txt --variable GAME:Royale tests/clashroyale.robot

# robot -d output -L DEBUG -b debug.txt --include Royale tests/clashroyale.robot

# robot -d output -L DEBUG -b debug.txt --exclude NoRun tests/clashroyale.robot

*** Test Cases ***

Check ADB
    No Operation


Start Appium Server Linux
    No Operation
    # appium -a 127.0.0.1

Open Google Play
    [Documentation]     Open Google Play and check login
    ...                 CR should start with existing account
    [Tags]              Application     Royale
    No Operation


Open Clash Royale
    [Documentation]     Open Clash Royale and verify Start Picture
    [Tags]              Application     Royale
    Open Android Application    com.supercell.clashroyale
    ...                         com.supercell.clashroyale.GameApp
    Sleep    3 secs
    AppiumLibrary.Capture Page Screenshot   ${IMAGES_DIR}/Clash_start1.png
    Sleep    1 secs
    # Verify Start image....

    ${iname}         Take Index Screenshot       images      ${VIDEO_CLIP}
    log         ${iname}


Wait Start Selections
    [Documentation]     Wait loading and Selections, verify ready to Battle ...
    ...                 Aika vaihteee ja valinnat: Voi tulla
    ...                 Select Google Play tili
    ...                 Google Account Alert (Cancel/OK)
    ...                 Battle
    [Tags]              Application     Royale      NoRun
    ${battle}=          Set Variable    Not found

    AppiumLibrary.Capture Page Screenshot   ${IMAGES_DIR}/Clash_test_1.png
    ${cv_loc}=          image Location       ${NEEDLE_DIR}/CR_Ref_B_YES.png    ${IMAGES_DIR}/Clash_test_1.png
    Log Many            ${cv_loc}

    :FOR   ${i}    IN RANGE    5
    \       Exit For Loop If 	        '${battle}' == 'OK'
    \       AppiumLibrary.Capture Page Screenshot   ${IMAGES_DIR}/Clash_wait${i}.png
    \       log many        ${IMAGES_DIR}
    \       log many        ${START_NEEDLES}
    \       ${cv_loc}=          image Location Loop       ${NEEDLE_DIR}/${START_NEEDLES}    ${IMAGES_DIR}/Clash_wait${i}.png
    \       Log Many            ${cv_loc}
    \       ${cv_loc_tmp}=      Get From List     ${cv_loc}  0
    \       ${battle}=          Set Variable If      ${cv_loc_tmp} != -1        OK
    \       Sleep    3 secs
    Log     ${battle}
    Click Element At Coordinates     340    1192
    Take Index Screenshot       images      ${VIDEO_CLIP}

    # tan jalkeen seuraava ikkuna... vastasi cancel ....


Test Open CV
    Sleep    1 secs
    AppiumLibrary.Capture Page Screenshot   ../images/Test_OpenCV.png
    ${cv_loc}=          image Location      ./needles/N_GooglePlay.png    ./images/Test_OpenCV.png
    Log                 ${cv_loc}

    # Sceenshot EI toimi --> OpenCV ei myoskaan loyda mitaan
    # Page Screen Shot polussa ppitaa olla 2 pistetta (virhe)
    # image location kutsussa vain 1 (oikein)


Wait Start Selections New
    [Documentation]     Check if needle (List) exists in screenshot
    ...                 All possibles shouls covered....
    ...                 Check Needle List...  Returns coordinates (of Fail) and needle name
    [Tags]              Application     Royale
    AppiumLibrary.Capture Page Screenshot    .${IMAGES_DIR}/Clash_test_1.png
    ${result}=     Check Needle List       ${START_NEEDLES}        ${IMAGES_DIR}/Clash_test_1.png
    Log Many        ${result}
    ${tmp_coor}=        Set Variable      ${result[0]}
    ${tmp_name}=        Set Variable      ${result[1]}
    Log             ${tmp_coor}
    Log             ${tmp_name}
    Run Keyword if      '${tmp_name}' == 'N_GooglePlay_JK.png'     Google Account Selection       ${tmp_coor}
    ...     ELSE IF     '${tmp_name}' == 'N_GooglePlay.png'     Google Account Alert       ${tmp_coor}
    #...     ELSE IF     '${tmp_name}' == 'N_GooglePlay.png'

    # Training Battle ei pitais tulla jos tili valittu oikein.

    # ${result} = [(541, 922), u'N_GooglePlay_JK.png']

    # List - miten valitaan eka?   ${TEST2[0]}


Loop Images
    [Documentation]     Take some screen indexed screenshots,
    [Tags]              Test     NoRun

    : FOR    ${INDEX}    IN RANGE    1    10
    \    Run Keyword     Take Index Screenshot       images      Test_speed_




