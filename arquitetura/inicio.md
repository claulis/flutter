
# Arquitetura de Software em Flutter

No desenvolvimento de aplicativos Flutter, algumas das principais **arquiteturas de software** usadas são:

---

## 1. MVC (Model-View-Controller)
   - **Modelo (Model)**: Representa os dados e a lógica de negócios.
   - **Visão (View)**: Responsável pela interface gráfica.
   - **Controlador (Controller)**: Faz a comunicação entre Model e View.

   ✅ **Prós**: Estrutura organizada e separação de responsabilidades.  
   ❌ **Contras**: Pode gerar forte acoplamento entre as camadas.

---

## 2. MVP (Model-View-Presenter)
   - **Modelo (Model)**: Contém os dados e regras de negócios.
   - **Visão (View)**: Exibe a interface gráfica e recebe ações do usuário.
   - **Apresentador (Presenter)**: Gerencia a lógica da interface e atualiza a View.

   ✅ **Prós**: Facilita testes e evita regras de negócio dentro da View.  
   ❌ **Contras**: Pode demandar mais código e ser mais complexo.

---

## 3. MVVM (Model-View-ViewModel)
   - **Modelo (Model)**: Contém os dados e lógica.
   - **Visão (View)**: Interface do usuário.
   - **ViewModel**: Faz a comunicação entre View e Model, sem que a View dependa diretamente do Model.

   ✅ **Prós**: Melhor separação de responsabilidades, mais testável.  
   ❌ **Contras**: Pode ser mais difícil de implementar corretamente.


## 4. BLoC 
   - **Bloc/Cubit** → Baseado em Streams e padrões reativos.
   

   ✅ **Prós**: Gerenciamento eficiente do estado.  
   ❌ **Contras**: Pode ser complexo dependendo da abordagem.

## 5. Tabela comparativa

| Arquitetura               | Vantagens ✅                                      | Desvantagens ❌                                      | Melhor Para 🚀                                      |
|---------------------------|-------------------------------------------------|----------------------------------------------------|----------------------------------------------------|
| **MVC (Model-View-Controller)** | Simples e fácil de entender  <br> Boa separação de responsabilidades  | Pode levar a forte acoplamento entre camadas <br> Dificuldade em testar a interface  | Aplicativos pequenos e médios <br> Prototipagem rápida |
| **MVP (Model-View-Presenter)** | Fácil de testar <br> Menos lógica na View | Mais código necessário <br> Pode ser mais complexo | Aplicações médias <br> Apps onde testes unitários são importantes |
| **MVVM (Model-View-ViewModel)** | Melhor separação de responsabilidades <br> Fácil de manter e testar | Pode ser difícil de implementar corretamente <br> Pode exigir ferramentas externas (Provider, Riverpod) | Aplicativos escaláveis <br> Projetos que exigem testes e manutenção fácil |
| **Bloc (Gerenciamento de Estado)** | Arquitetura reativa <br> Excelente para apps com mudanças frequentes de estado | Mais verboso e complexo <br> Exige conhecimento sobre Streams | Aplicativos grandes <br> Apps que exigem controle detalhado do estado |

### Qual arquitetura escolher?
- **Apps pequenos e simples** → **MVC ou MVP**
- **Apps médios** → **MVVM**
- **Apps grandes e escaláveis** → **Bloc**

## 6. Padrões arquiteturais e Flutter

O Flutter, por sua natureza flexível e baseada em widgets, permite a implementação de diversas arquiteturas para organizar código e gerenciar estado. Padrões como MVC, MVP, MVVM e BLoC são adaptáveis ao ecossistema Flutter, cada um com abordagens distintas para separar lógica de negócio, UI e dados. A escolha depende da complexidade do projeto, necessidades de testabilidade e preferência por reatividade (FLOYD, 2021).
Enquanto MVC e MVP são menos adotados no Flutter moderno, MVVM e BLoC destacam-se pela integração com reatividade e ferramentas como provider e flutter_bloc. A escolha depende da complexidade:

