*** Settings ***
Library    SeleniumLibrary
Resource    ../../login.robot
Resource    ../../../variables/select_menu/select_menu.robot
Library           FakerLibrary    locale=th_TH
*** Keywords ***
create_customer
    ${random_company_id}=    FakerLibrary.Random Int    100000    999999
    ${random_company_name}=    FakerLibrary.Company
    ${random_phone}=    Evaluate    random.choice(['08', '09', '06', '07']) + ''.join([str(random.randint(0,9)) for _ in range(8)])    modules=random
    ${vat_number}=    FakerLibrary.Random Number    digits=13
    ${name_eng}=    FakerLibrary.First Name Female 
    Click Element    ${Customer_Relationship_Management}
    Wait Until Element Is Visible    xpath=//*[text()='ฐานข้อมูลลูกค้า']    10s
    Click Element    xpath=//a[contains(text(),'ฐานข้อมูลลูกค้า')]
     # สร้างลูกค้าใหม่
    Wait Until Element Is Visible    xpath=//*[normalize-space()='สร้างลูกค้าใหม่']    15s
    Sleep    4s
    Click Element                    xpath=//*[normalize-space()='สร้างลูกค้าใหม่']

     # คำนำหน้าชื่อ (TH) - Chosen (เวอร์ชันกันพัง)
    Wait Until Element Is Visible    css=#ddNamePrefix_chosen a    15s
    Click Element                    css=#ddNamePrefix_chosen a

# รอให้ดรอปดาวน์โผล่จริง
    Wait Until Element Is Visible    css=#ddNamePrefix_chosen .chosen-drop    10s

# บางธีมของ Chosen ต้องโฟกัสช่องค้นหาแล้วพิมพ์ให้เกิดรายการ
    Wait Until Element Is Visible    css=#ddNamePrefix_chosen .chosen-search-input    10s
    Click Element                    css=#ddNamePrefix_chosen .chosen-search-input
    Input Text                       css=#ddNamePrefix_chosen .chosen-search-input    นาย
    Sleep    2s
