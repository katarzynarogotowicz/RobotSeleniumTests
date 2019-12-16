*** Settings ***
Library  Selenium2Library
Documentation  Test written in DDD style - one test with several sets of arguments.
Test Template  Seleniumtemplate Text

*** Variables ***
${url}           https://en.wikipedia.org
${article1}      Robot Framework
${article2}      William Shakespeare
${find1}         Pekka
${find2}         William

*** Test Cases ***        ARTICLE      BROWSER   FIND
Seleniumtemplate Text1    ${article1}  gc        ${find1}
Seleniumtemplate Text2    ${article2}  gc        ${find2}

*** Keywords ***
Seleniumtemplate Text
  [Arguments]     ${article}    ${browser}     ${find}
  Open Browser             ${url}               ${browser}
  Click Element            id=searchInput
  Input Text               id=searchInput       ${article}
  Click Button             id=searchButton
  Page Should Contain      ${find}
  [Teardown]  Close Browser
