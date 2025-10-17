*** Settings ***
Library           SeleniumLibrary
Resource    ../../login.robot
Resource    ../../../variables/select_menu/select_menu.robot
Library           FakerLibrary    locale=th_TH
Resource    ../../../variables/CustomerRelationshipManagemen/propects/Prospect_group_variables.robot

*** Keywords ***
create Prospect Group
    ${random_company_id}=    FakerLibrary.Random Int    100000    999999
    ${random_company_name}=    FakerLibrary.Company
    ${random_phone}=    Evaluate    random.choice(['08', '09', '06', '07']) + ''.join([str(random.randint(0,9)) for _ in range(8)])    modules=random
    ${vat_number}=    FakerLibrary.Random Number    digits=13
    ${name_eng}=    FakerLibrary.First Name Female
    Click Element    ${Customer_Relationship_Management}
    Sleep    5s

    Click Element    ${Prospect_Group_Menu_Link}
    Sleep    4s
    Click Element    ${New_Prospect_Button}

    # คำนำหน้า (TH) - Chosen
    Wait Until Element Is Visible    css=#ddNamePrefix_chosen a    15s
    Wait Until Element Is Enabled    css=#ddNamePrefix_chosen a    15s
    Sleep    2s
    Click Element                    css=#ddNamePrefix_chosen a
    Wait Until Element Is Visible    ${NamePrefix_TH_Mr}    15s
    Click Element                    ${NamePrefix_TH_Mr}

    # ประเภทผู้ติดต่อ
    Wait Until Element Is Visible    id=ddContactType    15s
    Wait Until Element Is Enabled    id=ddContactType    15s
    Select From List By Value        id=ddContactType    374

    # คำนำหน้า (EN) - Chosen
    Wait Until Element Is Visible    css=#ddNamePrefixEN_chosen a    15s
    Wait Until Element Is Enabled    css=#ddNamePrefixEN_chosen a    15s
    Click Element                    css=#ddNamePrefixEN_chosen a
    Wait Until Element Is Visible    ${NamePrefix_EN_Mr}    15s
    Click Element                    ${NamePrefix_EN_Mr}

    # แหล่งที่มา / สถานะ / โครงการ / ช่องทาง Lead / วัตถุประสงค์การซื้อ
    Wait Until Element Is Visible    id=ddDatasource    15s
    Select From List By Value        id=ddDatasource    51
    Wait Until Element Is Visible    id=ddContactStatus    15s
    Select From List By Value        id=ddContactStatus    55
    Wait Until Element Is Visible    id=ddProject    15s
    Select From List By Value        id=ddProject    TR0001
    Wait Until Element Is Visible    id=ddLeadChannel    15s
    Select From List By Value        id=ddLeadChannel    423
    Wait Until Element Is Visible    id=ddPurchaseObjectives    15s
    Select From List By Value        id=ddPurchaseObjectives    489

    # ชื่อ (TH)
    Wait Until Element Is Visible    ${FirstName_TH_Input}    15s
    Input Text                       ${FirstName_TH_Input}    ${name_eng}

    # นามสกุล (TH)
    Click Element                    ${LastName_TH_Input_X}
    Input Text                       ${LastName_TH_Input_X}   ${name_eng}

    # นามสกุล (EN)
    Wait Until Element Is Visible    id=txtLastName    15s
    Input Text                       id=txtLastName    ${name_eng}s

    # ชื่อ (EN)
    Wait Until Element Is Visible    ${FirstName_EN_Input}    15s
    Input Text                       ${FirstName_EN_Input}    ${name_eng}q

    # เบอร์มือถือหลัก/รอง
    Wait Until Element Is Visible    ${Mobile_Primary_Input}    15s
    Input Text                       ${Mobile_Primary_Input}    ${random_phone}
    Wait Until Element Is Visible    ${Mobile_Secondary_Input}  15s
    Input Text                       ${Mobile_Secondary_Input}  ${random_phone}6

    # ที่อยู่
    Wait Until Element Is Visible    id=txtAddressNo    15s
    Input Text                       id=txtAddressNo       1/4504
    Press Keys                       id=txtAddressNo       \\09

    Wait Until Element Is Visible    id=txtAddressNoEN    15s
    Input Text                       id=txtAddressNoEN     123
    Press Keys                       id=txtAddressNoEN     \\09

    Input Text                       id=txtMoo             123
    Press Keys                       id=txtMoo             \\09

    Wait Until Element Is Visible    ${Moo_SecondInput}    15s
    Input Text                       ${Moo_SecondInput}    1

    Input Text                       id=txtSoi             5
    Input Text                       ${Soi_SecondInput}    5
    Press Keys                       ${Soi_SecondInput}    \\09

    Input Text                       id=txtVillage         123
    Press Keys                       id=txtVillage         \\09
    Input Text                       id=txtVillageEN       123
    Press Keys                       id=txtVillageEN       \\09

    Input Text                       id=txtRoad            123
    Press Keys                       id=txtRoad            \\09
    Input Text                       id=txtRoadEN          123
    Press Keys                       id=txtRoadEN          \\09

    # จังหวัด/อำเภอ/ตำบล
    Wait Until Element Is Visible    id=btAddress11    15s
    Click Element                    id=btAddress11
    Wait Until Element Is Visible    id=ddProvince    15s
    Sleep    2s
    Select From List By Value        id=ddProvince       10
    Wait Until Element Is Visible    id=ddDistrict    15s
    Sleep    2s
    Select From List By Value        id=ddDistrict       1009
    Wait Until Element Is Visible    id=ddSubDistrict    15s
    Sleep    2s

    Wait Until Element Is Visible    ${Ok_Button}    15s
    Sleep    4s
    Click Button                     ${Ok_Button}

    # บันทึก
    Wait Until Element Is Visible    ${SaveGroup_Button}    15s
    Sleep    2s
    Click Element                    ${SaveGroup_Button}

    Sleep    9999    # ถ้าเป็น debug ไว้ เดี๋ยวค่อยปรับลดภายหลัง

    Wait Until Element Is Visible    ${Confirm_Span}    15s
    Sleep    2s
    Click Element                    ${Confirm_Span}

    Wait Until Element Is Visible    ${Main_Menu_Label}    10s
    Click Element                    ${Main_Menu_Label}
    Sleep    2s