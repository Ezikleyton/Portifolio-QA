*** Settings ***
Library    SeleniumLibrary
Resource    keywords.robot
Test Teardown    Close All Browsers


*** Test Cases ***
Teste case 1: Pesquisar por produtos na Amazon
    [Documentation]  Realiza uma pesquisa por produtos na Amazon e verifica os resultados.
    Dado que estou na página inicial da Amazon
    Quando digito um termo de pesquisa na barra de pesquisa
    E clico no botão de pesquisa
    Então a página de resultados deve exibir os produtos relacionados à pesquisa realizada

Teste case 2: Pesquisar por produtos que não existem na Amazon
    [Documentation]  Tenta pesquisar por produtos que não existem e verifica a mensagem de erro.
    Dado que estou na página inicial da Amazon
    Quando eu pesquiso por um produto que não existe na barra de pesquisa
    E clico no botão de pesquisa
    Então a página de resultados deve uma mensagem de erro 

Teste case 3: Sugestões automáticas durante a pesquisa
    [Documentation]  Verifica a exibição de sugestões automáticas durante a pesquisa.
    Dado que estou na página inicial da Amazon
    Quando começo a digitar um termo de pesquisa parcial na barra de pesquisa
    Então devo ver uma lista de sugestões automáticas relacionadas ao termo de pesquisa parcialmente digitado




    
    

