#Procedimentos básicos de uso do SDK do Google Cloud no Windows 

Os procedimentos aqui descritos foram executados em uma Oracle Virtual Box rodando em um Mac Book Pro com Mac OS Sierra.

O Windows guest é um Windows 2012 r2 Server com o ambiente de desenvolvimento .NET e Visual Studio 2015



## Instruções de acesso a qualquer VM
- Entrar no https://cloud.google.com

- Logar com email corporativo 

- [baixar](https://cloud.google.com/sdk/docs/#install_the_latest_cloud_tools_version_cloudsdk_current_version) o gcloud (vai criar a chave na máquina e resolver a conexão)

  - [Download direto](https://dl.google.com/dl/cloudsdk/channels/rapid/GoogleCloudSDKInstaller.exe)

- Seguir procedimentos de instalação 
  - Intro : Next 
  - EULA : I Agree
  - Single User (your_user) - usa o usuário corrente logado na máquina 
  - Destination Folder : Escolher e Next 
  - Components to Install : Secionar todos (beta também) e Install
    - neste momento o sdk será efetivamente baixado e então instalado, o download algumas vezes é um pouco lento 
  - Google Cloud has been installed : Next 
  - Completing Google Cloud SDK Setup : selecionar os ítens que mais apetecerem, os seguintes são recomendados para continuar o procedimento:
    - Start Google Cloud SDK Shell 
    - Run `gcloud init` to configure the Cloud Shell 
  - Finish
- Um terminal será aberto e as instruções continuam neste ambiente: 
  - You must log in to continue. Would you like to log in (Y/n) : Y 
  - browser será chamado para que o login seja efetivado
  - de volta ao terminal uma lista com os projetos estará aparecendo e o número do projeto respectivo deverá ser selecionado
  - A pergunta (Do you want to configure Google Cloud Compute Engine ?) irá aparecer. Escolher `Y`es
  - Escolher a Zona em que os recursos serão adminstrados
    - estamos usando southamerica-east1-a (21)
    21
  - para testar, executar o seguinte comando 
    - `gcloud compute ssh vmmin`
    - a ferramenta irá perguntar se se deseja criar as pastas e arquivos necessários para que o ambiente de conexão segura com ssh rode direito, selecioar `Y`es 
    - pronto, o login é efetuado e o usuário agora está na máquina via ssh 



## para acessar de qualquer lugar (procedimentos de segurança baixa)
- copiar todos os arquivos com prefixo `google_compute_engine` que estão no diretório c:/Users/seu_user/.ssh
  - DETALHE IMPORTANTE: o usuário original que foi usado no tutorial acima, deverá ser sempre usado em todas as conexões, ainda que não necessariamente de dentro do ambiente aonde este usuário está logado
- colar no diretório .ssh de outro user ou outra máquina, ou qualquer lugar de preferência que possa ser visualizado pelo usuário ou software desejado 
- de dentro do command prompt executar 
  - `ssh -i google_compute_engine seu_user@IP_DA_MÁQUINA`
  - et voilá : SUCESSO !! 

- a chave poderá ser usado em conexões scp, winscp e outras, sendo que se o usuário no google cloud for admin da instância em questão, ele terá acesso a qualquer diretório da máquina. 

  


## qualquer operação dentro da nuvem que vá ser feita via interface gráfica, seguir instruções abaixo 
- Depois de logado, no canto superior direito da página, selecionar `CONSOLE` 
- Selecionar projeto no canto superior esquerdo, ao lado do título `Google Cloud Platform`
- No menu lateral esquerdo, selecionar a funcionalidade `Compute Engine` 
- No menu lateral esquerdo, selecionar `VM instances`
- Selecionar a instância/vm desejada 





## para criar uma nova chave ssh que não esteja vinculada ao login google (não recomendado)
- Na barra de ferramentas ao topo, abaixo de `Computer Engine/VM Instance`` selecionar Editar 
- No meio da página, na sessão de SSH Keys, adicionar nova chave pública
- Salvar



# Referências 
[página do sdk do gcloud](https://cloud.google.com/sdk/gcloud/)

