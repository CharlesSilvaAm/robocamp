*** Settings ***
Library   Browser

*** Keywords ***
Go To Login Page
    New Browser   headless=False    browser=chromium
    New Page      http://localhost:3000/

Fill Credentials
    [Arguments]    ${email}    ${password}
    Fill Text     css=input[name=email]       ${email}
    Fill Text     css=input[name=password]    ${password}

Submit Credentials
    Click         css=button >> text=Entrar no sistema

Field Type Should Be Email
    [Arguments]        ${user_email}

    Get Attribute       css=input[placeholder="Seu e-mail"]     type   equal     ${user_email}

Alert Text Should Be
    [Arguments]   ${field}    ${expected_text}

    Get Text         xpath=//input[@type="${field}"]/..//span
    ...              equal    ${expected_text}

