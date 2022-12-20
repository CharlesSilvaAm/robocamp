*** Settings ***
Documentation        Gerenciando a massa de testes atraves do banco de dados
Library            DatabaseLibrary

*** Keywords ***
Connect To Postgres
    Connect To Database      psycopg2
    ...                   	 bmqwnixl
    ...                    	 bmqwnixl
    ...                 	 78M_lRZv2pUm15f3-rd7abFvAJScByHh
    ...                	     babar.db.elephantsql.com
    ...                 	 5432

Select Student Where email
    [Arguments]        ${email}

    ${query}        Set Variable
    ...             SELECT * FROM public.students WHERE email = '${email}';
    ${results}      Query           ${query}

    [return]        ${results}[0]


Delete Enroll By Email
    [Arguments]     ${email}

    ${user}         Select Student Where email    ${email}

    ${query}        Set Variable
    ...             DELETE FROM public.enrollments WHERE student_id = '${user}[0]';

    Execute Sql String    ${query}

Reset Student Enroll
    [Arguments]       ${email}
    Connect To Postgres
    Delete Enroll By Email       ${email}
    Disconnect From Database