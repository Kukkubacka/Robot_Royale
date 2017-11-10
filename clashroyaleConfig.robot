*** Variables ***
# http://serhatbolsu.github.io/robotframework-appiumlibrary/AppiumLibrary.html
# Appium Configs

${APPIUMSERV}           http://localhost:4723/wd/hub

${APP_PLATFORM}         Android
${APP_PLAT_VER}         7.1
${APP_DEV_NAME}         QV700SML0K
${APP_AUT_NAME}         UIAutomator2

${NEEDLE_DIR}           ./needles
${IMAGES_DIR}           ./images
${SS_INDEX}            0001

# ${EXECDIR} not working in linux

# Clash Royale Buttons and Notices

${B_BATTLE}             B_Battle.png
${B_CANSEL}             B_Cancel.png          # Google Account Alert
${B_YES}                B_YES.png             # Google Account Alert

${N_GOOGLE}             N_GooglePlay.png
${N_GOOGLE_JK}          N_GooglePlay_JK.png



# Clash Royale Chest - Card -


# Start - lista mahdollisita ilm ym jotka tunnistettava

@{START_NEEDLES}=    ${B_BATTLE}     ${N_GOOGLE}    ${N_GOOGLE_JK}    ${B_YES}


# Video Clip Name
${VIDEO_CLIP}       Clash_Royale
