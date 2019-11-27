*** Settings ***
Documentation   O usuário informa suas credencias inválidas e é notificado com uma mensagem de alerta
Resource        ../resources/login_steps.robot
Test Template   Logando com credencias inválidas devo ver uma mensagem de alerta

Test Setup          Abrir navegador
Test Teardown       Fechar navegador
#teste


*** Test Cases ***
Senha inválida          marry@teste.com         123456          Usuário e/ou senha inválidos
Email inválido          marri123@teste.com      teste123        Usuário e/ou senha inválidos
Senha requerida         marry@teste.com           ${EMPTY}        Opps. Cadê a senha
Email requerido         ${EMPTY}                  teste123        Opps. Cadê o email           



