*** Settings ***
Documentation  This is some basic info about the whole suite
#Library  Selenium2Library
Library  SeleniumLibrary

# Copy/paste the line below into Terminal to execute:
# robot -d results tests/dic.robot

*** Variables ***
${ENVIRONMENT} =  prod
${BROWSER} =  chrome
&{URL}  dev=http://dev.amazon.com  prod=http://www.amazon.com

*** Test Cases ***
User must sign in to check out
    [Documentation]  This is some basic info about the test
    [Tags]  Smoke  Regression
    Open Browser  ${URL.${ENVIRONMENT}}  ${BROWSER}
    sleep  4
    Wait Until Page Contains  Your Amazon.com
    Input Text  id=twotabsearchtextbox  Ferrari 458
    Click Button  xpath=//*[@id="nav-search"]/form/div[2]/div/input
    Wait Until Page Contains  results for "Ferrari 458"
    Click Link  css=#result_0 a.s-access-detail-page
    Wait Until Page Contains  Back to search results
    Click Button  id=add-to-cart-button
    Wait Until Page Contains  Added to Cart
    Click Link  id=hlb-ptc-btn-native
    Page Should Contain Element  ap_signin1a_pagelet_title
    Element Text Should Be  ap_signin1a_pagelet_title  Sign In
    Close Browser

Feature 2

*** Keywords ***
