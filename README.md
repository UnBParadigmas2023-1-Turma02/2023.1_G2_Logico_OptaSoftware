<img width="386" alt="logo" src="https://github.com/UnBParadigmas2023-1-Turma02/2023.1_G2_Logico_OptaSoftware/assets/60350851/199dca77-a6f4-43e3-8caf-43c769690815">


**Disciplina**: FGA0210 - PARADIGMAS DE PROGRAMAÇÃO - T02 <br>
**Nro do Grupo (de acordo com a Planilha de Divisão dos Grupos)**: 02<br>
**Paradigma**: Lógico<br>

## Alunos
|Matrícula | Aluno |
| -- | -- |
| 180099353  |  Cibele Freitas Goudinho - @CibeleG |
| 190108011  |  Guilherme Brito Vilas Boas - @dev-brito |
| 170105342  |  Irwin Schmitt - @irwinschmitt |
| 180103792  |  Júlia Farias Sousa - @julisous |
| 180104390  |  Lameque Fernandes Azevedo - @LamequeFernandes |
| 201000379  |  Leonardo Milomes Vitoriano - @leonardomilv3 |
| 180078224  |  Thaís Rebouças de Araujo - @Thais-ra |
| 200028367  |  Victor Hugo Oliveira Leão - @victorleaoo |

## Sobre 

A fim de praticar os conhecimentos do Paradigma Lógico, foi desenvolvido um sistema de recomendação/busca de matérias optativas para o curso de Engenharia de Software. 

