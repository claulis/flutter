# Arquitetura de Software no Desenvolvimento Flutter: Princípios e Práticas para Aplicações Robustas


Flutter é um framework para desenvolvimento mobile, cross-platform  que possui alguns princípios fundamentais de arquitetura de software. 
Existem vários padrões de arquitetura de software e de projetos que podem ser implementados com Flutter ou qualquer outro frmework de desenvolvimento mobile, porém, torna-se importante conhecer alguns princípios fundamentais, que são de base para alguns famosos padrões arquiteturais.

Conceitos como Separation of Concerns, arquitetura em camadas, Single Source of Truth, Unidirectional Data Flow, UI como função de estado imutável, extensibilidade e testabilidade foram a base engenheristica para a criação deste framework. É importante entender o contexto, a justiicativa e a aplicabilidade destes conceitos de arquitetur para um desenvolvimento de aplicativos de fácil manutenção e atualização (Bass, Clements e Kazman, 2021).

Flutter, um framework de UI criado pelo Google, tem ganhado popularidade significativa devido à sua capacidade de desenvolvimento multiplataforma e renderização de alta performance. Entretanto, segundo com a crescente complexidade das aplicações, adotar princípios sólidos de arquitetura torna-se uma necessidade fundamental para equipes de desenvolvimento.

Aqui estão resumidos os princípios fundamentais de arquitetura de software usados no Flutter para construir aplicações robustas, extensíveis e testáveis.

## 2. Separation of Concerns (SoC)

O princípio de Separation of Concerns (Separação de Responsabilidades) consiste em dividir um sistema em partes distintas, cada uma abordando uma funcionalidade do sistema, minimizando a sobreposição de funcionalidades entre componentes (GAMMA et al., 2016). Este princípio promove melhor manutenção, reutilização de código e simplificação do sistema como um todo (TARR el al, 1999).

No desenvolvimento com Flutter, a implementação de SoC é implementada dividindo a estrutura nas seguintes camadas:

- **Camada de Apresentação**: Widgets Flutter responsáveis pela interface do usuário
- **Camada de Lógica de Negócios**: Processamento de dados e regras de negócio
- **Camada de Dados**: Acesso e persistência de dados

O objetivo principal desses padrões arquiteturais é  garantir que exista uma delimitação clara de responsabilidades.

## 3. Arquitetura em Camadas

A arquitetura em camadas refere-se à organização do código em níveis abstratos com responsabilidades bem definidas, onde cada camada interage apenas com camadas adjacentes. Martin (2018) defende que uma boa arquitetura em camadas deve obedecer a regra de dependência: dependências de código só podem apontar para dentro (em direção a camadas mais fundamentais).

Em aplicações Flutter, a arquitetura em camadas comumente inclui:

- **Camada de UI/Apresentação**: Widgets Flutter e gerenciamento de estado local
- **Camada de Lógica de Aplicação**: Coordenação entre UI e dados, regras de aplicação
- **Camada de Domínio**: Entidades e regras de negócio centrais
- **Camada de Infraestrutura**: Implementações concretas para acesso a dados externos


## 4. Single Source of Truth (SSOT)

O princípio de Single Source of Truth estabelece que cada elemento de dados deve ser armazenado exatamente em um local, evitando redundâncias e inconsistências. Este princípio é particularmente relevante em ambientes de desenvolvimento mobile, onde o gerenciamento de estado é frequentemente complexo.

Em Flutter, SSOT pode ser implementado através de:

- Utilização de um repositório centralizado de dados
- Implementação de gerenciadores de estado como Provider, Bloc, Redux ou MobX
- Caching controlado e sincronizado com a fonte de dados primária

Windmill (2022) observa que o Flutter facilita a implementação deste princípio através de seus mecanismos de gerenciamento de estado. É importante de definir claramente a "fonte da verdade" para cada tipo de dado na aplicação, evitando duplicações ou redundnâncias involuntárias que podem levar a inconsistências.

## 5. Unidirectional Data Flow

O fluxo de dados unidirecional estabelece um padrão onde os dados fluem em uma única direção dentro da aplicação, tipicamente da camada de dados para a UI. Este princípio, popularizado por frameworks como Redux, promove previsibilidade e facilita o rastreamento de mudanças de estado.

