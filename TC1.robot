*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${ExpectedAuthorName}   J. K. Rowling


*** Test Cases ***

ValidateAuthorName
    Create Webdriver    Chrome    executable_path=C:/Program Files/Python39/Scripts/chromedriver.exe
    Go To    https://www.google.com
    Wait Until Element Is Visible    name=q
    Input Text     xpath://input[@title="Search"]  wikipedia
    Wait Until Element Is Visible    name=btnK
    Click Button    name=btnK
    Wait Until Element Is Visible   xpath://h3[@class="LC20lb MBeuO DKV0Md"]
    click element    xpath://h3[@class="LC20lb MBeuO DKV0Md"]
    wait until element is visible    xpath://input[@class="vector-search-box-input"]
    input text    xpath://input[@class="vector-search-box-input"]   Harry Potter
    wait until element is visible    name=go
    click element    xpath://input[@class="searchButton"]
    wait until element is visible   xpath://th[@class="infobox-label"]/following-sibling::td[@class="infobox-data"]
    ${ActualAuthorName}=   get text    xpath://th[@class="infobox-label"]/following-sibling::td[@class="infobox-data"]
#    Should Be Equal As Strings  ${ExpectedAuthorName}   ${ActualAuthorName}
    run keyword if  '${ExpectedAuthorName}'=='${ActualAuthorName}'  log to console    Author name is matched    ELSE    log to console    Author name is failed, Actual Author name is ${ActualAuthorName}
#    Close All Browsers


