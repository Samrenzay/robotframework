*** Settings ***
Documentation    This suite will handle all the test cases related to valid
...     credential test for orangehrm.Test case -TC_OH_3


Resource         ../Resource/Base/CommonFunctionality.resource
Test Teardown       Close Browser

*** Test Cases ***
Verify Valid Credential Test
              Launch Browser
              Input Text      id=txtUsername   sam
              Input Password     id=txtPassword    pass123
              Click Element       id=btnLogin


