*** Settings ***
Documentation   O usuário informa suas credencias de acesso e vai para área logada
Resource        ../resources/login_steps.robot

Test Setup          Abrir navegador
Test Teardown       Fechar navegador


*** Test Cases ***
Login com sucesso
    Fazendo login com "marry@teste.com" e senha "teste123"
    Devo ver o meu nome "Marry" na área logada


#teste
