*** Settings ***
Library               Selenium2Library
Documentation         Test written in BDD style. The user can book available flights


*** Variables ***
${URL}                http://blazedemo.com/
${BROWSER}            chrome


*** Test Cases ***
The user can find a flight from Paris to London
    When Open Browser on blazedemo page
    Given Choose your departure and destination city
    Then Find a flight from Paris to London
    [Teardown]    Close Browser


*** Keywords ***
Open Browser on blazedemo page
    Open browser                   ${URL}   ${BROWSER}
    Title Should Be                BlazeDemo

Choose your departure and destination city
    Click Element                  name=fromPort
    List Selection Should Be       name=fromPort   Paris
    Click Element                  name=toPort
    Click Element                  xpath=//select[@name='toPort']/option[text()='London']
    List Selection Should Be       name=toPort     London
    Click Button                   css=.btn-primary

Find a flight from Paris to London
    Click Element                  css=tr:nth-child(1) .btn
    Page should contain element    xpath=//*[text()='Your flight from Paris to London has been reserved.']
    Click Element                  css=.btn-primary
    Page should contain element    xpath=//*[text()='Thank you for your purchase today!']