*** Settings ***
Library           SeleniumLibrary
Library           FakerLibrary    locale=th_TH
Resource          ../../variables/initial_Data/variable_company.robot
*** Keywords ***
check add new company
    [Documentation]    This keyword checks if the common keyword is available.
    Sleep    1s
    Click Element    ${Select_Initial_Data}
    Click Element    ${Add_Company}
    Sleep    1s
    ${random_company_id}=    FakerLibrary.Random Int    100000    999999
    ${random_company_name}=    FakerLibrary.Company
    ${random_phone}=    FakerLibrary.Phone Number
    ${vat_number}=    FakerLibrary.Random Number    digits=13
    ${name_eng}=    FakerLibrary.First Name Female


    Input Text    ${CompanyID}    ${random_company_id}
    Input Text    ${CompanyNameThai}    ${random_company_name}
    Input Text    ${vat}    ${vat_number}
    Input Text    ${CompanyNameEng}    ${name_eng}
    Input Text    ${phone}    ${random_phone}
    Click Element    ${save_company}
    Sleep    1s
    Click Element    ${OK_Button}
    Press Keys      None    TAB
    Press Keys      None    Enter
    Input Text    ${search_text}    ${random_company_id}
    Sleep    1s
    Click Element    ${search_button}
    Sleep    2s
    Click Element    ${activate_button}
    Click Element    ${accept_button}
    Sleep    2s
    Click Element    ${activate_button}
    Click Element    ${accept_button}
    Sleep    2s
    Click Element    ${settings_button}
    Sleep    2s
    Input Text    ${monney_input}    100
    Sleep    2s
    Click Element    ${save_button}