*** Settings ***
Library    SeleniumLibrary
Resource    ../../login.robot
Resource    ../../../variables/select_menu/select_menu.robot
Library           FakerLibrary    locale=th_TH
*** Keywords ***
opportunities customers
    ${random_company_id}=    FakerLibrary.Random Int    100000    999999
    ${random_company_name}=    FakerLibrary.Company
    ${random_phone}=    Evaluate    random.choice(['08', '09', '06', '07']) + ''.join([str(random.randint(0,9)) for _ in range(8)])    modules=random
    ${vat_number}=    FakerLibrary.Random Number    digits=13
    ${name_eng}=    FakerLibrary.First Name Female 
    Click Element    ${Customer_Relationship_Management}
    Wait Until Element Is Visible    xpath=//*[text()='ฐานข้อมูลลูกค้า']    10s
    Click Element    xpath=//a[contains(text(),'ฐานข้อมูลลูกค้า')]
     # .avatar > a (first)
    Wait Until Element Is Visible    xpath=(//*[@class='avatar']//a)[1]    10s
    Click Element    xpath=(//*[@class='avatar']//a)[1]

    # คลิกลิงก์ "โอกาสการขาย"
   
    Sleep    2s
    Wait Until Element Is Visible    css=a[href*="ContactInfo_Opp.aspx"]    10s
    Sleep    2s
    Click Element                    css=a[href*="ContactInfo_Opp.aspx"]



    # คลิกข้อความ "สร้างโอกาสการขายใหม่"
    Wait Until Element Is Visible    xpath=//*[normalize-space(.)='สร้างโอกาสการขายใหม่']    10s
    Sleep    2s
    Click Element    xpath=//*[normalize-space(.)='สร้างโอกาสการขายใหม่']

    # เลือก dropdown ต่าง ๆ
    Wait Until Element Is Visible    css:#ddlProject    10s
    Sleep    4s
    Select From List By Value        css:#ddlProject              CB0081
    Sleep    1s
    Select From List By Value        css:#ddOpportunity           100%
    Sleep    1s
    Select From List By Value        css:#ddChannelType           3946
    Sleep    1s
    Select From List By Value        css:#ddPurchaseObjectives    4120
    Sleep    1s
    Select From List By Value        css:#ddlOpportunityChannel   4122
    Sleep    1s

    # กรอก Note (ไทย/อังกฤษ)
    Click Element    css:#txtNote
    Click Element    css:#txtNote
    Input Text       css:#txtNote      ทดสอบ
    Input Text       css:#txtNoteEN    todsob

    # กรอกงบประมาณ ชื่อโอกาส
    Input Text       css:#txtBudget    90000
    Input Text       css:#txtOppName   กำไร

    # textbox ที่มีชื่อ/placeholder "Ex."
    Wait Until Element Is Visible    css:#txtSalePerMonth    10s
    Click Element                    css:#txtSalePerMonth
    Clear Element Text               css:#txtSalePerMonth
    Input Text                       css:#txtSalePerMonth    500000
    # เปิด "Custom Label"
    Wait Until Element Is Visible    xpath=//a[normalize-space(.)='Custom Label']    10s
    Click Element                    xpath=//a[normalize-space(.)='Custom Label']

    # เซลล์ที่มีข้อความ "*" แล้วกรอกใน textbox ข้างใน
    Wait Until Element Is Visible    css:#txt_2ccf974d-8746-462e-9890-eba2220af947    10s
    Click Element                    css:#txt_2ccf974d-8746-462e-9890-eba2220af947
    Clear Element Text               css:#txt_2ccf974d-8746-462e-9890-eba2220af947
    Input Text                       css:#txt_2ccf974d-8746-462e-9890-eba2220af947    หนึ่ง


    # ปุ่ม "บันทึก" ภายใน #spanSaveGroup
    Wait Until Element Is Visible    xpath=//*[@id='spanSaveGroup']//*[normalize-space(.)='บันทึก']    10s
    Click Element                    xpath=//*[@id='spanSaveGroup']//*[normalize-space(.)='บันทึก']

    # คลิก "ตกลง" ตัวที่ 3 (nth(2) ของ Playwright)
    Wait Until Element Is Visible    xpath=//span[contains(@class,'icon-ui-button')]//span[normalize-space(.)='ตกลง']    10s
    Click Element                    xpath=//span[contains(@class,'icon-ui-button')]//span[normalize-space(.)='ตกลง']
