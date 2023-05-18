*** Settings ***
Library    SeleniumLibrary
Resource    keywords.robot


*** Test Cases ***
#Campos de login são otimos para execução de varios cenarios, porem a Amazon requer codigos de verificação, sendo assim iviaveis a realização alguns testes e alguns não foram realizados em sua totalidade.

TC-01 - Testar Login com Sucesso
    [Documentation]  Testar o processo de login com sucesso
    Dado que estou na página de login
    Quando insiro um e-mail válido
    E clico no botão de continuar
    E insiro uma senha válida
    E clico no botão de login
    Então o site deve ter o usuário logado     

TC-02 - Testar Erro de E-mail Inválido
    [Documentation]  Testar a exibição de mensagem de erro para e-mail inválido
    Dado que estou na página de login
    Quando insiro um e-mail inválido
    E clico no botão de continuar
    Então o site deve exibir uma mensagem de erro "Não encontramos uma conta associada a este endereço de e-mail"

TC-03 - Testar Redefinir Senha
    [Documentation]  Testar a opção de redefinir senha
    Dado que estou na página de login
    Quando insiro um e-mail válido 
    E clico no botão de continuar
    E clico na opção de esquecer a senha
    Então a página deve exibir a opção de trocar a senha

TC-04 - Testar Criação de Conta com Sucesso
    [Documentation]  Testar o processo de criação de conta com sucesso
    Dado que estou na página de criação de conta da Amazon
    Quando preencho todos os campos com dados válidos
    E clico no botão de verificar email
    Então o site deve criar a conta com sucesso
TC-05 - Testar Erro de Dados Duplicados
    [Documentation]  Testar a exibição de mensagem de erro para dados já cadastrados
    Dado que estou na página de criação de conta da Amazon
    Quando preencho todos os campos com dados já cadastrados
    E clico no botão de verificar email
    Então o site deve exibir uma mensagem de erro "".   

TC-06 - Testar Validação de Senha Incorreta
    [Documentation]  Testar a validação de senha incorreta
    Dado que estou na página de criação de conta da Amazon
    Quando preencho todos os campos com dados válidos
    E preencho o campo de senha incorretamente
    E clico no botão de verificar email
    Então o site deve exibir uma mensagem de erro "".

TC-07 - Testar Validação de Senhas Diferentes
    [Documentation]  Testar a validação de senhas diferentes
    Dado que estou na página de criação de conta da Amazon
    Quando preencho todos os campos com dados válidos
    E preencho o campo de senha com senhas diferentes
    E clico no botão de verificar email
    Então o site deve exibir uma mensagem de erro indicando que as senhas são diferentes
