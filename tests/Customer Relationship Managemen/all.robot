*** Settings ***
Resource    ../../../resources/keywords/login.robot
Resource    ../../resources/keywords/Customer Relationship Managemen/Prospect_group.robot
Resource    ../../resources/keywords/Customer Relationship Managemen/activities_prospects.robot
Resource    ../../resources/keywords/Customer Relationship Managemen/change_status_propects.robot
Resource    ../../resources/keywords/Customer Relationship Managemen/qualify_prospects.robot

Test Setup   Login To Application 


*** Test Cases ***
company Test
    create Prospect Group
    Wait Until Element Is Visible    xpath=(//*[normalize-space(text())='เมนูหลัก'])[1]    10s
    Click Element    xpath=(//*[normalize-space(text())='เมนูหลัก'])[1]
    Sleep    2s
    Create Activity for Prospect
    Wait Until Element Is Visible    xpath=(//*[normalize-space(text())='เมนูหลัก'])[1]    10s
    Click Element    xpath=(//*[normalize-space(text())='เมนูหลัก'])[1]
    Sleep    2s
    change_status_propects 
    Wait Until Element Is Visible    xpath=(//*[normalize-space(text())='เมนูหลัก'])[1]    10s
    Click Element    xpath=(//*[normalize-space(text())='เมนูหลัก'])[1]
    Sleep    2s
    qualify_prospects