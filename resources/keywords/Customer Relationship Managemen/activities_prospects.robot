*** Settings ***
Library    SeleniumLibrary
Resource    ../login.robot
Resource    ../../variables/select_menu/select_menu.robot
Library           FakerLibrary    locale=th_TH
*** Keywords ***
Create Activity for Prospect
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
    Click Element    xpath=//li[@pkey='Activity']//a[contains(text(),'กิจกรรม')]
    Sleep    5s
    Click Element    xpath=//span[@id='btNewAct2']
    Wait Until Element Is Visible    id=ddActivityMainType    10s
    Sleep    5s
    Select From List By Value        id=ddActivityMainType    7
    Wait Until Element Is Visible    id=ddActivityType        10s
    Select From List By Value        id=ddActivityType        395
    Click Element    xpath=//label[normalize-space()='ต้องการ']/preceding-sibling::input[@type='checkbox']
    Click Element    id=txtNote
    Input Text       id=txtNote         รายการ
    Click Element    id=txtNoteEN
    Input Text       id=txtNoteEN       eng
    Click Element    id=txtBossComment
    Input Text       id=txtBossComment  ทดสอบ
    Sleep    5s
    Click Element    xpath=//textarea[@id='txt_50036e06-111a-4b7c-9d66-72a7ebe11245']
    Input Text       xpath=//textarea[@id='txt_50036e06-111a-4b7c-9d66-72a7ebe11245']    ยังไม่ได้โทร
    [Arguments]    ${date}=10092025
    Wait Until Element Is Visible    id=CalendarActDate    10s
    Click Element                    id=CalendarActDate
    Input Text                       id=CalendarActDate    ${date}
    Click Element    xpath=//*[@id="trControl"]//*[text()='บันทึก']
    Sleep    2s
    Click Element    xpath=//span[contains(text(),'ตกลง')]
    Wait Until Element Is Visible    xpath=//a[contains(text(),'การวางแผน')]    10s
    Click Element    xpath=//a[contains(text(),'การวางแผน')]