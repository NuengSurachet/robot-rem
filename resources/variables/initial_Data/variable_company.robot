*** Variables ***
#xpath Variables
${Select_Initial_Data}    xpath=//label[normalize-space()='Initial Data']
${IMAGE_company}    xpath=//img[@id='Pic']
${Add_Company}    xpath=//i[@class='fa fa-plus']

${CompanyID}    xpath=//input[@id='CompanyID']
${CompanyNameThai}    xpath=//input[@datamember='CompanyNameThai']
${vat}    xpath=//tbody/tr[2]/td[4]/input[1]
${CompanyNameEng}    xpath=//input[@datamember='CompanyNameEng']
${phone}    xpath=//tbody/tr[12]/td[2]/input[1]
${save_company}    xpath=//lg[contains(text(),'บันทึก')]
${search_text}    xpath=//input[@id='txtSearchText']
${OK_Button}    xpath=//button[contains(@class, 'ui-button') and contains(., 'ตกลง')]
# Data Variables
${CompanyID_Value}    36866