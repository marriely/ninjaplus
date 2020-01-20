*** Settings ***
Library     SeleniumLibrary

*** Variables ***
${DEFAULT_URL}      http://ninjaplus-web:5000/login
${BROWSER}          chrome
${INPUT_EMAIL}      css:input[name=email]
${INPUT_PASS}       css:input[name=password]
${BUTTON_SUBMIT}    id:login
${DIV_ALERT}        css:.alert
${SPAN_USER}        css:.user .info span
#teste


*** Keywords ***

#### Setup e TearDown
Abrir navegador
    Open Browser        ${DEFAULT_URL}     ${BROWSER}
    Set Selenium Implicit Wait  10
    #o comando acima não é que o sistema "dorme" por 10 segudos, igual é com o comando sleep, no caso acima quando o elemento for carregado ele já segue a vida.
    Maximize Browser Window
    

Fechar navegador
    Close Browser

App deve estar no ar
    Title Should Be     Ninja+


#### Steps
Fazendo login com "${email}" e senha "${pass}"         
    Input Text          ${INPUT_EMAIL}                        ${email}
    Input Text          ${INPUT_PASS}                         ${pass}
    Click Button        ${BUTTON_SUBMIT}
    
Devo ver o meu nome "${username}" na área logada
    # Page Should Contain                 ${username}
    # da forma acima está validando da página toda e com isso pode gerar um falso positivo, se na página tiver outra informação com o mesmo nome, vamos validar pelo elemento
    Wait Until Element Contains     ${SPAN_USER}        ${username}        

Logando com credencias inválidas devo ver uma mensagem de alerta
    [Arguments]                         ${email}        ${pass}         ${messageAlert}

    Input Text                          ${INPUT_EMAIL}                  ${email}
    Input Text                          ${INPUT_PASS}                   ${pass}
    Click Button                        ${BUTTON_SUBMIT}
    Wait Until Element Contains         ${DIV_ALERT}                    ${messageAlert}
    
