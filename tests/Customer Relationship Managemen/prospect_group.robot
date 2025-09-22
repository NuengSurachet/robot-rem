*** Settings ***
Resource    ../../../resources/keywords/login.robot
Resource    ../../resources/keywords/Customer Relationship Managemen/Prospect_group.robot

Test Setup   Login To Application 


*** Test Cases ***
company Test
  create Prospect Group