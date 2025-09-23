*** Settings ***
Resource    ../../../resources/keywords/login.robot
Resource    ../../resources/keywords/Customer Relationship Managemen/Prospect_group.robot
Resource    ../../resources/keywords/Customer Relationship Managemen/activities_prospects.robot
Resource    ../../resources/keywords/Customer Relationship Managemen/qualify_prospects.robot

Test Setup   Login To Application 


*** Test Cases ***
company Test
  qualify_prospects