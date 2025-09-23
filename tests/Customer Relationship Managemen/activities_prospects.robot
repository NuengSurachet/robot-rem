*** Settings ***
Resource    ../../../resources/keywords/login.robot
Resource    ../../resources/keywords/Customer Relationship Managemen/Prospect_group.robot
Resource    ../../resources/keywords/Customer Relationship Managemen/activities_prospects.robot

Test Setup   Login To Application 


*** Test Cases ***
company Test
  Create Activity for Prospect