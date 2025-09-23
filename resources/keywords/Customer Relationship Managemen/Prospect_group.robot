*** Settings ***
Library           SeleniumLibrary
Resource    ../login.robot
Resource    ../../variables/select_menu/select_menu.robot
Library           FakerLibrary    locale=th_TH
*** Keywords ***
create Prospect Group
    ${random_company_id}=    FakerLibrary.Random Int    100000    999999
    ${random_company_name}=    FakerLibrary.Company
    ${random_phone}=    Evaluate    random.choice(['08', '09', '06', '07']) + ''.join([str(random.randint(0,9)) for _ in range(8)])    modules=random
    ${vat_number}=    FakerLibrary.Random Number    digits=13
    ${name_eng}=    FakerLibrary.First Name Female

    Login To Application
    Click Element    ${Customer_Relationship_Management}
    Sleep    4s
    Click Element    xpath=/html[1]/body[1]/form[1]/div[3]/div[1]/div[1]/ul[1]/li[4]/a[1]
    Sleep    4s
    Click Element    xpath=//span[@id='bt12']
     # คำนำหน้า (TH) - Chosen
    Wait Until Element Is Visible    css=#ddNamePrefix_chosen a    15s
    Wait Until Element Is Enabled    css=#ddNamePrefix_chosen a    15s
    Click Element                    css=#ddNamePrefix_chosen a
    Wait Until Element Is Visible    xpath=//div[@id='ddNamePrefix_chosen']//li[normalize-space()='นาย']    15s
    Click Element                    xpath=//div[@id='ddNamePrefix_chosen']//li[normalize-space()='นาย']

    # ประเภทผู้ติดต่อ
    Wait Until Element Is Visible    id=ddContactType    15s
    Wait Until Element Is Enabled    id=ddContactType    15s
    Select From List By Value        id=ddContactType    374

    # คำนำหน้า (EN) - Chosen
    Wait Until Element Is Visible    css=#ddNamePrefixEN_chosen a    15s
    Wait Until Element Is Enabled    css=#ddNamePrefixEN_chosen a    15s
    Click Element                    css=#ddNamePrefixEN_chosen a
    Wait Until Element Is Visible    xpath=//div[@id='ddNamePrefixEN_chosen']//li[normalize-space()='Mr.']    15s
    Click Element                    xpath=//div[@id='ddNamePrefixEN_chosen']//li[normalize-space()='Mr.']

    # แหล่งที่มา / สถานะ / โครงการ / ช่องทาง Lead / วัตถุประสงค์การซื้อ
    Wait Until Element Is Visible    id=ddDatasource    15s
    Select From List By Value        id=ddDatasource    51

    Wait Until Element Is Visible    id=ddContactStatus    15s
    Select From List By Value        id=ddContactStatus    55

    Wait Until Element Is Visible    id=ddProject    15s
    Select From List By Value        id=ddProject    CB0081

    Wait Until Element Is Visible    id=ddLeadChannel    15s
    Select From List By Value        id=ddLeadChannel    423

    Wait Until Element Is Visible    id=ddPurchaseObjectives    15s
    Select From List By Value        id=ddPurchaseObjectives    489

    # ชื่อ (TH)
    Wait Until Element Is Visible    xpath=//tr[contains(.,'ชื่อ (TH')]//input[@placeholder='อย่างใดอย่างหนึ่ง']    15s
    Input Text                       xpath=//tr[contains(.,'ชื่อ (TH')]//input[@placeholder='อย่างใดอย่างหนึ่ง']    ${name_eng}

    # นามสกุล (TH)
    Click Element    xpath=//input[@id='txtLastName']
    Input Text    xpath=//input[@id='txtLastName']   ${name_eng}

    # นามสกุล (EN)
    Wait Until Element Is Visible    id=txtLastName    15s
    Input Text                       id=txtLastName    Oliver

    # ชื่อ (EN)
    Wait Until Element Is Visible    xpath=//tr[contains(.,'ชื่อ (EN')]//input[@placeholder='อย่างใดอย่างหนึ่ง']    15s
    Input Text                       xpath=//tr[contains(.,'ชื่อ (EN')]//input[@placeholder='อย่างใดอย่างหนึ่ง']    ${name_eng}
 
    # เบอร์มือถือหลัก
    Wait Until Element Is Visible    xpath=//*[@id='mobileNo_info']//input    15s
    Input Text                       xpath=//*[@id='mobileNo_info']//input    ${random_phone}

    # เบอร์มือถือรอง
    Wait Until Element Is Visible    xpath=(//tr[contains(.,'เบอร์โทรศัพท์มือถือ')])[1]//input[2]    15s
    Input Text                       xpath=(//tr[contains(.,'เบอร์โทรศัพท์มือถือ')])[1]//input[2]    ${random_phone}

    # ที่อยู่
    Wait Until Element Is Visible    id=txtAddressNo    15s
    Input Text                       id=txtAddressNo       1/2504
    Press Keys                       id=txtAddressNo       \\09

    Wait Until Element Is Visible    id=txtAddressNoEN    15s
    Input Text                       id=txtAddressNoEN     123
    Press Keys                       id=txtAddressNoEN     \\09

    Input Text                       id=txtMoo             123
    Press Keys                       id=txtMoo             \\09

    Wait Until Element Is Visible    xpath=(//tr[contains(.,'หมู่ที่')])[1]//input[2]    15s
    Input Text                       xpath=(//tr[contains(.,'หมู่ที่')])[1]//input[2]    1

  
    Input Text                       id=txtSoi             5
    Input Text                       xpath=(//tr[contains(.,'ซอย')])[1]//input[2]    5
    Press Keys                       xpath=(//tr[contains(.,'ซอย')])[1]//input[2]    \\09

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
    Select From List By Value        id=ddProvince       10
    Wait Until Element Is Visible    id=ddDistrict    15s
    Select From List By Value        id=ddDistrict       1009
    Wait Until Element Is Visible    id=ddSubDistrict    15s
  
    Wait Until Element Is Visible    xpath=//button[normalize-space()='Ok']    15s
    Sleep    4s
    Click Button                     xpath=//button[normalize-space()='Ok']

    # บันทึก
    Wait Until Element Is Visible    xpath=//*[@id='spanSaveGroup']//*[normalize-space()='บันทึก']    15s
    Click Element                    xpath=//*[@id='spanSaveGroup']//*[normalize-space()='บันทึก']
    Wait Until Element Is Visible    xpath=//span[contains(text(),'ตกลง')]    15s
    Click Element                    xpath=//span[contains(text(),'ตกลง')]