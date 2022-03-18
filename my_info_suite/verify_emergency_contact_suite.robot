*** Settings ***
Documentation   This suite handles test case related to emergency contact
Resource    ../Resource/Base/CommonFunctionality.resource

Library   DataDriver    file=../test_data/data.xlsx      sheet_name=AddEmergencyContact
Test Setup  Launch Browser
Test Teardown   Close Browser

Test Template   Verify Add Emergency Contact Test

*** Test Cases ***
TC1

*** Keywords ***
Verify Add Emergency Contact Test
    [Arguments]     ${username}     ${password}     ${name}     ${relationship}      ${home_telephone}
    Input Text    id=txtUsername    ${username}
    Input Password    id=txtPassword    ${password}
    Click Element    id=btnLogin
    Page Should Contain    My Info
    Click Element    link=My Info
    Click Element    link=Emergency Contacts
    Click Element    id=btnAddContact
    Input Text    id=emgcontacts_name    ${name}
    Input Text    id=emgcontacts_relationship    ${relationship}
    Input Text    id=emgcontacts_homePhone    ${home_telephone}
    Click Element    id=btnSaveEContact

    Table Should Contain    id=emgcontact_list    ${name}
    Table Should Contain    id=emgcontact_list    ${home_telephone}