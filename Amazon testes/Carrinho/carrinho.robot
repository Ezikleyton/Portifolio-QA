*** Settings ***    
Library             SeleniumLibrary
Resource            keywords.robot
Test Setup          Open Browser    browser=chrome   
Test Teardown       Close All Browsers

   

*** Test Cases ***

Teste case 1: Adicionar um produto ao carrinho
    [Documentation]  Testar o processo de adição de itens no carrinho
    Dado que estou na página inicial da Amazon
    Quando pesquiso pelo produto    
    Então a página de resultados deve exibir os produtos relacionados à pesquisa realizada
    E adiciono o produto ao carrinho
    Então o produto é adicionado ao carrinho com sucesso   

Teste case 2: Remover um produto ao carrinho
    [Documentation]  Testar o processo de remoção de itens do carrinho
    Dado que adicionei um produto ao carrinho
    E que estou na página do carrinho
    Quando removo o produto 
    Então o carrinho deve ficar vazio 

Teste case 3:Alterar a quantidade de um produto no carrinho
    [Documentation]  Testar o processo de alteração na quantidade de itens no carrinho
    Dado que adicionei um produto ao carrinho
    E que estou na página do carrinho
    Quando altero a quantidade de produtos para "1"
    Então a pagina deve exibir o total de "1" item

Teste case 4: Validar se a quantidade de produtos é igual a quantidade do subtotal
    [Documentation]  Testar a contagem do iten subtotal no carrinho
    Dado que adicionei um produto ao carrinho 
    E que estou na página do carrinho
    Quando altero a quantidade de produtos para "1"
    Então a pagina deve exibir o subtotal de "1" item