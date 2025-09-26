*** Settings ***
Resource    ../../../resources/keywords/login.robot 
Resource    ../../../resources/keywords/Customer Relationship Managemen/propects/activities_prospects.robot

Test Setup   Login To Application 


*** Test Cases ***
company Test
  Create Activity for Prospect