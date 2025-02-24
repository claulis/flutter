# Explicação Exemplo

## Instalação

1. Abra o VSCode
2. `ctrl`+`shift`+`p` para criar novo projeto Flutter
3. Escolher a pasta (possivelmente com permissões para gravar)
4. Nomear o projeto **soma_mvp**
5. Copiar o conteúdo da pasta /lib desse respositório para a pasta /lib do projeto soma_mvp
6. Abrir novo terminal na pasta soma_mvp
7. digitar o comando `flutter pub add provider`

## Execução
1. no terminal da pasta soma_mvp digitar `flutter run`
2. Escolher uma opção

## Explicação das Principais Diferenças Entre MVC e MVP

1. Separação de Responsabilidades:

No MVC original, a View podia acessar diretamente o Model
No MVP implementado, a View interage apenas com o Presenter, nunca com o Model diretamente


2. Inicialização de Dependências:

Agora criamos o Model primeiro e o injetamos no Presenter
Isso torna o código mais testável, pois podemos injetar Mocks do Model para testar o Presenter


3. Fluxo de Dados:

No MVC: Controller → Model → View (atualiza conforme mudanças no Model)
No MVP: View → Presenter → Model → Presenter → View


4. Responsabilidades do Presenter:

Faz a mediação de toda interação entre View e Model
Contém lógica de apresentação (validação, formatação)
Expõe dados do Model de forma apropriada para a View

## Contratos de Interface
Esta implementação representa uma versão mais "pura" do padrão MVP, utilizando contratos de interface para definir claramente as responsabilidades de cada componente:

1. Contratos Explícitos:

Cada componente (Model, View, Presenter) tem um contrato de interface definido
As implementações concretas seguem esses contratos
Isso facilita a substituição de implementações e testes unitários


2. Fluxo de Comunicação Bidirecional:

O Presenter mantém uma referência à View através do método setView()
Permite que o Presenter notifique a View diretamente, sem depender do Provider


3. Maior Separação de Responsabilidades:

A View implementa métodos específicos como updateUI(), showError() e clearInputs()
O Presenter não precisa conhecer os detalhes de como a UI é atualizada


4. Vantagens para Testes:

É fácil criar mocks de qualquer componente usando os contratos
As dependências são injetadas explicitamente, não via Provider
Cada componente pode ser testado isoladamente



