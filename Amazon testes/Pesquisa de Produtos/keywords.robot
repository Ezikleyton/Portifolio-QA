*** Settings ***
Library    SeleniumLibrary
Library    String
Library    XML
*** Variables ***
${URL_AMAZON}          https://www.amazon.com.br/
${BARRA_DE_PESQUISA}   //input[contains(@type,'text')]
${BOTAO_DE_PESQUISA}   //input[contains(@type,'submit')]


*** Keywords ***
Atualizar pagina.
    Reload Page
    Close All Browsers
Dado que estou na página inicial da Amazon
    Open Browser         browser=chrome        
    Go To                ${URL_AMAZON}
    Maximize Browser Window
    ${captcha_encontrado}    Run Keyword And Return Status    Page Should Contain    text=Continuar comprando
    Run Keyword If    ${captcha_encontrado}    Atualizar pagina.

Quando digito um termo de pesquisa na barra de pesquisa
    Wait Until Element Is Visible    ${BARRA_DE_PESQUISA}
    Set Test Variable                ${produto}    Console Xbox Series S
    Input Text    ${BARRA_DE_PESQUISA}    ${produto}

Quando eu pesquiso por um produto que não existe na barra de pesquisa
    Wait Until Element Is Visible    ${BARRA_DE_PESQUISA}
    ${produto_aleatorio}  Generate Random String    length=12    chars=[NUMBERS]
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
    Page Should Contain        text=Nenhum resultado para ${produto_aleatorio}
        
Quando começo a digitar um termo de pesquisa parcial na barra de pesquisa
    Input Text                        locator=${BARRA_DE_PESQUISA}    text=xbox 
    
 Então devo ver uma lista de sugestões automáticas relacionadas ao termo de pesquisa parcialmente digitado
    Wait Until Element Is Visible     locator=//div[contains(@class,'left-pane-results-container')]
    Element Should Contain            locator=//div[contains(@class,'left-pane-results-container')]    expected=xbox series s