# รอรายการที่คลิกได้ (ต้องเป็น active-result ไม่ใช่ result-selected)
    Wait Until Element Is Visible    xpath=//div[@id='ddNamePrefix_chosen']//li[contains(@class,'active-result') and normalize-space()='นาย']    10s
    Click Element                    xpath=//div[@id='ddNamePrefix_chosen']//li[contains(@class,'active-result') and normalize-space()='นาย']
    Sleep    2s


    # ชื่อ-นามสกุล (TH)
    Wait Until Element Is Visible    xpath=//tr[contains(.,'ชื่อ (TH')]//input[@placeholder='อย่างใดอย่างหนึ่ง']    15s
    Input Text                       xpath=//tr[contains(.,'ชื่อ (TH')]//input[@placeholder='อย่างใดอย่างหนึ่ง']    ${random_company_name}
    Wait Until Element Is Visible    id=txtLastName    15s
    Input Text                       id=txtLastName    สุดหล่อ

    # คำนำหน้าชื่อ (EN) - Chosen แบบไม่ใช้ตัวแปร
    Wait Until Element Is Visible    css=#ddNamePrefixEN_chosen a    15s
    Click Element                    css=#ddNamePrefixEN_chosen a
    Wait Until Element Is Visible    css=#ddNamePrefixEN_chosen .chosen-drop    10s
    Wait Until Element Is Visible    css=#ddNamePrefixEN_chosen .chosen-search-input    10s
    Input Text                       css=#ddNamePrefixEN_chosen .chosen-search-input    Mr

    # พยายามคลิก "Mr." ถ้ามีลิสต์
    Run Keyword And Ignore Error    Click Element    xpath=//div[@id='ddNamePrefixEN_chosen']//li[contains(@class,'active-result') and normalize-space()='Mr.']

    # ยิง JS ตั้งค่าที่ <select> ตรงๆ เป็น fallback (ทำซ้ำก็ไม่พัง)
    Execute Javascript
    ...    (function(){
    ...      var sel=document.getElementById('ddNamePrefixEN');
    ...      if(!sel) return;
    ...      for(var i=0;i<sel.options.length;i++){
    ...        if((sel.options[i].text||'').trim()==='Mr.'){
    ...          sel.value=sel.options[i].value;
    ...          sel.dispatchEvent(new Event('change',{bubbles:true}));
    ...          break;
    ...        }
    ...      }
    ...    })();

    # จิ้ม chosen อีกทีให้ข้อความรีเฟรชตาม
    Click Element    css=#ddNamePrefixEN_chosen a
    Sleep            0.3s

    # ชื่อ-นามสกุล (EN)
    Wait Until Element Is Visible    xpath=//tr[contains(.,'ชื่อ (EN')]//input[@placeholder='อย่างใดอย่างหนึ่ง']    15s
    Input Text                       xpath=//tr[contains(.,'ชื่อ (EN')]//input[@placeholder='อย่างใดอย่างหนึ่ง']    ${name_eng}
    Wait Until Element Is Visible    id=txtLastNameEng    15s
    Input Text                       id=txtLastNameEng    sudlor
    Wait Until Element Is Visible    id=txtFirstNameEng    15s
    Input Text                       id=txtFirstNameEng  ${name_eng}

 # เพศ
    Wait Until Element Is Visible    xpath=//input[@type='radio' and @name='rdGender' and @value='ชาย']    15s
    Click Element                    xpath=//input[@type='radio' and @name='rdGender' and @value='ชาย']

    # (สำรอง) ถ้าบางธีมจับ radio ยาก ให้คลิก label แทน
    # Click Element    xpath=//label[@for='rdGender1']

    # ประเภทผู้ติดต่อ / Grade
    Wait Until Element Is Visible    id=ddContactType    15s
    Select From List By Value        id=ddContactType    21
    Wait Until Element Is Visible    id=ddGrade          15s
    Select From List By Value        id=ddGrade          30

    # ชื่อเล่น / บัตรประชาชน
    Wait Until Element Is Visible    id=txtNickname      15s
    Input Text                       id=txtNickname      หนึ่ง
    Wait Until Element Is Visible    id=txtCitizenID     15s
    Input Text                       id=txtCitizenID     ${random_phone}

 # วันที่ออกบัตร: วัน เดือน ปี (พ.ศ.) — ใช้ id ตรงๆ ให้เสถียร
    Wait Until Element Is Visible    id=ddDayIs       15s
    Wait Until Element Is Enabled    id=ddDayIs       15s
    Select From List By Value        id=ddDayIs       18          # วัน 18

    Wait Until Element Is Visible    id=ddMonthIs     15s
    Wait Until Element Is Enabled    id=ddMonthIs     15s
    Select From List By Value        id=ddMonthIs     11          # พฤศจิกายน

    Wait Until Element Is Visible    id=txtYearIs     15s
    Wait Until Element Is Enabled    id=txtYearIs     15s
    Clear Element Text               id=txtYearIs
    Input Text                       id=txtYearIs     2544        # พ.ศ.

    # สัญชาติ / สถานที่ออกบัตร
    Wait Until Element Is Visible    id=ddNationality     15s
    Select From List By Value        id=ddNationality     94
    Wait Until Element Is Visible    id=txtIssuedAt       15s
    Input Text                       id=txtIssuedAt       สุดหล่อ

  # วันหมดอายุ: วัน เดือน ปี (พ.ศ.) + ตลอดชีพ — ใช้ id ตรงๆ
    Wait Until Element Is Visible    id=ddDayExp       15s
    Wait Until Element Is Enabled    id=ddDayExp       15s
    Select From List By Value        id=ddDayExp       16          # วัน 16

    Wait Until Element Is Visible    id=ddMonthExp     15s
    Wait Until Element Is Enabled    id=ddMonthExp     15s
    Select From List By Value        id=ddMonthExp     12          # ธันวาคม

    Wait Until Element Is Visible    id=txtYearExp     15s
    Wait Until Element Is Enabled    id=txtYearExp     15s
    Clear Element Text               id=txtYearExp
    Input Text                       id=txtYearExp     2296        # พ.ศ.
    Wait Until Element Is Visible    xpath=//input[@type='radio' and @value='โสด']    15s
    Click Element                    xpath=//input[@type='radio' and @value='โสด']
    Wait Until Element Is Visible    xpath=//tr[contains(.,'ชื่อ (EN') and contains(.,'นามสกุล')]/descendant::input[@placeholder='อย่างใดอย่างหนึ่ง'][1]    15s
    Click Element                    xpath=//tr[contains(.,'ชื่อ (EN') and contains(.,'นามสกุล')]/descendant::input[@placeholder='อย่างใดอย่างหนึ่ง'][1]
    Input Text                       xpath=//tr[contains(.,'ชื่อ (EN') and contains(.,'นามสกุล')]/descendant::input[@placeholder='อย่างใดอย่างหนึ่ง'][1]    sudlor

    # กรอกชื่อเล่น
    Wait Until Element Is Visible    id=txtNickname    15s
    Click Element                    id=txtNickname
    Input Text                       id=txtNickname    gg
  
    # เชื้อชาติ / ประเทศพาสปอร์ต
    Wait Until Element Is Visible    id=ddOrigin             15s
    Select From List By Value        id=ddOrigin             263
    Wait Until Element Is Visible    id=ddPassportCountry    15s
    Select From List By Value        id=ddPassportCountry    75

    # เบอร์มือถือ
    Wait Until Element Is Visible    xpath=//*[@id='mobileNo_info']//input    15s
    Input Text                       xpath=//*[@id='mobileNo_info']//input    ${random_phone}

    # อาชีพ
    Wait Until Element Is Visible    id=ddOccupation         15s
    Select From List By Value        id=ddOccupation         4104

    # ที่อยู่ (ชุด 6) TH/EN
    Wait Until Element Is Visible    id=txtAddressNo_6       15s
    Input Text                       id=txtAddressNo_6       1/2504
    Wait Until Element Is Visible    id=txtAddressNo_6_EN    15s
    Input Text                       id=txtAddressNo_6_EN    11515

    Wait Until Element Is Visible    id=txtMoo_6             15s
    Input Text                       id=txtMoo_6             5
    
    Wait Until Element Is Visible    id=txtSoi_6             15s
    Input Text                       id=txtSoi_6             5
  
 
    Wait Until Element Is Visible    id=txtVillage_6         15s
    Input Text                       id=txtVillage_6         1
    Wait Until Element Is Visible    id=txtVillage_6_EN      15s
    Input Text                       id=txtVillage_6_EN      1

    Wait Until Element Is Visible    id=txtRoad_6            15s
    Input Text                       id=txtRoad_6            1
     
    # เปิด dialog จังหวัด/อำเภอ/ตำบล
    Wait Until Element Is Visible    id=btAddress61          15s
    Click Element                    id=btAddress61
    Wait Until Element Is Visible    id=ddProvince           15s
    Sleep    2s
    Select From List By Value        id=ddProvince           36
    Wait Until Element Is Visible    id=ddDistrict           15s
    Sleep    2s
    Select From List By Value        id=ddDistrict           3604
    Wait Until Element Is Visible    id=ddSubDistrict        15s
    Sleep    2s
    Select From List By Value        id=ddSubDistrict        360403
    Wait Until Element Is Visible    xpath=//button[normalize-space()='ตกลง']    15s
    Click Button                     xpath=//button[normalize-space()='ตกลง']

    # คัดลอกที่อยู่ไปหลายชุด
    Wait Until Element Is Visible    id=btCopyAddressMulti6    15s
    Click Element                    id=btCopyAddressMulti6
    Wait Until Element Is Visible    xpath=(//input[@name='ToAddressMulti'])[1]    15s
    Sleep    2s
    Click Element                    xpath=(//input[@name='ToAddressMulti'])[1]
    Sleep    2s
    Click Element                    xpath=(//input[@name='ToAddressMulti'])[2]
    Sleep    2s
    Click Element                    xpath=(//input[@name='ToAddressMulti'])[3]
    Sleep    2s
    Click Element                    xpath=(//input[@name='ToAddressMulti'])[4]
    Sleep    2s
    Click Element                    xpath=(//input[@name='ToAddressMulti'])[5]
    Sleep    2s
    # ยืนยัน
    Wait Until Element Is Visible    xpath=(//div[contains(@class,'ui-dialog') and contains(@style,'display: block')][.//span[@class='ui-dialog-title' and normalize-space()='คัดลอกที่อยู่']])[last()]//button[.//span[normalize-space()='ยืนยัน']]    15s
    Click Button                     xpath=(//div[contains(@class,'ui-dialog') and contains(@style,'display: block')][.//span[@class='ui-dialog-title' and normalize-space()='คัดลอกที่อยู่']])[last()]//button[.//span[normalize-space()='ยืนยัน']]

    # ตกลง
    Wait Until Element Is Visible    xpath=(//div[contains(@class,'ui-dialog') and contains(@style,'display: block')][.//span[@class='ui-dialog-title' and normalize-space()='ยืนยัน']])[last()]//button[.//span[normalize-space()='ตกลง']]    15s
    Click Button                     xpath=(//div[contains(@class,'ui-dialog') and contains(@style,'display: block')][.//span[@class='ui-dialog-title' and normalize-space()='ยืนยัน']])[last()]//button[.//span[normalize-space()='ตกลง']]

    # ยินยอมข่าวสาร
    Wait Until Element Is Visible    xpath=//tr[contains(.,'อนุญาตให้ส่งข่าวสารผ่านจดหมาย')]//label[normalize-space()='ใช่']/preceding-sibling::input[1]    15s
    Click Element                    xpath=//tr[contains(.,'อนุญาตให้ส่งข่าวสารผ่านจดหมาย')]//label[normalize-space()='ใช่']/preceding-sibling::input[1]
    Wait Until Element Is Visible    xpath=//tr[contains(.,'อนุญาตให้ส่งข่าวสารผ่านSMS')]//label[normalize-space()='ใช่']/preceding-sibling::input[1]    15s
    Click Element                    xpath=//tr[contains(.,'อนุญาตให้ส่งข่าวสารผ่านSMS')]//label[normalize-space()='ใช่']/preceding-sibling::input[1]
    Wait Until Element Is Visible    xpath=//tr[contains(.,'อนุญาตให้ส่งข่าวสารผ่านอีเมล')]//label[normalize-space()='ใช่']/preceding-sibling::input[1]    15s
    Click Element                    xpath=//tr[contains(.,'อนุญาตให้ส่งข่าวสารผ่านอีเมล')]//label[normalize-space()='ใช่']/preceding-sibling::input[1]

    # ไปที่แท็บ Custom Label และเลือก radio
    Sleep    4s
     
    Click Element                    xpath=//span[normalize-space()='Custom Label']
    Wait Until Element Is Visible    id=dd_d22df620-8540-46dd-91b8-4168f7df7f4f    15s
    Select From List By Label        id=dd_d22df620-8540-46dd-91b8-4168f7df7f4f    Father
    # หรือเลือก Mather (ตาม DOM พิมพ์แบบนี้จริง)
    # Select From List By Label      id=dd_d22df620-8540-46dd-91b8-4168f7df7f4f    Mather
    # หรือถ้าจะใช้ value:
    # Select From List By Value      id=dd_d22df620-8540-46dd-91b8-4168f7df7f4f    l02gt8b2-w32b-q8ag-myn0-cw9ksr429ak4
    # เลือก radio "ไม่อนุญาตให้ติดต่อกลับ"
    # รอจน label "ไม่อนุญาตให้ติดต่อกลับ" โผล่
    Wait Until Element Is Visible    xpath=//label[normalize-space()='ไม่อนุญาตให้ติดต่อกลับ']    15s

    # คลิก radio โดยอ้างอิงจาก label
    Click Element    xpath=//label[normalize-space()='ไม่อนุญาตให้ติดต่อกลับ']/preceding-sibling::input


    # คลิกเมนู "ข้อมูลทั่วไป"
    Wait Until Element Is Visible    xpath=//a[normalize-space()='ข้อมูลทั่วไป']    15s
    Click Element                    xpath=//a[normalize-space()='ข้อมูลทั่วไป']

    # กรอกชื่อ (EN) นามสกุล
    Wait Until Element Is Visible    xpath=//tr[contains(.,'ชื่อ (EN') and contains(.,'นามสกุล')]/descendant::input[@placeholder='อย่างใดอย่างหนึ่ง'][1]    15s
    Click Element                    xpath=//tr[contains(.,'ชื่อ (EN') and contains(.,'นามสกุล')]/descendant::input[@placeholder='อย่างใดอย่างหนึ่ง'][1]
    Input Text                       xpath=//tr[contains(.,'ชื่อ (EN') and contains(.,'นามสกุล')]/descendant::input[@placeholder='อย่างใดอย่างหนึ่ง'][1]    ${random_company_name}

    # อนุญาต/ไม่อนุญาตให้ส่งข่าวสาร
    # SMS -> ใช่
    Wait Until Element Is Visible    xpath=//tr[contains(.,'อนุญาตให้ส่งข่าวสารผ่านSMS')]//label[normalize-space()='ใช่']/preceding-sibling::input    15s
    Click Element                    xpath=//tr[contains(.,'อนุญาตให้ส่งข่าวสารผ่านSMS')]//label[normalize-space()='ใช่']/preceding-sibling::input
# อนุญาตส่งข่าวสารผ่านจดหมาย
    Wait Until Page Contains Element    xpath=//input[@name='rdDM_Flag' and @value='true']    15s
    Select Radio Button                 rdDM_Flag    true
    Sleep    2s
    # อนุญาตส่งข่าวสารผ่าน SMS
    Wait Until Page Contains Element    xpath=//input[@name='rdSMS_Flag' and @value='true']    15s
    Select Radio Button                 rdSMS_Flag    true
    Radio Button Should Be Set To       rdSMS_Flag    true
    Sleep    2s
    # อนุญาตส่งข่าวสารผ่านอีเมล
    Wait Until Page Contains Element    xpath=//input[@name='rdEMAIL_Flag' and @value='true']    15s
    Select Radio Button                 rdEMAIL_Flag    true
    Radio Button Should Be Set To       rdEMAIL_Flag    true
    Sleep    2s
 
 
    # บันทึก
    Wait Until Element Is Visible    xpath=//*[@id='spanSaveGroup']//*[normalize-space()='บันทึก']    15s
    Click Element                    xpath=//*[@id='spanSaveGroup']//*[normalize-space()='บันทึก']
    Wait Until Element Is Visible    xpath=(//*[normalize-space()='ตกลง'])[2]    15s
    Click Element                    xpath=(//*[normalize-space()='ตกลง'])[2]
   
    