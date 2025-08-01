*** Settings ***
Library           SeleniumLibrary
Resource          ../variables/login/login_variables.robot
Resource          ../variables/comon_variable.robot

*** Keywords ***
Login To Application
    [Documentation]    Logs in to the application with the provided credentials.
    Open Browser        ${WEB_URL}    chrome
    Maximize Browser Window
    Wait Until Element Is Visible   id:txtUsername   15
    Input Text          ${INPUT_LOGIN}   ${USERNAME}
    Input Text          ${INPUT_PASSWORD}   ${PASSWORD}
    Click Button        ${BUTTON_SIGNIN}
    Wait Until Element Is Not Visible    ${BUTTON_SIGNIN}    15
    Sleep                 2
