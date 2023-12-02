# ENTRA21 - MySQL (banco de dados) Loja de Roupa
_________________________________________________________

Criação do banco de dados (controleEstoqueLojaDeRoupa).

<img width="960" alt="Criando banco de dados" src="https://github.com/BrunorCastro/Entra21_Banco_de_dados_MySQL/assets/130259811/0b039937-d005-468e-b136-085fd29552bd">

Criando usuários com a Concessão de Permissões (Admin, Comprador e Vendedor).

<img width="960" alt="Criando usuarios" src="https://github.com/BrunorCastro/Entra21_Banco_de_dados_MySQL/assets/130259811/e8e94d2d-9a27-48bd-a0ca-e56b46999351">

Criando tabelas (Produtos, Entradas de estoque e Saidas de estoque).

<img width="960" alt="criando tabelas" src="https://github.com/BrunorCastro/Entra21_Banco_de_dados_MySQL/assets/130259811/e3154821-fc02-47f5-9dd0-6fb3a12fa0f3">

Executando comanso INSERT para adicionar produtos, entradas e saidas.

Produtos

<img width="959" alt="Inserindo produtos" src="https://github.com/BrunorCastro/Entra21_Banco_de_dados_MySQL/assets/130259811/5942b3ea-148b-4462-b5f4-ec505022cf48">

Entradas

<img width="960" alt="inserindo entradas " src="https://github.com/BrunorCastro/Entra21_Banco_de_dados_MySQL/assets/130259811/d608c984-45fb-4814-87b4-a9fc60ad7467">

Saidas

<img width="959" alt="inserindo saidas" src="https://github.com/BrunorCastro/Entra21_Banco_de_dados_MySQL/assets/130259811/399f8fd9-fd75-4e25-a4ff-8aa60ba45012">

Executando comando INSERT para adicionar mais 1 produtos.

<img width="960" alt="Adicionando item" src="https://github.com/BrunorCastro/Entra21_Banco_de_dados_MySQL/assets/130259811/1c13da57-e032-495c-b7a2-378444320270">

Executando o comando DELETE para excluir o item adicionado.

<img width="960" alt="delete" src="https://github.com/BrunorCastro/Entra21_Banco_de_dados_MySQL/assets/130259811/2df7aaaf-f555-45a0-8ea9-695d24f6c095">

UPDATE das quantidades existente no estoque, expecificando pelo id_entradas.

<img width="960" alt="atualizado" src="https://github.com/BrunorCastro/Entra21_Banco_de_dados_MySQL/assets/130259811/0a8e6f31-b290-478f-8bfd-be87f06c7661">

"SELECT"
Consultas para calcular saida e entrada

SAIDA

<img width="960" alt="Select calculo" src="https://github.com/BrunorCastro/Entra21_Banco_de_dados_MySQL/assets/130259811/3aeab60d-5175-40cc-a620-c3834ab6277f">

ENTRADA

<img width="960" alt="entrada" src="https://github.com/BrunorCastro/Entra21_Banco_de_dados_MySQL/assets/130259811/582bcca4-d6f0-461e-834a-fd86f331828e">

Consulta após atualização de dados

<img width="960" alt="consulta" src="https://github.com/BrunorCastro/Entra21_Banco_de_dados_MySQL/assets/130259811/618a66c2-e391-4f85-a5f5-52b4c79f7ded">

Selecionar todos os produtos em estoque

<img width="957" alt="todos os produtos" src="https://github.com/BrunorCastro/Entra21_Banco_de_dados_MySQL/assets/130259811/629518be-6bd6-4453-9ee9-52a09a75fc9c">

Operações de entrada

<img width="960" alt="operador" src="https://github.com/BrunorCastro/Entra21_Banco_de_dados_MySQL/assets/130259811/6993787f-1cac-42fa-a354-d69cfe9b6323">

Estrutura do Banco de Dados
_________________________________________________________________________________________________________
Tabela PRODUTOS:

id_produto: Identificador único do produto.

nome_produto: Nome do produto.

descricao: Descrição detalhada do produto.

preco_unitario: Preço unitário do produto.
________________________________________________________________________________________________________
Tabela ENTRADAS_ESTOQUE:

id_entrada: Identificador único de entrada em estoque.

id_produto: Referência ao produto associado.

quantidade: Quantidade de produtos que entraram em estoque.

data_entrada: Dados de entrada em estoque.
_______________________________________________________________________________________________________
Tabela SAIDAS_ESTOQUE:

id_saida: Identificador único de saída do estoque.

id_produto: Referência ao produto associado.

quantidade: Quantidade de produtos que saíram do estoque.

data_saida: Dados da saída de estoque.

_______________________________________________________________________________________________________
Consultas SELECT:

As consultas SELECT permitiu analisar as entradas e saídas. foi utilizado para ver dados atualizados e consultar calculos de saida e entrada.
_______________________________________________________________________________________________________
Desafios:

Atualizar a entradas no estoque, no inicio so conseguia atualizar uma entrada por vez, depois descubri como atualizar varias entradas com o comando UPDATE, permitindo atualizar a quantidade de produtos.

A exclusão de produtos foi um desafio grande, não conseguia apagar o item desejado, ate entender o funcionamento do comando DELETE, depois a exclusão de produtos foi realizada tranquilamente, mantendo a consistência e integridade dos dados.
_________________________________________________________________________________________________________
Conclusão geral:

O controle de estoque é muito importante para o fundamental de qualquer empreendimento, e a utilização do banco de dados mostrou o quanto importante implementar e gerenciar esse controle de estoque.Um sistema bem modelado permite que qualquer empreendimento mantenha registros atualizado e funcionando perfeitamente, facilitando a tomada de decisões e garantindo uma gestão eficiente do estoque.


