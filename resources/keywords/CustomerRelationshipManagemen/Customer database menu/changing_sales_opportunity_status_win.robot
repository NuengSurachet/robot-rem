*** Settings ***
Library    SeleniumLibrary
Resource    ../../login.robot
Resource    ../../../variables/select_menu/select_menu.robot
Library           FakerLibrary    locale=th_TH
*** Keywords ***
changing_sales_opportunity_status_win
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
    # คลิก cell แถวแรกที่มีข้อความ "อยู่ระหว่างการดำเนินงาน"
    # กรณีเป็น <td>
    Wait Until Element Is Visible    xpath=(//td[normalize-space(.)='อยู่ระหว่างการดำเนินงาน'])[1]    10s
    Click Element                    xpath=(//td[normalize-space(.)='อยู่ระหว่างการดำเนินงาน'])[1]
    # ถ้าไม่ใช่ <td> แต่ใช้ role="cell" ให้ใช้บรรทัดนี้แทน:
    # Click Element    xpath=(//*[@role='cell' and normalize-space(.)='อยู่ระหว่างการดำเนินงาน'])[1]

    # เลือกสถานะ
    Wait Until Element Is Visible    css:#ddStatus    10s
    Select From List By Label        css:#ddStatus    ปิดการขาย(ชนะ)

    # เลือกเหตุผล (ตาม value = 65)
    Wait Until Element Is Visible    css:#ddReason    10s
    Select From List By Value        css:#ddReason    65

    # กดยืนยัน "ตกลง" ปุ่มแรก (อาจเป็น button/a/span ที่ทำหน้าที่เป็นปุ่ม)
    Wait Until Element Is Visible    xpath=//*[self::button or self::a or self::span][normalize-space(.)='ตกลง']    10s
    Click Element                    xpath=//*[self::button or self::a or self::span][normalize-space(.)='ตกลง']

    # กด "ตกลง" ตัวถัดไปใน dialog ผลลัพธ์
    # ถ้ามีข้อความแจ้ง "บันทึกเสร็จสิ้น" ให้เจาะใน popup เพื่อลดการคลิกผิด
    # รอให้ popup โผล่ (ข้อความใดข้อความหนึ่ง)
    Wait Until Page Contains    เปลี่ยนแปลงสถานะเสร็จสิ้น    10s
    Click Element    xpath=//div[contains(.,'เปลี่ยนแปลงสถานะเสร็จสิ้น')]//span[normalize-space(.)='ตกลง']

    # ถ้ายังไม่ยิง ให้ fallback คลิก parent ที่เป็นปุ่ม
    # Click Element    xpath=//div[contains(.,'บันทึกเสร็จสิ้น')]//span[contains(@class,'icon-ui-button')]

     Sleep    2s 
    Wait Until Element Is Visible    xpath=(//*[normalize-space(text())='เมนูหลัก'])[1]    10s
    Click Element    xpath=(//*[normalize-space(text())='เมนูหลัก'])[1]
    Sleep    2s