*** Settings ***
Library  Selenium2Library
Documentation  Test written in KDD style - one test web page.

*** Variables ***
${URL}  https://en.wikipedia.org

*** Test Cases ***
Test Selenium
  Open Browser       ${url}  browser=gc
  Click Element              id=searchInput
  Input Text                 id=searchInput  Robot Framework
  Click Button               id=searchButton
  Page Should Contain        Peka
  [Teardown]  Close Browser