No contexto Flutter, o fluxo unidirecional pode ser implementado através de:

- Padrões arquiteturais como Bloc, Redux ou Flux
- Fluxo claro de eventos da UI para manipuladores de estado
- Atualizações de UI baseadas exclusivamente em mudanças de estado

Destaca-se que este princípio, quando combinado com estado imutável, proporciona significativas vantagens para debugging e testabilidade em aplicações Flutter, uma vez que o comportamento da aplicação torna-se mais previsível e mais fácil de reproduzir em diferentes cenários.

## 6. UI como Função de Estado Imutável

Este princípio fundamenta-se na ideia de que a interface do usuário deve ser uma representação pura de um estado imutável da aplicação. Modificações na UI ocorrem apenas em resposta a mudanças neste estado, não diretamente por ações de UI (Soares, 2021).

Flutter implementa este conceito nativamente através de seu sistema de widgets declarativos. O Flutter para construção de UI baseia-se na reconstrução de widgets em resposta a mudanças de estado, ao invés de modificações imperativas na UI existente. Isso facilita o rastrfeamento da origem de mudanças de UI e simplifica a lógica de atualização de interface, além de
melhorar no desempenho através do sistema de reconstrução seletiva de widgets do Flutter.

## 7. Extensibilidade

Extensibilidade refere-se à capacidade de um sistema ser expandido com novas funcionalidades com impacto mínimo no código existente. Gamma et al. (2016) argumentam que sistemas extensíveis são construídos através da aplicação consistente de padrões de design que promovem baixo acoplamento e alta coesão.

Em aplicações Flutter, a extensibilidade pode ser alcançada através da implementação de padrões como Strategy, Factory e Abstract Factory além do uso de interfaces bem definidas e injeção de dependências.

Alessandria e Kayfitz (2021) observam que o próprio Flutter foi projetado com extensibilidade para criação de widgets personalizados, temas e comportamentos que podem ser facilmente incorporados a aplicações existentes. 

## 8. Testabilidade

A testabilidade refere-se à facilidade com que componentes de software podem ser verificados quanto à sua correção. Martin (2018) argumenta que a testabilidade é tanto um resultado de boa arquitetura quanto um driver para decisões arquiteturais sólidas.

Em Flutter, a testabilidade é promovida através da separação clara entre lógica de negócios e UI e por permitir estruturas de código tastáveis a vários níveis.

O ecossistema Flutter oferece ferramentas robustas para testes, incluindo o framework de testes nativo e bibliotecas. Os testes de aplicações Flutter  permitem três níveis:

1. **Testes Unitários**: Verificando componentes isolados como serviços e modelos
2. **Testes de Widget**: Testando o comportamento de widgets individuais
3. **Testes de Integração**: Validando o comportamento de múltiplos componentes em conjunto


## 9. Conclusão

Como observado por Windmill (2021), não existe uma solução arquitetural única que se aplique a todas as aplicações Flutter. Ao invés disso, desenvolvedores devem buscar compreender os princípios fundamentais e aplicá-los de forma adaptativa, considerando fatores como tamanho da equipe, complexidade do projeto e requisitos específicos.

A evolução constante do ecossistema Flutter e Dart continua a trazer novas ferramentas e padrões que facilitam a implementação destes princípios. Manter-se atualizado com estas tendências, enquanto fundamentado em princípios sólidos de arquitetura, representa o caminho mais promissor para desenvolvedores que buscam construir aplicações Flutter robustas, extensíveis e sustentáveis a longo prazo.

## Referências

ALESSANDRIA, Simone; KAYFITZ, Brian. Flutter Cookbook: Over 100 proven techniques and solutions for app development with Flutter 2.2 and Dart. Packt Publishing Ltd, 2021.

BASS, Len; CLEMENTS, Paul; KAZMAN, Rick. Software architecture in practice. Addison-Wesley Professional, 2021.

MARTIN, R. C. Clean architecture: a craftsman's guide to software structure and design. New Jersey: Prentice Hall, 2018.

TARR, Peri et al. N degrees of separation: Multi-dimensional separation of concerns. In: Proceedings of the 21st international conference on Software engineering. 1999. p. 107-119.

WINDMILL, Eric. Flutter in action. Simon and Schuster, 2020.
