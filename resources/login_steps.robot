*** Settings ***
Library     SeleniumLibrary

*** Variables ***
${DEFAULT_URL}      http://ninjaplus-web:5000/login
${BROWSER}          chrome
${EmailID}          id:emailId


*** Keywords ***

#### Setup e TearDown
Abrir navegador
    Open Browser        ${DEFAULT_URL}     ${BROWSER}
    Set Selenium Implicit Wait  10
    #o comando acima não é que o sistema "dorme" por 10 segudos, igual é com o comando sleep, no caso acima quando o elemento for carregado ele já segue a vida.
    Maximize Browser Window

Fechar navegador
    Close Browser


#### Steps
Fazendo login com "${email}" e senha "${pass}"         
    Input Text          ${EmailID}                          ${email}
    Input Text          id:passId                           ${pass}
    Click Button        id:login
    
Devo ver o meu nome "${username}" na área logada
    # Page Should Contain                 ${username}
    # da forma acima está validando da página toda e com isso pode gerar um falso positivo, se na página tiver outra informação com o mesmo nome, vamos validar pelo elemento
    Wait Until Element Contains     css:.user .info span        ${username}        

Devo ver o alerta "${messageAlert}"
    # Page Should Contains                 ${messageAlert} para funcionar dessa forma, eu precisaria do sleep.
    Wait Until Element Contains      css:.alert      ${messageAlert}
    # o . significa que vai buscar por class e o alert é nome da class

Logando com credencias inválidas devo ver uma mensagem de alerta
    [Arguments]                         ${email}        ${pass}         ${messageAlert}
    Input Text                          ${EmailID}                          ${email}
    Input Text                          id:passId                           ${pass}
    Click Button                        id:login
    Wait Until Element Contains         css:.alert span                          ${messageAlert}
    
Logando sem os campos requeridos devo ver uma mensagem de alerta
    [Arguments]                         ${email}        ${pass}         ${messageAlert}
    Input Text                          ${EmailID}                          ${email}
    Input Text                          id:passId                           ${pass}
    Click Button                        id:login
    Wait Until Element Contains         css:.alert span                         ${messageAlert}