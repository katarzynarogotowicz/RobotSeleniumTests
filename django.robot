*** Settings ***
Library        SeleniumLibrary
Library        FakerLibrary
Documentation  Test written in DDD style. The user can authenticate to the application


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
    sleep  5s
Create button is clicked
    Click element                  css=.btn
    sleep  5s
My account option is available
    Click element                  id=userMenu
    Page should contain element	   xpath=//*[text()='My account']
    Click element                  id=userMenu
    #Page should contain element   My account

User Log out
    Click element                  id=userMenu
    Click element                  xpath=//*[text()='Log out']
    Close Browser



#
#Test0 Check if the user is signup to the application
#    [Template]   Test Check SingUp
#    Katte   dJango!1234
#
#Test1 The user can signup to the application
#    [Template]   Test SingUp
#    Kate   katarzyna.rogotowicz@gmail.com   dJango!123
#
#Test2 The user can login to the application
#    [Template]   Test LogIn
#    Kate   dJango!123
#
#Test3 The user log out from the application
#    [Template]   Test LogOut
#    Kate   dJango!123
#
#
#
#Test Check SingUp
#    [Arguments]   ${username}      ${password}
#    Open browser  ${URL}           ${BROWSER}
#    Title Should Be                Django Boards
#    Click Element                  linkText=Log in
#    Input Text	                   id=id_username	       ${username}
#    Input Text                     id=id_password1         ${password}
#    Click element                  css=.btn
#    Page should contain element    Please enter a correct username and password
#    [Teardown]    Close Browser
#
#Test SingUp
#    [Arguments]    ${username}     ${email}     ${password}
#    Open browser   ${URL}          ${BROWSER}
#    Title Should Be                Django Boards
#    Click Element                  linkText=Sign up
#    Input Text	                   id=id_username	       ${username}
#    Input Text                     id=id_email             ${email}
#    Input Text                     id=id_password1         ${password}
#    Input Text                     id=id_password2         ${password}
#    Click element                  css=.btn
#    Click Element                  id=userMenu
#    List Selection Should Be	   id=userMenu   Log out
#    Click element                  linkText=Log out
#    [Teardown]    Close Browser
#
#Test LogIn
#    [Arguments]   ${username}      ${password}
#    Open browser  ${URL}           ${BROWSER}
#    Title Should Be                Django Boards
#    Click Element                  linkText=Log in
#    Input Text	                   id=id_username	       ${username}
#    Input Text                     id=id_password1         ${password}
#    Click element                  css=.btn
#
#Test LogOut
#    [Arguments]   ${username}      ${password}
#    Open browser  ${URL}           ${BROWSER}
#    Title Should Be                Django Boards
#    Click Element                  linkText=Log in
#    Input Text	                   id=id_username	       ${username}
#    Input Text                     id=id_password1         ${password}
#    Click element                  css=.btn
#    Click Element                  id=userMenu
#    List Selection Should Be	   id=userMenu   Log out
#    Click element                  linkText=Log out
#    [Teardown]    Close Browser