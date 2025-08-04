*** Settings ***
Library           SeleniumLibrary
Library           FakerLibrary    locale=th_TH
Resource          ../../variables/initial_Data/variable_branding.robot
*** Keywords ***
check add new branding
    [Documentation]    This keyword checks if the common keyword is available.
    Sleep    1s
    ${random_branding_id}=    FakerLibrary.Random Int    100000    999999
    ${random_branding_name}=    FakerLibrary.Company
    ${random_phone}=    FakerLibrary.Phone Number
    ${BrandCode}=    FakerLibrary.Random Number    digits=13
    ${name_eng}=    FakerLibrary.First Name Female
    Sleep    1s
    Click Element    ${Select_Initial_Data}
    Sleep    2s
    Click Element    xpath=//a[@href='Brand.aspx']//span[@class='ui-icon ui-icon-carat-1-e icon-right']
    Click Element    xpath=//lg[contains(text(),'เพิ่มข้อมูล')]
    Input Text    xpath=//input[@id='dialogBrandName']    ${random_branding_name}
    Input Text    xpath=//input[@id='dialogBrandNameEng']    ${name_eng}
    Input Text    xpath=//input[@id='dialogBrandNameAbs']    ${random_branding_name}
    Input Text    xpath=//input[@id='dialogBrandNameEngAbs']    ${name_eng}
    Input Text    xpath=//input[@id='dialogBrandCode']    ${BrandCode}
    Click Element     xpath=//button[.//span[normalize-space(text())='บันทึก']]
    Input Text    xpath=//input[@id='txtSearchText']    ${random_branding_name}
    Click Element    xpath=//button[@id='btSearch']
    Sleep    2s
    Click Element    xpath=//img[@id='dImg']
    Click Element    xpath=//span[contains(text(),'ตกลง')]
    Sleep    2s
    Click Element    xpath=//img[@id='dImg']
    Click Element    xpath=//span[contains(text(),'ตกลง')]