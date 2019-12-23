*** Settings ***
Resource          ./login_resource.robot
Documentation     Test written for login test resourse. Test to verify valid logins in onet and wp website.

*** Variables ***
${onet URL}          http://www.poczta.onet.pl/
${wp URL}            http://profil.wp.pl
${onet name}         id=mailFormLogin
${wp name}           id=login
${onet password}     id=mailFormPassword
${wp password}       id=password
${onet button}       css=.loginButton:nth-child(3)
${wp button}         id=btnSubmit
${onet mail}         id=NewMail-button
${wp mail}           class=topbar__tabs

*** Test Cases ***
Valid Login onet
    Open main page                  ${onet URL}         Poczta Onet – zaloguj się
    Rodo
    Input Username                  ${onet name}        moje.prawidlowe.dane@onet.pl
    Input password                  ${onet password}    Tojestjakieshaslo1
    Login button                    ${onet button}
    Assert Mail                     ${onet mail}
    [Teardown]    Close Browser

Valid Login wp
    Open main page                  ${wp URL}           Poczta - Najlepsza Poczta, największe załączniki - WP
    Rodo
    Input Username                  ${wp name}          danetestowerobot@wp.pl
    Input password                  ${wp password}      TojesthaslodoWP
    Login button                    ${wp button}
    Wait Until Element Is Visible   ${wp mail}          timeout=5s
    Assert Mail                     ${wp mail}
    [Teardown]    Close Browser