*** Settings ***
Resource            ../resources/page-objects/keywords/login_page.robot
Resource            ../resources/page-objects/keywords/products_page.robot

Test Setup          login_page.Open Browser To Login Page
Test Teardown       Close Browser

Name                Login Tests


*** Test Cases ***
Valid Login
    [Documentation]    Valid Login
    [Tags]    functional
    login_page.Input Username    ${USER_001}
    login_page.Input Password    ${PASSWORD_COMMON}
    login_page.Submit Credentials
    products_page.Products Page Should Be Open And Title Should Be    Swag Labs

Empty Username And Password
    [Documentation]    Invalid Login When Username And Password Are Empty
    [Tags]    functional
    login_page.Input Username    ${EMPTY}
    login_page.Input Password    ${EMPTY}
    login_page.Submit Credentials
    login_page.Error Message Should Be    ${LOGIN_ERROR_MSG_001}

Empty Username
    [Documentation]    Invalid Login When Empty Username
    [Tags]    functional
    login_page.Input Username    ${EMPTY}
    login_page.Input Password    ${PASSWORD_COMMON}
    login_page.Submit Credentials
    login_page.Error Message Should Be    ${LOGIN_ERROR_MSG_001}

Empty Password
    [Documentation]    Invalid Login When Empty Password
    [Tags]    functional
    login_page.Input Username    ${USER_001}
    login_page.Input Password    ${EMPTY}
    login_page.Submit Credentials
    login_page.Error Message Should Be    ${LOGIN_ERROR_MSG_002}

Invalid Username
    [Documentation]    Invalid Login When Invalid Username
    [Tags]    functional
    login_page.Input Random Username
    login_page.Input Password    ${PASSWORD_COMMON}
    login_page.Submit Credentials
    login_page.Error Message Should Be    ${LOGIN_ERROR_MSG_003}

Invalid Password
    [Documentation]    Invalid Login When Invalid Password
    [Tags]    functional
    login_page.Input Username    ${USER_001}
    login_page.Input Random Password
    login_page.Submit Credentials
    login_page.Error Message Should Be    ${LOGIN_ERROR_MSG_003}

Invalid Username And Password
    [Documentation]    Invalid Login When Invalid Username And Password
    [Tags]    functional
    login_page.Input Random Username
    login_page.Input Random Password
    login_page.Submit Credentials
    login_page.Error Message Should Be    ${LOGIN_ERROR_MSG_003}

Locked Account
    [Documentation]    Invalid Login When Current User Has Been Locked
    [Tags]    functional
    login_page.Input Username    ${USER_002}
    login_page.Input Password    ${PASSWORD_COMMON}
    login_page.Submit Credentials
    login_page.Error Message Should Be    ${LOGIN_ERROR_MSG_004}
