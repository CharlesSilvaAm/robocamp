*** Settings ***
Documentation        Suite de testes de autenticação
...                  Administrador deve acessar o portal de gestão de academias

Resource             ../resources/base.resource

*** Test Cases ***
Deve matricular um aluno
    ${admin}      Get fixture     admin
    ${student}    Get fixture     student

    Reset Student Enroll    ${student}[email]

    Do Login   ${admin}

    Go To Enrolls
    Go To Enroll Form
    Select Student    ${student}[name]
    Select Plan    ${student}[enroll][plan]
    Fill Start Date
    Submmit Enroll Form
    Verify Toaster    Matrícula cadastrada com sucesso