*** Settings ***
Resource    ../../../resources/keywords/login.robot
Resource    ../../../resources/keywords/initial_Data/branding.robot
Test Setup   Login To Application 


*** Test Cases ***
company Test
    check add new branding
