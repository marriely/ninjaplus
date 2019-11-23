*** Settings ***
Documentation   O usuário tenta realizar login sem os campos requeridos e é notificado com uma mensagem de alerta
Resource        ../resources/login_steps.robot
Test Template   Logando sem os campos requeridos devo ver uma mensagem de alerta

Test Setup          Abrir navegador
Test Teardown       Fechar navegador


*** Test Cases ***
Senha requerida         marry@teste.com           ${EMPTY}        Opps. Cadê a senha
Email requerido         ${EMPTY}                  teste123        Opps. Cadê o email          



