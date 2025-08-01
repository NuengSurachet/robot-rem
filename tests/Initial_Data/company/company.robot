*** Settings ***
Resource    ../../../resources/keywords/login.robot
Resource    ../../../resources/keywords/initial_Data/company.robot
Test Setup   Login To Application 


*** Test Cases ***
company Test
    check add new company
