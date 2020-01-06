*** Settings ***
Library        Selenium2Library
Documentation  Check simple math.

*** Variables ***
${number1}   2
${number2}   3

*** Test Cases ***
Test1
  Check Addition Numbers     ${number1}  ${number2}   5

Test2
  [Template]  Check Addition Numbers
  4  4  8
  7  3  9

Test3
  Check Subtraction Numbers  ${number1}  ${number2}   1

Test4
  [Template]  Check Subtraction Numbers
  4  4  8
  3  7  4

*** Keywords ***
Check Addition Numbers
  [Arguments]   ${num1}  ${num2}  ${expected}
  ${result}=    EVALUATE  ${num1} +  ${num2}
  ${expected}=  Convert to integer   ${expected}
  ${result}     Convert to integer   ${result}
  Should be equal                    ${result}   ${expected}   msg = kr

Check Subtraction Numbers
  [Arguments]   ${num1}  ${num2}  ${expected}
  ${result}=    EVALUATE  ${num2} -  ${num1}
  ${expected}=  Convert to integer   ${expected}
  ${result}     Convert to integer   ${result}
  Should be equal                    ${result}   ${expected}   msg = kr
