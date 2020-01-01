*** Settings ***
Library           Selenium2Library
Documentation     Test to verify valid logins in onet and wp website.

*** Variables ***
${browser}           gc
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
Valid Login Onet
   Test scenario  ${onet URL}        Poczta Onet – zaloguj się       ${onet name}      moje.prawidlowe.dane@onet.pl
   ...            ${onet password}   Tojestjakieshaslo1              ${onet button}    ${onet mail}

Valid Login Wp
    Test scenario  ${wp URL}         Poczta - Najlepsza Poczta, największe załączniki - WP
    ...            ${wp name}        danetestowerobot@wp.pl          ${wp password}    TojesthaslodoWP
    ...            ${wp button}      ${wp mail}

*** Keywords ***
Test scenario
    [Arguments]                     ${url}     ${title}   ${name}   ${name_data}   ${password}   ${password_data}
    ...                             ${button}  ${mail}
    Open main page                  ${url}           ${title}
    Rodo
    Input Username                  ${name}          ${name_data}
    Input password                  ${password}      ${password_data}
    Login button                    ${button}
    Wait Until Element Is Visible   ${mail}          timeout=5s
    Assert Mail                     ${mail}
    [Teardown]    Close Browser

Open main page
    [Arguments]                     ${url}           ${title}
    Open Browser                    ${browser}       ${url}
    Title Should Be                 ${title}

Rodo
    Wait Until Element Is Visible   css=button.cmp-button_button.cmp-intro_acceptAll
    Click Element                   css=button.cmp-button_button.cmp-intro_acceptAll

Input Username
    [Arguments]     ${name}          ${name_data}
    Input Text      ${name}          ${name_data}

Input password
    [Arguments]     ${password}      ${password_data}
    Input Text      ${password}      ${password_data}

Login button
    [Arguments]     ${button}
    Click Element   ${button}

Assert Mail
    [Arguments]                      ${mail}
    Page Should Contain Element      ${mail}

