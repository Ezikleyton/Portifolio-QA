*** Settings ***
Library    SeleniumLibrary
Resource    keywords.robot
Suite Teardown    Fechar navegador

*** Test Cases ***
Teste case 1: Pesquisar por produtos na Amazon
    Dado que estou na página inicial da Amazon
    Quando eu pesquiso por um produto na barra de pesquisa
    E clico no botão de pesquisa
    Então a página de resultados deve exibir os produtos relacionados à pesquisa realizada

Teste case 2: Pesquisar por produtos na Amazon
    Dado que estou na página inicial da Amazon
    Quando eu pesquiso por um produto que não existe na barra de pesquisa
    E clico no botão de pesquisa
    Então a página de resultados deve uma mensagem de erro
    
    

