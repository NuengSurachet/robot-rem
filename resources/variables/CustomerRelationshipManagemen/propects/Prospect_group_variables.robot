*** Variables ***
${Prospect_Group_Menu_Link}        xpath=/html[1]/body[1]/form[1]/div[3]/div[1]/div[1]/ul[1]/li[4]/a[1]
${New_Prospect_Button}             xpath=//span[@id='bt12']

${NamePrefix_TH_Mr}                xpath=//div[@id='ddNamePrefix_chosen']//li[normalize-space()='นาย']
${NamePrefix_EN_Mr}                xpath=//div[@id='ddNamePrefixEN_chosen']//li[normalize-space()='Mr.']

${FirstName_TH_Input}              xpath=//tr[contains(.,'ชื่อ (TH')]//input[@placeholder='อย่างใดอย่างหนึ่ง']
${LastName_TH_Input_X}             xpath=//input[@id='txtLastName']
${FirstName_EN_Input}              xpath=//tr[contains(.,'ชื่อ (EN')]//input[@placeholder='อย่างใดอย่างหนึ่ง']

${Mobile_Primary_Input}            xpath=//*[@id='mobileNo_info']//input
${Mobile_Secondary_Input}          xpath=(//tr[contains(.,'เบอร์โทรศัพท์มือถือ')])[1]//input[2]

${Moo_SecondInput}                 xpath=(//tr[contains(.,'หมู่ที่')])[1]//input[2]
${Soi_SecondInput}                 xpath=(//tr[contains(.,'ซอย')])[1]//input[2]

${Ok_Button}                       xpath=//button[normalize-space()='Ok']
${SaveGroup_Button}                xpath=//*[@id='spanSaveGroup']//*[normalize-space()='บันทึก']
${Confirm_Span}                    xpath=//span[contains(text(),'ตกลง')]
${Main_Menu_Label}                 xpath=(//*[normalize-space(text())='เมนูหลัก'])[1]
