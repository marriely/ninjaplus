*** Settings ***
Documentation   O usuário informa suas credencias inválidas e é notificado com uma mensagem de alerta
Resource        ../resources/login_steps.robot
Test Template   Logando com credencias inválidas devo ver uma mensagem de alerta

Test Setup          Abrir navegador
Test Teardown       Fechar navegador


*** Test Cases ***
Senha inválida          marry@teste.com         123456          Usuário e/ou senha inválidos
Email inválido          marri123@teste.com      teste123        Usuário e/ou senha inválidos          



