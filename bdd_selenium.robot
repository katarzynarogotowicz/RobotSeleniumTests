*** Settings ***
Library  Selenium2Library
Documentation         Test written in BDD - Behavior Driven Development (Gherkin Style) style.
...  One test web page.

*** Variables ***
${URL}        https://en.wikipedia.org
${article}    Robot Framework

*** Test Cases ***
Test Selenium
  When        Open Browser on Wikipedia page
  Given       Fill search box with expected phrase
  Then        I would like to see ${article} article
  [Teardown]  Close Browser

*** Keywords ***
Open Browser on Wikipedia page
   Open Browser        ${url}           browser=gc

Fill search box with expected phrase
  Click Element        id=searchInput
  Input Text           id=searchInput   Robot Framework
  Click Button         id=searchButton

I would like to see ${article} article
  Page Should Contain  Pekka