MVVM: Apps simples com ChangeNotifier.

BLoC: Apps escaláveis com fluxos de estado bem definidos.

> A arquitetura BLoC, em particular, tornou-se um de facto para projetos Flutter, alinhando-se à filosofia declarativa e reativa do framework. 


### 6.1 Arquiteturas e Sua Adaptação ao Flutter

1. **MVC (Model-View-Controller)**  
   - **Model**: Classes de dados (ex.: `User`, `Product`).  
   - **View**: Widgets de UI (ex.: `StatelessWidget`).  
   - **Controller**: Lógica de negócio e interação entre Model e View (ex.: `StatefulWidget` ou classes dedicadas).  
   - **Uso no Flutter**: Menos comum, pois o `StatefulWidget` combina View e Controller, gerando acoplamento.  

2. **MVP (Model-View-Presenter)**  
   - **Model**: Similar ao MVC.  
   - **View**: Widgets passivos (exibe dados).  
   - **Presenter**: Gerencia interações e atualizações, substituindo o Controller.  
   - **Uso no Flutter**: Implementado via callbacks ou pacotes como `provider`, mas pouco adotado devido à complexidade de mediação (SOARES, 2019).  

3. **MVVM (Model-View-ViewModel)**  
   - **Model**: Dados e regras de negócio.  
   - **View**: Widgets vinculados ao ViewModel via *data binding*.  
   - **ViewModel**: Expõe streams (ex.: `StreamController`) ou usa `ChangeNotifier` (com `provider`).  
   - **Uso no Flutter**: Popularizado por pacotes como `provider` e `GetX`, alinhando-se à reatividade do framework (GOOGLE, 2020).  

4. **BLoC (Business Logic Component)**  
   - **Eventos**: Ações da UI (ex.: `LoginButtonPressed`).  
   - **BLoC**: Processa eventos e emite estados via `Streams`.  
   - **Estado**: Representa mudanças na aplicação (ex.: `LoadingState`, `SuccessState`).  
   - **Uso no Flutter**: Dominante em projetos complexos, com pacotes como `flutter_bloc` e `bloc` (GOOGLE, 2020).  

---

### 6.2 **Comparação e Integração**  
| **Arquitetura** | **Foco**                | **Vantagem no Flutter**                |  
|------------------|--------------------------|----------------------------------------|  
| **MVC**          | Separação básica         | Simplicidade para apps pequenos.       |  
| **MVP**          | Mediação por Presenter   | Testabilidade, mas com boilerplate.    |  
| **MVVM**         | Data Binding reativo     | Integração nativa com `Streams`.       |  
| **BLoC**         | Estado previsível        | Escalabilidade e reatividade avançada. |  

- **BLoC vs MVVM**: Ambos usam reatividade, mas o BLoC padroniza o fluxo **Evento → Estado**, enquanto o MVVM foca em expor dados prontos para a View (SMITH, 2020).  
- **Integração**:  
  - O `provider` (MVVM) pode coexistir com `flutter_bloc`, dependendo da necessidade modular.  
  - O BLoC é considerado uma evolução do MVVM para cenários com fluxos de dados complexos (FELIPE, 2020).  

## Referências 

GOOGLE. **Flutter: State Management**. Flutter Documentation, 2023. Disponível em: <https://docs.flutter.dev/development/data-and-backend/state-mgmt/intro>. Acesso em: 15 out. 2023.  

SOARES, P. **Padrões Arquiteturais em Flutter**. Medium, 2019. Disponível em: <https://medium.com/flutter-community>. Acesso em: 15 out. 2023.  

FELIPE, L. **Flutter: Gerência de Estado com BLoC**. 1. ed. São Paulo: Casa do Código, 2020.  

SMITH, J. **Design Patterns for Flutter**. Apress, 2020.  

FLOYD, R. **Comparando MVC, MVVM e BLoC no Flutter**. Dev.to, 2021. Disponível em: <https://dev.to/fluttercommunity>. Acesso em: 15 out. 2023.  


