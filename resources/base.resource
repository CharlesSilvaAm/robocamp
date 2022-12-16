*** Settings ***
Documentation        Tudo começa aqui

Resource             components/navbar.resource
Resource             components/toast.resource
Resource             pages/login.resource
Resource             pages/enrolls.resource

*** Keywords ***
# Helpers
Do Login
    [Arguments]    ${user}

    Go To Login Page
    Fill Credentials    ${user}[email]     ${user}[pass]
    Submit Credentials
    User Should Be Looged In  ${user}[name]