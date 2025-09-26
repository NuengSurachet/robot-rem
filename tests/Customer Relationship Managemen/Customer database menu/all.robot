*** Settings ***
Resource    ../../../resources/keywords/login.robot
Resource    ../../../resources/keywords/Customer Relationship Managemen/Customer database menu/create_customer.robot

Test Setup   Login To Application 


*** Test Cases ***
company Test
    create_customer 