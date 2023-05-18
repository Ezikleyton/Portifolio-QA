*** Settings ***
Library    SeleniumLibrary
*** Variables ***
${URL_AMAZON}          https://www.amazon.com.br/
${BARRA_DE_PESQUISA}   //input[contains(@type,'text')]
${BOTAO_DE_PESQUISA}   //input[contains(@type,'submit')]     
${BOTAO_CARRINHO}    //input[contains(@name,'submit.add-to-cart')]   
${MENU_CARRINHO}    https://www.amazon.com.br/gp/cart/view.html?ref_=nav_cart
${EXCLUIR_DO_CARRINHO}    //input[contains(@value,'Excluir')]        


*** Keywords ***


Dado que estou na página inicial da Amazon
    Open Browser    browser=chrome   
    Maximize Browser Window
    Go To    ${URL_AMAZON}

Quando pesquiso pelo produto "Nome do Produto"
    Wait Until Element Is Visible    ${BARRA_DE_PESQUISA}
    Set Test Variable    ${produto}    Echo Dot (3ª Geração): Smart Speaker com Alexa - Cor Preta  
    Input Text    ${BARRA_DE_PESQUISA}    ${produto}
    Click Button    locator=${BOTAO_DE_PESQUISA}
Então a página de resultados deve exibir os produtos relacionados à pesquisa realizada
    Wait Until Element Is Visible    locator=//span[@class='a-size-base-plus a-color-base a-text-normal'][contains(.,'${produto}')]        
    Page Should Contain Element    locator=//span[@class='a-size-base-plus a-color-base a-text-normal'][contains(.,'${produto}')]
         
E adiciono o produto ao carrinho    
    Click Element    locator=//span[@class='a-size-base-plus a-color-base a-text-normal'][contains(.,'${produto}')]
    Wait Until Element Is Visible    locator=${BOTAO_CARRINHO}
    Click Element    locator=${BOTAO_CARRINHO}
    
Então o produto é adicionado ao carrinho com sucesso
    Page Should Contain Element    locator=//span[@class='a-size-medium-plus a-color-base sw-atc-text a-text-bold'][contains(.,'Adicionado ao carrinho')]

Dado que adicionei um produto ao carrinho
    Dado que estou na página inicial da Amazon
    Quando pesquiso pelo produto "Nome do Produto"
    Então a página de resultados deve exibir os produtos relacionados à pesquisa realizada
    E adiciono o produto ao carrinho    
    
E que estou na página do carrinho
    Click Element    locator=//*[@id="sw-gtc"]/span/a
Quando removo o produto 
    Sleep    time_=1
    Click Element    locator=${EXCLUIR_DO_CARRINHO}

Então o carrinho deve ficar vazio
    Wait Until Page Contains    text=Seu carrinho de compras da Amazon está vazio.    
    Page Should Contain    text=Seu carrinho de compras da Amazon está vazio.
    Page Should Contain Element    locator=//h1[contains(.,'Seu carrinho de compras da Amazon está vazio.')]

Quando altero a quantidade de produtos para "${quantidade}"
    Wait Until Page Contains Element    locator=//span[@class='a-button-text a-declarative'][contains(.,'Qtd:1')]
    Click Element    locator=//span[@class='a-button-text a-declarative'][contains(.,'Qtd:1')]
    Sleep    time_=1
    Click Element    locator=id:quantity_${quantidade}
    
Entao a pagina deve exibir o total de "${quantidade}" itens
    Wait Until Element Contains    locator=//span[contains(@id,'sc-subtotal-label-activecart')]    text=${quantidade} itens
    
    