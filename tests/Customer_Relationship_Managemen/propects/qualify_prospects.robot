*** Settings ***
Resource    ../../../resources/keywords/login.robot
Resource    ../../../resources/keywords/Customer Relationship Managemen/propects/qualify_prospects.robot

Test Setup   Login To Application 


*** Test Cases ***
company Test
  qualify_prospects