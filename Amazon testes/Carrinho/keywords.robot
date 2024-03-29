*** Settings ***
Library    SeleniumLibrary
Library    OperatingSystem
*** Variables ***
${URL_AMAZON}              https://www.amazon.com.br/
${BARRA_DE_PESQUISA}       //input[contains(@type,'text')]
${BOTAO_DE_PESQUISA}       //input[contains(@type,'submit')]     
${BOTAO_CARRINHO}          //input[contains(@name,'submit.add-to-cart')]   
${MENU_CARRINHO}           https://www.amazon.com.br/gp/cart/view.html?ref_=nav_cart
${EXCLUIR_DO_CARRINHO}     //input[contains(@value,'Excluir')]  
${PRODUTO}                 Xbox 


*** Keywords ***

Atualizar pagina.
    Reload Page


Dado que estou na página inicial da Amazon 
    Maximize Browser Window
    Go To                               ${URL_AMAZON}
    ${captcha_encontrado}    Run Keyword And Return Status    Page Should Contain    text=Continuar comprando
    Run Keyword If    ${captcha_encontrado}    Atualizar pagina.
   

Quando pesquiso pelo produto
    Wait Until Element Is Visible       ${BARRA_DE_PESQUISA}  
    Input Text                          ${BARRA_DE_PESQUISA}    ${produto}
    Click Button                        locator=${BOTAO_DE_PESQUISA}
Então a página de resultados deve exibir os produtos relacionados à pesquisa realizada
    Wait Until Element Is Visible       locator=//span[@class='a-size-base-plus a-color-base a-text-normal'][contains(.,'${produto}')]        
    Page Should Contain Element         locator=//span[@class='a-size-base-plus a-color-base a-text-normal'][contains(.,'${produto}')]
    
E adiciono o produto ao carrinho    
    Click Element                        locator=//span[@class='a-size-base-plus a-color-base a-text-normal'][contains(.,'${produto}')]
    Wait Until Element Is Visible        locator=${BOTAO_CARRINHO}
    Click Element                        locator=${BOTAO_CARRINHO}
    
Então o produto é adicionado ao carrinho com sucesso
    Page Should Contain Element          locator=//span[@class='a-size-medium-plus a-color-base sw-atc-text a-text-bold'][contains(.,'Adicionado ao carrinho')]

Dado que adicionei um produto ao carrinho
    Dado que estou na página inicial da Amazon
    Quando pesquiso pelo produto
    Então a página de resultados deve exibir os produtos relacionados à pesquisa realizada
    E adiciono o produto ao carrinho    
    
E que estou na página do carrinho
    Wait Until Element Is Visible        locator=//a[@data-csa-c-type='button']
    Click Element                        locator=//a[@data-csa-c-type='button']
Quando removo o produto 
    Sleep                                time_=1
    Click Element                        locator=${EXCLUIR_DO_CARRINHO}

Então o carrinho deve ficar vazio
    Wait Until Page Contains             text=Seu carrinho de compras da Amazon está vazio.    
    Page Should Contain                  text=Seu carrinho de compras da Amazon está vazio.
    Page Should Contain Element          locator=//h1[contains(.,'Seu carrinho de compras da Amazon está vazio.')]

Quando altero a quantidade de produtos para "${quantidade}"
    Wait Until Page Contains Element     locator=//span[@class='a-button-text a-declarative'][contains(.,'Qtd:1')]
    Click Element                        locator=//span[@class='a-button-text a-declarative'][contains(.,'Qtd:1')]
    Sleep                                time_=1
    Click Element                        locator=id:quantity_${quantidade}
    
Então a pagina deve exibir o total de "${quantidade}" item
    Sleep    time_=3
    Wait Until Element Contains          locator=//span[contains(@class,'a-dropdown-prompt')]    text=${quantidade}
    

Então a pagina deve exibir o subtotal de "${quantidade}" item
    Sleep    time_=3
    Page Should Contain    text=Subtotal (1 item)
    