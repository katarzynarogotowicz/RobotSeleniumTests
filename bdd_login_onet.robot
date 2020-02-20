*** Settings ***
Library               Selenium2Library
Documentation         Test written in BDD style. Test to verify logins in onet website.

*** Variables ***
${LOGIN URL}          http://www.poczta.onet.pl/
${BROWSER}            Chrome
@{list} =             Niepoprawny e-mail lub hasło.   Wprowadź poprawne dane.

*** Test Cases ***
Valid Login
    When Open Browser on Onet page
    Given Sign in Properly
    Then Assert Onet Mail
    [Teardown]    Close Browser

Invalid Login
    When Open Browser on Onet page
    Given Sign in incorrectly
    Then Assert invalid
    [Teardown]    Close Browser

*** Keywords ***
Open Browser on Onet page
    Open browser                   ${LOGIN URL}                 ${BROWSER}
    Title Should Be                Poczta Onet – zaloguj się
    Wait until element is visible  css=button.cmp-button_button.cmp-intro_acceptAll
    Click Element                  css=button.cmp-button_button.cmp-intro_acceptAll

Sign in Properly
    Input Text	                   id=mailFormLogin	            moje.prawidlowe.dane@onet.pl
    Input Text                     id=mailFormPassword          Tojestjakieshaslo1
    Click element                  css=.loginButton:nth-child(3)

Assert Onet Mail
    Page should contain element    id=NewMail-button

Sign in incorrectly
    Input Text	                   id=mailFormLogin             blednylogin@onet.pl
    Input Text                     id=mailFormPassword          blednehaslo1
    Click element                  css=.loginButton:nth-child(3)

Assert invalid
    Wait until element is visible   class=messageContent
    Get text                        class=messageContent
    Should Contain Any	            ${list}