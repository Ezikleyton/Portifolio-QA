*** Settings ***
Library    SeleniumLibrary
Library    String
*** Variables ***
${URL_AMAZON}          https://www.amazon.com.br/
${BARRA_DE_PESQUISA}   //input[contains(@type,'text')]
${BOTAO_DE_PESQUISA}   //input[contains(@type,'submit')]


*** Keywords ***
Fechar navegador
    Close All Browsers
Dado que estou na página inicial da Amazon
    Open Browser    browser=chrome        
    Go To    ${URL_AMAZON}
    Maximize Browser Window

Quando eu pesquiso por um produto na barra de pesquisa
    Wait Until Element Is Visible    ${BARRA_DE_PESQUISA}
    Set Test Variable    ${produto}    Console Xbox Series S
    Input Text    ${BARRA_DE_PESQUISA}    ${produto}

Quando eu pesquiso por um produto que não existe na barra de pesquisa
    Wait Until Element Is Visible    ${BARRA_DE_PESQUISA}
    ${produto_aleatorio}  Generate Random String    length=8    chars=[LETTERS]
    Set Test Variable    ${produto_aleatorio}    
    Input Text    ${BARRA_DE_PESQUISA}    ${produto_aleatorio}

E clico no botão de pesquisa
    Click Element    ${BOTAO_DE_PESQUISA}

Então a página de resultados deve exibir os produtos relacionados à pesquisa realizada
    Wait Until Element Is Visible    locator=(//h2[contains(.,'${produto}')])[1]
    Page Should Contain Element    locator=(//h2[contains(.,'${produto}')])[1]

Selecionar Departamento
    [Arguments]    ${departamento}
    Click Element    xpath=//span[text()="${departamento}"]

Então a página de resultados deve exibir apenas ${produto} da categoria selecionada que correspondam à pesquisa realizada
    Page Should Contain    ${produto}
    Page Should Not Contain    Outros produtos

Então a página de resultados deve uma mensagem de erro
    Sleep    time_=5
    Page Should Contain    text=Nenhum resultado para
    