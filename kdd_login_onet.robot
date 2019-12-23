*** Settings ***
Library           Selenium2Library
Documentation     Test written in KDD style. Test to verify valid and invalid logins in onet website.

*** Variables ***
${LOGIN URL}    http://www.poczta.onet.pl/
${BROWSER}      Chrome

*** Test Cases ***
Valid Login
    Open main page
    Rodo
    Input Username
    Input Password
    Login button
    Assert Onet Mail
    [Teardown]    Close Browser

Invalid Login
    Open main page
    Rodo
    Input invalid login
    Input invalid password
    Login button
    Assert invalid
    [Teardown]  Close Browser

*** Keywords ***
Open main page
    Open browser                    ${LOGIN URL}          ${BROWSER}
    Title Should Be                 Poczta Onet – zaloguj się

Rodo
    Wait until element is visible   css=button.cmp-button_button.cmp-intro_acceptAll
    Click Element                   css=button.cmp-button_button.cmp-intro_acceptAll

Input Username
    Input Text	                    id=mailFormLogin	  moje.prawidlowe.dane@onet.pl

Input password
    Input Text                      id=mailFormPassword   Tojestjakieshaslo1

Login button
    Click element                   css=.loginButton:nth-child(3)

Assert Onet Mail
    Page should contain element     id=NewMail-button

Input invalid login
    Input Text	                    id=mailFormLogin      blednylogin@onet.pl

Input invalid password
    Input Text                      id=mailFormPassword   blednehaslo1

Assert invalid
    Wait until element is visible   class=messageContent
    ${list}  Get text               class=messageContent
    Should Contain Any	  ${list}   Niepoprawny e-mail lub hasło.   Wprowadź poprawne dane.