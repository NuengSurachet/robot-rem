*** Settings ***
Resource    ../../../resources/keywords/login.robot
Resource    ../../../resources/keywords/Customer Relationship Managemen/propects/change_status_propects.robot
 
Test Setup   Login To Application 


*** Test Cases ***
company Test
  change_status_propects