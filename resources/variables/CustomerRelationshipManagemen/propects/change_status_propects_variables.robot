*** Variables ***
${Prospect_Group_Tab}           xpath=//*[text()='กลุ่มผู้มุ่งหวัง']
${Activity_Tab}                 xpath=//li[@pkey='Activity']//a[contains(text(),'กิจกรรม')]
${Status_In_Progress_2}         xpath=(//*[normalize-space(.)='อยู่ระหว่างการดำเนินการ'])[2]
${Confirm_Button}               xpath=//button[normalize-space(.)='ตกลง']
${Fifth_Image}                  xpath=(//img)[5]
${Box_Icon_Image}               xpath=//div[@icon-type='box']//div//div//img
${Main_Menu_Label}              xpath=(//*[normalize-space(text())='เมนูหลัก'])[1]
