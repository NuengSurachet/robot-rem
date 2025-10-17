*** Settings ***
Resource    ../../../resources/keywords/login.robot
Resource    ../../../resources/keywords/Customer Relationship Managemen/propects/change_status_propects.robot
Resource    ../../../resources/keywords/Customer Relationship Managemen/Customer database menu/create_customer.robot
Resource    ../../../resources/keywords/Customer Relationship Managemen/Customer database menu/opportunities _customers.robot
 
Resource    ../../../resources/keywords/Customer Relationship Managemen/Customer database menu/changing_sales_opportunity_status_win.robot
 
Test Setup   Login To Application 


*** Test Cases ***
company Test
   changing_sales_opportunity_status_win