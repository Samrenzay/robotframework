*** Settings ***
Documentation    This suite will handle all the test cases related to invalid
...     credential test for orangehrm.Test case -TC_OH_3


Resource         ../Resource/Base/CommonFunctionality.resource
Test Setup       Launch Browser
Test Teardown       Close Browser

*** Test Cases ***
Verify Invalid Credential Test
              Input Text      id=txtUsername   sam
              Input Password     id=txtPassword    pass123
              Click Element       id=btnLogin
              Element Text Should Be    id=spanMessage    Invalid credentials




