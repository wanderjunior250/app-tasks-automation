## Installation

Requisites:
- Ruby installed. (2.3.3 or high)

```bash
$ gem install bundler
```

## Comandos básicos para executar o projeto
```bash
$ cucumber 
#O comando recebe alguns argumentos como veremos abaixo. Caso não seja atribuído nenhum argumento o projeto inteiro será 
#executado de ponta à ponta. Segue a lista de argumentos:

$ cucumber <caminho_arquivo>:linha
#executa o cenárioquela linha especificada, pode ser passado multiplas linhas, exemplo:
$ cucumber features/busca.feature:21:26:67

$ cucumber @rerun.txt 
#Pode-se passar um arquivo de texto contendo o que será executado como nesse caso. Verificar formato rerun.

$ -f, --format <formato_desejado> 
#Mudar o formato de saída do relatório, caso não especifique esse argumento será utilizado o formato padrão do projeto. 
#Lista de formatos possíveis:
#html        : Generates a nice looking HTML report.
#json        : Prints the feature as JSON
#json_pretty : Prints the feature as prettified JSON
#junit       : Generates a report similar to Ant+JUnit.
#pretty      : Prints the feature as is - in colours.
#progress    : Prints one character per scenario.
#rerun       : Prints failing files with line numbers.
#stepdefs    : Prints All step definitions with their locations. Same as the usage formatter, except that steps are not 
#printed.
#summary     : Summary output of feature and scenarios
#usage       : Prints where step definitions are used. The slowest step definitions (with duration) 
#are listed first. If --dry-run is used the duration is not shown, and step definitions are sorted by filename instead.
#Também é possível criar e utlizar um formato customizado.


$ --init 
#Inicializa toda a estrutura de pastas e arquivos necessários para um projeto em cucumber.

$ -o, --out <arquivo|diretório> 
#Usado para especificar que o relatório terá uma saída e o caminho dessa saída.

$ -t, --tag @<nome_da_tag> 
#Executa apenas as features ou cenários que tiverem a tag especificada declarada. Por exemplo: -t @positivo. Além disso, 
#podemos usar expressões lógicas como or e and, exemplo: -t @positivo and @regressao

$ -n, --name <nome> 
#Executa apenas os elementos feature que for igual a parte do nome especificado. Se for preenchido com mais de um nome, 
#ele ira procurar por ambos, ou seja, pode ser usado para executar apenas um cenário, feature ou grupo de cenários que 
#compartilham de nomes semelhantes por exemplo. -n senha isso irá executar tudo que contiver senha no nome.

$ --fail-fast 
#Usado para parar a execução no primeiro cenário que falhar.

$ --retry <tentativas> 
#Especifica a quantidade de vezes que ele irá executar os testes que falharam (Padrão: 0).

$ -h, --help 
#Exibe ajuda.
```