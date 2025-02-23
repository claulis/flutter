
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


## 5. 
   - **Bloc/Cubit** → Baseado em Streams e padrões reativos.
   - **Redux** → Inspirado no Redux do React, usa Store centralizada.

   ✅ **Prós**: Gerenciamento eficiente do estado.  
   ❌ **Contras**: Pode ser complexo dependendo da abordagem.

---

### Tabela comparativa

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


