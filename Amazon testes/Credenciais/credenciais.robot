*** Settings ***
Library    SeleniumLibrary
Resource    keywords.robot
Test Teardown    Close All Browsers

*** Test Cases ***
#Campos de login são otimos para execução de varios cenarios, porem a Amazon requer codigos de verificação, sendo assim inviaveis a realização alguns testes e alguns não foram realizados em sua totalidade.

TC-01 - Verificar login com Email e senha valida
    [Documentation]  Testar o processo de login com sucesso
    #Nescessario inserir dados validos nas keywords para rodar o teste com sucesso.
    Dado que estou na página de login
    Quando insiro um e-mail válido
    E clico no botão de continuar
    E insiro uma senha válida
    E clico no botão de login
    Então o site deve ter o usuário logado     

TC-02 - Verificar Login com email invalido
    [Documentation]  Testar a exibição de mensagem de erro para e-mail inválido
    Dado que estou na página de login
    Quando insiro um e-mail inválido
    E clico no botão de continuar
    Então o site deve exibir uma mensagem de erro "Não encontramos uma conta associada a este endereço de e-mail"

TC-03 - Verificar a funcionalidade Redefinir Senha
    [Documentation]  Testar a opção de redefinir senha
    Dado que estou na página de login
    Quando insiro um e-mail válido 
    E clico no botão de continuar
    E clico na opção de esquecer a senha
    Então a página deve exibir a opção de trocar a senha

TC-05 - Testar Erro de Dados Duplicados
    [Documentation]  Testar a exibição de mensagem de erro para dados já cadastrados
    Dado que estou na página de criação de conta da Amazon
    Quando preencho todos os campos com dados já cadastrados
    E clico no botão de verificar email
    Então o site deve exibir uma mensagem de erro indicando que "O endereço de e-mail já está sendo utilizado"  

TC-06 - Testar Validação de padrão de Senha Incorreta
    [Documentation]  Testar a validação de senha que contem menos caracteres que o Nescessario
    Dado que estou na página de criação de conta da Amazon
    Quando preencho todos os campos com dados válidos
    E preencho o campo de senha incorretamente
    E clico no botão de verificar email
    Então o site deve exibir uma mensagem de erro indicando que "Mínimo de 6 caracteres necessários"

TC-07 - Testar Validação de Senhas Diferentes
    [Documentation]  Testar a validação de senhas diferentes
    Dado que estou na página de criação de conta da Amazon
    Quando preencho todos os campos com dados válidos
    E preencho o campo de senha com senhas diferentes
    E clico no botão de verificar email
    Então o site deve exibir uma mensagem de erro indicando que "As senhas não são iguais"
