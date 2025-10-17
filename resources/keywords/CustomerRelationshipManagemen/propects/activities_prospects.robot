*** Settings ***
Library    SeleniumLibrary
Resource    ../../login.robot
Resource    ../../../variables/select_menu/select_menu.robot
Library           FakerLibrary    locale=th_TH
Resource    ../../../variables/CustomerRelationshipManagemen/propects/activities_prospects_variables.robot
*** Keywords ***
Create Activity for Prospect
    ${random_company_id}=    FakerLibrary.Random Int    100000    999999
    ${random_company_name}=    FakerLibrary.Company
    ${random_phone}=    Evaluate    random.choice(['08', '09', '06', '07']) + ''.join([str(random.randint(0,9)) for _ in range(8)])    modules=random
    ${vat_number}=    FakerLibrary.Random Number    digits=13
    ${name_eng}=    FakerLibrary.First Name Female
    Sleep    2s

    Click Element    ${Customer_Relationship_Management}
    Wait Until Element Is Visible    ${Prospect_Group_Tab}    10s
    Click Element    ${Prospect_Group_Tab}

    ${FIRST_LEAD_LINK}    Set Variable    xpath=(//tr[.//input[starts-with(@id,"cbc_")]]//a[starts-with(@href,"leadinfo.aspx")])[1]
    Wait Until Element Is Visible    ${FIRST_LEAD_LINK}    10s
    Scroll Element Into View         ${FIRST_LEAD_LINK}
    Click Element                    ${FIRST_LEAD_LINK}
    Sleep    5s

    Click Element    ${Activity_Tab}
    Sleep    5s
    Click Element    ${New_Activity_Button}

    Wait Until Element Is Visible    id=ddActivityMainType    10s
    Sleep    5s
    Select From List By Value        id=ddActivityMainType    7
    Wait Until Element Is Visible    id=ddActivityType        10s
    Select From List By Value        id=ddActivityType        395

    Click Element    ${Need_Checkbox}

    Click Element    id=txtNote
    Input Text       id=txtNote         รายการ
    Click Element    id=txtNoteEN
    Input Text       id=txtNoteEN       eng
    Click Element    id=txtBossComment
    Input Text       id=txtBossComment  ทดสอบ
    Sleep    5s

    ${status}    ${msg}=    Run Keyword And Ignore Error    Wait Until Element Is Visible    ${CallNote_Textarea}    5s
    Run Keyword If    '${status}'=='PASS'    Click Element    ${CallNote_Textarea}
    Run Keyword If    '${status}'=='PASS'    Input Text       ${CallNote_Textarea}    ยังไม่ได้โทร

    [Arguments]    ${date}=10092025
    Wait Until Element Is Visible    id=CalendarActDate    10s
    Click Element                    id=CalendarActDate
    Input Text                       id=CalendarActDate    ${date}

    Click Element    ${Save_Button_trControl}
    Sleep    2s
    Click Element    ${Confirm_Span}

    Wait Until Element Is Visible    ${Planning_Link}    10s
    Click Element    ${Planning_Link}

    Wait Until Element Is Visible    ${Main_Menu_Label}    10s
    Click Element    ${Main_Menu_Label}
    Sleep    2s