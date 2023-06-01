*** Settings ***
Library    SeleniumLibrary
Resource    keywords.robot
Suite Teardown    Fechar navegador

*** Test Cases ***
Teste case 1: Pesquisar por produtos na Amazon
    Dado que estou na página inicial da Amazon
    Quando digito um termo de pesquisa na barra de pesquisa
    E clico no botão de pesquisa
    Então a página de resultados deve exibir os produtos relacionados à pesquisa realizada

Teste case 2: Pesquisar por produtos na Amazon
    Dado que estou na página inicial da Amazon
    Quando eu pesquiso por um produto que não existe na barra de pesquisa
    E clico no botão de pesquisa
    Então a página de resultados deve uma mensagem de erro

Teste case 3: Sugestões automáticas durante a pesquisa
    Dado que estou na página inicial da Amazon
    Quando começo a digitar um termo de pesquisa parcial na barra de pesquisa
    Então devo ver uma lista de sugestões automáticas relacionadas ao termo de pesquisa parcialmente digitado


Teste case 4: Pesquisa por catergoria
    Dado que estou na página inicial da Amazon
    Quando digito um termo de pesquisa na barra de pesquisa
    E utilizo os filtros disponíveis para refinar a pesquisa
    E clico no botão de pesquisa
    Então devo ver resultados filtrados de acordo com os critérios especificados nos filtros

Teste case 5: Pesquisa por codigo do produto
    Dado que estou na página inicial da Amazon
    Quando digito um código de produto válido na barra de pesquisa
    E clico no botão de pesquisa
    Então devo ver o produto correspondente ao código de produto nos resultados da pesquisa



    
    

