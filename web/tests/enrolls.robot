*** Settings ***
Documentation        Suite de testes de autenticação
...                  Administrador deve acessar o portal de gestão de academias

Resource             ../resources/base.resource

*** Test Cases *** 
Deve matricular um aluno
    ${admin}     Get fixture      admin
    ${falcao}    Get fixture      falcao

    Reset Student    ${falcao}[student][email]

    ${token}    Get Service Token    ${admin}

    POST New Student     ${token}     ${falcao}[student]

    Do Login   ${admin}

    Go To Enrolls
    Go To Enroll Form
    Select Student    ${falcao}[student][name]
    Select Plan       ${falcao}[enroll][plan]
    Fill Start Date
    Submmit Enroll Form
    Verify Toaster    Matrícula cadastrada com sucesso