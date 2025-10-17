*** Settings ***
Resource    ../../../resources/keywords/login.robot
Resource    ../../../resources/keywords/CustomerRelationshipManagemen/propects/Prospect_group.robot
Resource    ../../../resources/keywords/CustomerRelationshipManagemen/propects/activities_prospects.robot
Resource    ../../../resources/keywords/CustomerRelationshipManagemen/propects/change_status_propects.robot
Resource    ../../../resources/keywords/CustomerRelationshipManagemen/propects/qualify_prospects.robot
Resource    ../../../resources/keywords/CustomerRelationshipManagemen/propects/dis_qualify_prospects.robot
Resource    ../../../resources/keywords/CustomerRelationshipManagemen/Customer database menu/create_customer.robot
Resource    ../../../resources/keywords/CustomerRelationshipManagemen/Customer database menu/opportunities _customers.robot
Resource    ../../../resources/keywords/CustomerRelationshipManagemen/Customer database menu/changing_sales_opportunity_status_win.robot
Resource    ../../../resources/keywords/CustomerRelationshipManagemen/Customer database menu/changing_sales_opportunity_status_lost.robot

Test Setup   Login To Application 


*** Test Cases ***
company Test
    create Prospect Group
   
    Create Activity for Prospect
    
    change_status_propects 
    
    qualify_prospects
    
    dis_qualify_prospects
    
    
    create_customer
    
    
    opportunities customers
     
   
    changing_sales_opportunity_status_win
    
    changing_sales_opportunity_status_lost