*** Settings ***
Library  Selenium2Library
Documentation  Test written in DDD style - one test with several sets of arguments.

*** Variables ***
${url}        https://en.wikipedia.org
${text1}      Robot Framework
${text2}      William Shakespeare
${find1}      Pekka
${find2}      William

*** Test Cases ***
Seleniumtemplate Text
   [Template]  Seleniumtemplate Text
   ${text1}   gc  ${find1}
   ${text2}   gc  ${find2}

*** Keywords ***
Seleniumtemplate Text
  [Arguments]     ${t1}    ${browser}           ${find}
  Open Browser             ${url}               ${browser}
  Click Element            id=searchInput
  Input Text               id=searchInput       ${t1}
  Click Button             id=searchButton
  Page Should Contain      ${find}
  [Teardown]  Close Browser
