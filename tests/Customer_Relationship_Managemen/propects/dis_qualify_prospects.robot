*** Settings ***
Resource    ../../../resources/keywords/login.robot
Resource    ../../../resources/keywords/Customer Relationship Managemen/propects/dis_qualify_prospects.robot

Test Setup   Login To Application 


*** Test Cases ***
company Test
  dis_qualify_prospects