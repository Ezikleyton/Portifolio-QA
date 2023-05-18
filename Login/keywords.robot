*** Settings ***
Library    SeleniumLibrary
*** Variables ***

#Variaveis de URL
${URL_LOGIN}    https://www.amazon.com.br/ap/signin?openid.pape.max_auth_age=0&openid.return_to=https%3A%2F%2Fwww.amazon.com.br%2Fs%3Fk%3Damaozn%26adgrpid%3D107062859646%26hvadid%3D595851860839%26hvdev%3Dc%26hvlocphy%3D1031647%26hvnetw%3Dg%26hvqmt%3De%26hvrand%3D2812429037799619114%26hvtargid%3Dkwd-141123430%26hydadcr%3D5661_13215724%26tag%3Dhydrbrgk-20%26ref%3Dnav_ya_signin&openid.identity=http%3A%2F%2Fspecs.openid.net%2Fauth%2F2.0%2Fidentifier_select&openid.assoc_handle=brflex&openid.mode=checkid_setup&openid.claimed_id=http%3A%2F%2Fspecs.openid.net%2Fauth%2F2.0%2Fidentifier_select&openid.ns=http%3A%2F%2Fspecs.openid.net%2Fauth%2F2.0&
${URL_AMAZON}    https://www.amazon.com.br/
#VARIAVEIS DO LOGIN
${EMAIL_LOGIN}    //input[@type='email'][contains(@id,'email')]
${CONTINUAR_LOGIN}    //*[@id="continue"]
${BOTAO_FAZER_LOGIN}    //input[contains(@tabindex,'3')]
${BOTAO_ESQUECI_SENHA}    //a[@class='a-link-normal'][contains(.,'Esqueci a senha')]
${CAMPO_SENHA}    //input[@type='password'][contains(@id,'password')]
#VARIAVEIS DE CRIAÇÃO DE CONTA
${BOTAO_CRIAR_CONTA}    //a[contains(@class,'a-button-text')]
${INPUT_NOME}    //input[@type='text'][contains(@id,'name')]
${INPUT_EMAIL}    //input[@type='email'][contains(@id,'email')]
${INPUT_SENHA}    //input[contains(@placeholder,'Pelo menos 6 caracteres')]        
${INPUT_CHECK_SENHA}    //input[@type='password'][contains(@id,'check')]  
${BOTAO_VERIFICAR_EMAIL}      //input[contains(@tabindex,'8')]

*** Keywords ***
Dado que estou na página de login
    Open Browser    browser=chrome
    Maximize Browser Window
    Go To    ${URL_LOGIN}   

Quando insiro um e-mail válido    
    Wait Until Page Contains Element    locator=${EMAIL_LOGIN}
    Input Text    locator=${EMAIL_LOGIN}    text=teste@robot.com
E insiro uma senha válida
    Wait Until Element Is Visible    locator=${CAMPO_SENHA}
    Input Password    locator=${CAMPO_SENHA}    password=123456789

E clico no botão de continuar
    Wait Until Element Is Visible    locator=${CONTINUAR_LOGIN}
    Click Element    locator=${CONTINUAR_LOGIN}
E clico no botão de login    
    Wait Until Element Is Visible    locator=${BOTAO_FAZER_LOGIN}
    Click Element    locator=${BOTAO_FAZER_LOGIN}
Então o site deve ter o usuário logado
    Sleep    time_=1 
    Element Should Contain    locator=//*[@id="nav-link-accountList-nav-line-1"]    expected=Olá, USUARIO  

E clico na opção de esquecer a senha    
    Wait Until Element Is Visible    locator=${BOTAO_ESQUECI_SENHA}
    Click Element    locator=${BOTAO_ESQUECI_SENHA}

Então a página deve exibir a opção de trocar a senha 
    Sleep    time_=2 
    Page Should Contain    text=Auxílio de senha

Dado que estou na página de criação de conta da Amazon
    Dado que estou na página de login
    Wait Until Element Is Visible    locator=${BOTAO_CRIAR_CONTA}
    Click Element    locator=${BOTAO_CRIAR_CONTA}

Quando preencho todos os campos com dados válidos
    Input Text    locator=${INPUT_NOME}    text= robot  
    Input Text    locator=${INPUT_EMAIL}   text=teste@robot.com  
    Input Text    locator=${INPUT_SENHA}    text=123456789  
    Input Text    locator=${INPUT_CHECK_SENHA}    text=123456789 
    
E clico no botão de verificar email
    Click Element    locator=${BOTAO_VERIFICAR_EMAIL}
Então o site deve criar a conta com sucesso    
    
Quando preencho todos os campos com dados já cadastrados
    Input Text    locator=${INPUT_NOME}    text=robot  
    Input Text    locator=${INPUT_EMAIL}   text=teste@teste.com  
    Input Text    locator=${INPUT_SENHA}    text=123456789  
    Input Text    locator=${INPUT_CHECK_SENHA}    text=123456789 

Quando insiro um e-mail inválido
    Input Text    locator=${EMAIL_LOGIN}    text=aaaaaaaaaaaaaaaa    

Então o site deve exibir uma mensagem de erro "${mensagem_erro}" 
    Sleep    time_=2
    Page Should Contain    text=${mensagem_erro}

E preencho o campo de senha incorretamente   

Então o site deve exibir uma mensagem de erro indicando que a senha está incorreta
   
E preencho o campo de senha com senhas diferentes
    
Então o site deve exibir uma mensagem de erro indicando que as senhas são diferentes

    
#Alert Should Be Present    Insira seu nome       
#Alert Should Be Present    Digite seu e-mail ou número de telefone celular
#Alert Should Be Present    Mínimo de 6 caracteres necessários
#Alert Should Be Present    As senhas não são iguais