*** Settings ***
Library    SeleniumLibrary
Resource    ../../login.robot
Resource    ../../../variables/select_menu/select_menu.robot
Library           FakerLibrary    locale=th_TH
*** Keywords ***
dis_qualify_prospects
    ${random_company_id}=    FakerLibrary.Random Int    100000    999999
    ${random_company_name}=    FakerLibrary.Company
    ${random_phone}=    Evaluate    random.choice(['08', '09', '06', '07']) + ''.join([str(random.randint(0,9)) for _ in range(8)])    modules=random
    ${vat_number}=    FakerLibrary.Random Number    digits=13
    ${name_eng}=    FakerLibrary.First Name Female 
    Click Element    ${Customer_Relationship_Management}
    Wait Until Element Is Visible    xpath=//*[text()='กลุ่มผู้มุ่งหวัง']    10s
    Click Element    xpath=//*[text()='กลุ่มผู้มุ่งหวัง']
    ${FIRST_LEAD_LINK}    Set Variable    xpath=(//tr[.//input[starts-with(@id,"cbc_")]]//a[starts-with(@href,"leadinfo.aspx")])[1]
    Wait Until Element Is Visible    ${FIRST_LEAD_LINK}    10s
    Scroll Element Into View         ${FIRST_LEAD_LINK}
    Click Element                    ${FIRST_LEAD_LINK}
    Sleep    5s
    Wait Until Element Is Visible    id=btDisQualify2    15s
    Click Element                    id=btDisQualify2

    Wait Until Element Is Visible    id=ddDisqReason    15s
    Select From List By Value        id=ddDisqReason    772

    Wait Until Element Is Visible    xpath=//button[normalize-space()='OK']    15s
    Click Button                     xpath=//button[normalize-space()='OK']

    Wait Until Element Is Visible    xpath=//*[normalize-space()='ตกลง']    15s
    Click Element                    xpath=//*[normalize-space()='ตกลง']
    Sleep    5s