*** Settings ***
Library  Selenium2Library
Documentation     There is resourse for login_test_for_res.robot. Test to verify valid logins in onet and wp website.

*** Variables ***

*** Keywords ***
Open main page
    [Arguments]        ${login url}   ${title}
    Open browser       ${login url}   gc
    Title Should Be    ${title}

Rodo
    Wait Until Element Is Visible  css=button.cmp-button_button.cmp-intro_acceptAll
    Click Element                  css=button.cmp-button_button.cmp-intro_acceptAll

Input Username
    [Arguments]   ${username}   ${dane}
    Input Text	  ${username}   ${dane}

Input password
    [Arguments]   ${password}   ${pass}
    Input Text    ${password}   ${pass}

Login button
    [Arguments]    ${button}
    Click Element  ${button}

Assert Mail
    [Arguments]                  ${mail}
    Page Should Contain Element  ${mail}