*** Settings ***
Documentation   This suite files handles test case related to membership
Library     DataDriver      file=../test_data/data.xlsx      sheet_name=AddMemberships
Resource    ../Resource/Base/CommonFunctionality.resource
Test Setup  Launch Browser
Test Teardown  Close Browser
Test Template   Verify Add Membership Templ


*** Test Cases ***
TC1

*** Keywords ***
Verify Add Membership Templ
    [Arguments]     ${username}   ${password}    ${membership}    ${paid_by}      ${amount}   ${coin}
    Input Text          id=txtUsername      ${username}
    Input Password      id=txtPassword      ${password}
    Click Element       id=btnLogin
    Click Element       id=menu_pim_viewMyDetails
    Click Element    partial link=Memberships
    Click Element    xpath=//input[@id="btnAddMembershipDetail"]
    Select From List By Label   xpath=//select[@name="membership[membership]"]      ${membership}
    Select From List By Label    xpath=//select[@name="membership[subscriptionPaidBy]"]     ${paid_by}
    Input Text      xpath=//input[@name="membership[subscriptionAmount]"]     ${amount}
    Select From List By Label    xpath=//select[@name="membership[currency]"]       ${coin}
    Click Element    xpath=//input[@name="btnSaveMembership"]

    Table Should Contain    xpath=//form[@id="frmEmpDelMemberships"]      ${membership}
    Table Should Contain    xpath=//form[@id="frmEmpDelMemberships"]      ${paid_by}
    Table Should Contain    xpath=//form[@id="frmEmpDelMemberships"]      ${amount}


