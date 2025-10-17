*** Settings ***
Library    SeleniumLibrary
Resource    ../../login.robot
Resource    ../../../variables/select_menu/select_menu.robot
Library           FakerLibrary    locale=th_TH
Resource    ../../../variables/CustomerRelationshipManagemen/propects/dis_qualify_prospects_variables.robot
*** Keywords ***
dis_qualify_prospects
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

    Wait Until Element Is Visible    id=btDisQualify2    15s
    Click Element                    id=btDisQualify2

    Wait Until Element Is Visible    id=ddDisqReason    15s
    Select From List By Value        id=ddDisqReason    772

    Wait Until Element Is Visible    ${OK_Button}    15s
    Click Button                     ${OK_Button}
    Sleep    2s

    Click Element                    ${Icon_UI_Button}
    Sleep    5s

    Wait Until Element Is Visible    ${Main_Menu_Label}    10s
    Sleep    5s
    Wait Until Element Is Visible    ${Main_Menu_Label}    10s
    Click Element                    ${Main_Menu_Label}
    Sleep    2s