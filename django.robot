*** Settings ***
Library        SeleniumLibrary
Library        FakerLibrary
Documentation  Test written in KDD style with FakerLibrary. The user can authenticate to the application


*** Variables ***
${URL}          https://simpletestblog.herokuapp.com/
${BROWSER}      chrome

*** Test Cases ***
As a user I'd liked to signup to the application
    [Setup]  Setup browser
    Signup button is clicked
    Signup form is displayed
    User data are filled
    Create button is clicked
    My account option is available
    [Teardown]  User Log out

*** Keywords ***
Data generator
    ${username}     User Name
    ${email}        Email
    ${password}     Password  length=10

    set test variable  ${username}
    set test variable  ${email}
    set test variable  ${password}

Setup browser
    Open browser  ${URL}           ${BROWSER}
    Title Should Be                Django Boards

Signup button is clicked
    Click element                  class=btn-primary

Signup form is displayed
    Page should contain element    xpath=//*[text()='Sign up']

User data are filled
    Data generator
    Input Text	                   name=username	       ${username}
    Input Text                     id=id_email             ${email}
    Input Text                     id=id_password1         ${password}
    Input Text                     id=id_password2         ${password}

Create button is clicked
    Click element                  css=.btn

My account option is available
    Click element                  id=userMenu
    Page should contain element	   xpath=//*[text()='My account']
    Click element                  id=userMenu

User Log out
    Click element                  id=userMenu
    Click element                  xpath=//*[text()='Log out']
    Close Browser