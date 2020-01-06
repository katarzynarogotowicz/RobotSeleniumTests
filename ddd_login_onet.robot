*** Settings ***
Library        Selenium2Library
Documentation  Test written in DDD style. Test with several sets of arguments.

*** Variables ***
${LOGIN URL}          http://www.poczta.onet.pl/
${BROWSER}            Chrome
@{list} =             Niepoprawny e-mail lub hasło.     Wprowadź poprawne dane.


*** Test Cases ***
Test1 Valid Login
    [Template]   Test Valid Login
    moje.prawidlowe.dane@onet.pl   Tojestjakieshaslo1

Test2 Invalid Login
    [Template]   Test Invalid Login
    blednylogin@onet.pl            blednehaslo1

*** Keywords ***
Test Valid Login
    [Arguments]   ${login}         ${password}
    Open browser  ${LOGIN URL}     ${BROWSER}
    Title Should Be                Poczta Onet – zaloguj się
    Wait until element is visible  css=button.cmp-button_button.cmp-intro_acceptAll
    Click Element                  css=button.cmp-button_button.cmp-intro_acceptAll
    Input Text	                   id=mailFormLogin	            ${login}
    Input Text                     id=mailFormPassword          ${password}
    Click element                  css=.loginButton:nth-child(3)
    Page should contain element    id=NewMail-button
    [Teardown]    Close Browser

Test Invalid Login
    [Arguments]   ${login}         ${password}
    Open browser  ${LOGIN URL}     ${BROWSER}
    Title Should Be                Poczta Onet – zaloguj się
    wait until element is visible  css=button.cmp-button_button.cmp-intro_acceptAll
    Click Element                  css=button.cmp-button_button.cmp-intro_acceptAll
    Input Text	                   id=mailFormLogin             ${login}
    Input Text                     id=mailFormPassword          ${password}
    Click element                  css=.loginButton:nth-child(3)
    Wait until element is visible  class=messageContent
    Get text                       class=messageContent
    Should Contain Any	           ${list}                      Niepoprawny e-mail lub hasło.     Wprowadź poprawne dane.
    [Teardown]    Close Browser
