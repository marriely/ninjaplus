*** Settings ***
Documentation   Verificar se aplicação está no ar
Resource        ../resources/login_steps.robot

Test Setup          Abrir navegador
Test Teardown       Fechar navegador


*** Test Cases ***
Api is on the Air
    App deve estar no ar
