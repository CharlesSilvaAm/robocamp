*** Settings ***
Documentation        Suite de testes de autenticação
...                  Administrador deve acessar o portal de gestão de academias

Resource             ../resources/base.resource

*** Test Cases ***
Deve matricular um aluno
    
    # Falcão
    # Smart
    # 11/10/2022
    ${admin}   Create Dictionary
    ...        name=Admin
    ...        email=admin@smartbit.com
    ...        pass=qacademy

    Do Login   ${admin}

    Go To Enrolls
    Go To Enroll Form
    Select Student    Falcão Não mexer
    Select Plan    Smart
    Fill Start Date