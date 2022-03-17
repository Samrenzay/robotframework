*** Settings ***
Documentation    This suite will handle all the test cases related to valid
...     credential test for orangehrm.Test case -TC_OH_2


Resource         ../Resource/Base/CommonFunctionality.resource
Task Setup        Launch Browser
Test Teardown       Close Browser

*** Test Cases ***
Verify Valid Credential Test
              Input Text      id=txtUsername   Admin
              Input Password     id=txtPassword    admin123
              Click Element       id=btnLogin
              Page Should Contain      My Info

