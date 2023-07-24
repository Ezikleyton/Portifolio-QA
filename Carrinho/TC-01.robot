*** Settings ***    
Library    SeleniumLibrary
Resource    keywords.robot
Test Teardown    Close All Browsers

   

*** Test Cases ***

Teste case 1: Adicionar um produto ao carrinho
    Dado que estou na página inicial da Amazon
    Quando pesquiso pelo produto "Nome do Produto"
    Então a página de resultados deve exibir os produtos relacionados à pesquisa realizada
    E adiciono o produto ao carrinho
    Então o produto é adicionado ao carrinho com sucesso   

Teste case 2: Remover um produto ao carrinho
    Dado que adicionei um produto ao carrinho
    E que estou na página do carrinho
    Quando removo o produto 
    Então o carrinho deve ficar vazio 

Teste case 3:Alterar a quantidade de um produto no carrinho
    Dado que adicionei um produto ao carrinho
    E que estou na página do carrinho
    Quando altero a quantidade de produtos para "4"
    Entao a pagina deve exibir o total de "4" itens