*** Settings ***
Library        Selenium2Library
Documentation  Test written in DDD style. Test with several sets of arguments and used list.

*** Variables ***
${LOGIN URL}          http://www.poczta.onet.pl/
${BROWSER}            Chrome
@{data1} =            moje.prawidlowe.dane@onet.pl   Tojestjakieshaslo1    Niepoprawny e-mail lub hasło

*** Test Cases ***
Test Login
    [Template]   Test Login
    @{data}

*** Keywords ***
Test Login
    [Arguments]    ${login}   ${password}  ${list}
    Open browser                   ${LOGIN URL}          ${BROWSER}
    Title Should Be                Poczta Onet – zaloguj się
    Wait until element is visible  css=button.cmp-button_button.cmp-intro_acceptAll
    Click Element                  css=button.cmp-button_button.cmp-intro_acceptAll
    Input Text	                   id=mailFormLogin	     ${login}
    Input Text                     id=mailFormPassword   ${password}
    Click element                  css=.loginButton:nth-child(3)
    Should Contain                 ${list}
    [Teardown]    Close Browser
