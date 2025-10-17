*** Settings ***
Library    SeleniumLibrary
Resource    ../../login.robot
Resource    ../../../variables/select_menu/select_menu.robot
Library           FakerLibrary    locale=th_TH_
Resource    ../../../variables/CustomerRelationshipManagemen/propects/change_status_propects_variables.robot
*** Keywords ***
change_status_propects
    ${random_company_id}=    FakerLibrary.Random Int    100000    999999
    ${random_company_name}=    FakerLibrary.Company
    ${random_phone}=    Evaluate    random.choice(['08', '09', '06', '07']) + ''.join([str(random.randint(0,9)) for _ in range(8)])    modules=random
    ${vat_number}=    FakerLibrary.Random Number    digits=13
    ${name_eng}=    FakerLibrary.First Name Female
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
    [Arguments]    ${description}=ทดสอบ robot

    Wait Until Element Is Visible    ${Status_In_Progress_2}    10s
    Click Element                    ${Status_In_Progress_2}

    Wait Until Element Is Visible    id=ddStatus    5s
    Select From List By Value        id=ddStatus    complete
    Wait Until Element Is Visible    id=txtDescription    5s
    Sleep    5s
    Click Element                    id=txtDescription
    Input Text                       id=txtDescription    ${description}

    Wait Until Element Is Visible    ${Confirm_Button}    5s
    Click Button                     ${Confirm_Button}

    Wait Until Element Is Visible    ${Fifth_Image}    5s
    Sleep    5s
    Click Element                    ${Box_Icon_Image}

    Wait Until Element Is Visible    ${Main_Menu_Label}    10s
    Click Element                    ${Main_Menu_Label}
    Sleep    2s