As disciplinas foram listadas e analisadas com base na [Estrutura Curricular 6360/1](https://sigaa.unb.br/sigaa/public/curso/curriculo.jsf?lc=pt_BR&id=414924), realizando um filtro para retirar as obrigatórias e as que não eram específicas, como, por exemplo, Atividades Complementares. Na página de [Optativas](https://unbparadigmas2023-1-turma02.github.io/2023.1_G2_Logico_OptaSoftware/optativas/) é possível encontrar as disciplinas filtradas e descritas de acordo com atributos julgados importantes (nome, palavras chaves, área de conhecimento, carga horária e ementa).

A partir disso, então, o sistema desenvolvido possui os seguintes filtros para as disciplinas:

- Carga horária
- Área de conhecimento
- Palavra presente na ementa

Além disso, há, também, uma funcionalidade de geração de relatório para aqueles que desejarem informações mais completas da ementa.

## Screenshots

### Tela de Escolha de Filtros

![Captura de tela de 2023-06-02 18-53-54](https://github.com/UnBParadigmas2023-1-Turma02/2023.1_G2_Logico_OptaSoftware/assets/98705337/2036b7ef-eb5b-4844-a514-2ecc6bf16053)

### Tela de Escolha por Aŕea

![Captura de tela de 2023-06-02 18-54-05](https://github.com/UnBParadigmas2023-1-Turma02/2023.1_G2_Logico_OptaSoftware/assets/98705337/3a70ef73-4631-43db-8882-d4d0b86e593b)

### Tela de Retorno da Busca

![Captura de tela de 2023-06-02 18-54-15](https://github.com/UnBParadigmas2023-1-Turma02/2023.1_G2_Logico_OptaSoftware/assets/98705337/e485ff74-fdce-4734-9ce3-a83e15b9f181)

### Conteúdo do Arquivo do Relatório

![Captura de tela de 2023-06-02 19-03-02](https://github.com/UnBParadigmas2023-1-Turma02/2023.1_G2_Logico_OptaSoftware/assets/98705337/27a4f604-67cc-47cc-aa01-131be3c50171)


### Relatório em PDF gerado com o pandoc (script executado independente ao programa)

![Captura de tela de 2023-06-02 18-59-33](https://github.com/UnBParadigmas2023-1-Turma02/2023.1_G2_Logico_OptaSoftware/assets/98705337/8fe767d1-340c-4b01-a828-b655c6b13206)

## Instalação 
**Linguagens**: Prolog<br>
**Tecnologias**: XPCE (interface)<br>

## Pré-requisitos
- SWI-Prolog instalado

## Uso 
```bash
git clone https://github.com/UnBParadigmas2023-1-Turma02/20231_G2_Logico_OptaSoftware
```
```bash
cd app

swipl -q -s main.pl -g main

 ```

## Vídeo


## Participações

|Nome do Membro | Contribuição | Significância da Contribuição para o Projeto (Excelente/Boa/Regular/Ruim/Nula) |
| -- | -- | -- |
| Cibele Freitas Goudinho - @CibeleG | Desenvolvimento dos [filtros](https://github.com/UnBParadigmas2023-1-Turma02/2023.1_G2_Logico_OptaSoftware/blob/main/app/filtros.pl) | Excelente |
 | Guilherme Brito Vilas Boas - @dev-brito | Desenvolvimento da [tabela de Resultados da Busca](https://github.com/UnBParadigmas2023-1-Turma02/2023.1_G2_Logico_OptaSoftware/blob/main/app/ui/table.pl) e Integração com os filtros, além de contribuir ativamente com considerações nas reuniões que fizemos. | Excelente |
| Irwin Schmitt - @irwinschmitt | Protótipo de baixa fidelidade e desenvolvimento das janelas dos filtros: `ui/main_filter_dialog`, `ui/keywords_filter_dialog`, `ui/area_filter_dialog`, `ui/syllabus_filter_dialog` e `ui/workload_filter_dialog`. | Excelente |
| Júlia Farias Sousa - @julisous | Desenvolvimento do gerador de relatório [relatório](https://github.com/UnBParadigmas2023-1-Turma02/2023.1_G2_Logico_OptaSoftware/blob/relatorios/app/relatorio.pl),  atualização do Github Pages e README| Boa|
| Lameque Fernandes Azevedo - @LamequeFernandes | Desenvolvimento da [base de conhecimento](https://github.com/UnBParadigmas2023-1-Turma02/2023.1_G2_Logico_OptaSoftware/blob/main/app/materias.pl) e o diagrama de matérias.<br>Construção da documentação do Github Pages, requisitos e reuniões | Boa |
| Leonardo Milomes Vitoriano - @leonardomilv3 | Desenvolvimento dos [filtros](https://github.com/UnBParadigmas2023-1-Turma02/2023.1_G2_Logico_OptaSoftware/blob/main/app/filtros.pl) | Boa |
| Thaís Rebouças de Araujo - @Thais-ra |Desenvolvimento do gerador de relatório [relatório](https://github.com/UnBParadigmas2023-1-Turma02/2023.1_G2_Logico_OptaSoftware/blob/relatorios/app/relatorio.pl) | Boa |
| Victor Hugo Oliveira Leão - @victorleaoo | Desenvolvimento da [base de conhecimento](https://github.com/UnBParadigmas2023-1-Turma02/2023.1_G2_Logico_OptaSoftware/blob/main/app/materias.pl) e o diagrama de [Optativas](https://unbparadigmas2023-1-turma02.github.io/2023.1_G2_Logico_OptaSoftware/optativas/).<br>Construção da documentação do Github Pages e README. | Boa |

## Outros 
(i) Lições Aprendidas:
- Realizar modularização de tarefas nem sempre é o melhor caminho;
- É importante ter abordagens alternativas durante o desenvolvimento do projeto;
- É importante realizar reuniões pré-projeto para elencar os requisitos, assim todos estarão alinhados quanto aos objetivos do projeto.


(ii) Percepções:

- O simples funcionamento do Paradigma Lógico em encontrar "dados" cadastrados em sua base de conhecimento.
- Partir do caso default para conseguir progredir com os predicados

(iii) Contribuições e Fragilidades:

- O paradigma é difícil de ser modularizado, sendo necessária a constante integração e comunicação de toda a equipe durante o desenvolvimento do trabalho;
- O log de erros é de difícil interpretação, portante é necessário estudar bastante não só sobre o paradigma como o Prolog em si;
- O projeto contribuiu para tornar a forma de pensar da equipe mais lógica, menos orientada a objetos e pensando constantemente de existe um caso default para cada problema.



## Fontes

> - Estrutura Curricular 6360/1 (Engenharia de Software): https://sigaa.unb.br/sigaa/public/curso/curriculo.jsf?lc=pt_BR&id=414924
