import 'package:flutter/material.dart';
//Importa o pacote do Flutter que traz os widgets do Material Design
//(MaterialApp, Scaffold, AppBar, Text, etc.)Sem esse import, nenhum
//desses widgets existiria no arquivo

void main() {
  //ponto de entrada do programa dart (primeira função a ser executada)qnd o app Roda
  runApp(const CrachaApp());
  //runApp liga o motor do Flutter para entregar o widget raiz (CrachaApp)
  //que será desenhado na tela.O const especifica que o widget
  //pode ser construído em tempo de compilação.
}

class CrachaApp extends StatelessWidget {
  //extends Statelesswidget significa que a classe herda o comportamento de um widget 'sem memória'
  //Ele descreve a tela, mas não guarda nenhum dado que muda sozinho. Porque nome, cargo são fixos
  //durante o uso do app
  const CrachaApp({super.key});
  //Construtor da Classe. 'super.key' repassa o parâmetro key para a classe pai, usado pelo flutter
  //para identificar o widget dentro da árvore.
  //Ex: Imagine que vc tem uma lista de tarefas na tela do celular e decide apagar a primeira tarefa.
  //Como o flutter sabe qual tarefa ele deve destruir e quais manter?Ele sabe pq cada widget tem uma 'key' que é única.
  @override
  //avisa ao compilador: este método já existe na classe pai.
  //(StatelessWidget) e estou reescrevendo o compotamento dele
  Widget build(BuildContext context) {
    //build()é o método obrigatório chamado pelo Flutter para desenhar
    //a interface. Recebe um BuildContext (o 'endereço'deste widget na árvore e deve retornar o widget pronto)
    return MaterialApp(
      //Widget raiz que configura o aplicativo inteiro! tema, título, tela inicial, e o visual
      debugShowCheckedModeBanner: false,
      //remove a faixa vermelha 'DEBUG' do canto da tela - só estética
      title: 'Crachá Digital',
      //Título interno do app. Ñ aparece na tela
      home: Scaffold(
        //home define a tela real do app. Scaffold cria o esqueleto padrão,
        // que já reseerva espaço para Appbar e corpo, por exemplo
        appBar: AppBar(
          //região fixa no topo da tela
          title: const Text('Crachá Digital'),
          //texto exibido dentro da Appbar, const porque nunca vai mudar
          //, então Flutter pode reaproveitar esse widget sem crir o título a cada 'redesenho'
        ),
        body: Padding(
          //body é a região principal da página, abaixo de AppBar
          //Paddin cria eespaço interno ao redor do seu conteúdo
          padding: const EdgeInsets.all(24),
          //24pixels de 'respiro' nos quatro lados, entre a borda da tela e o conteúdo
          child: Column(
            //Colum empilha seus filhos verticalmente: primeiro o cartão do crachá, depois o botão
            crossAxisAlignment: CrossAxisAlignment.stretch,
            //Controla o eixo cruzado da coluna (horizontal). 'strech'
            //faz cada filho ocupar toda a largura disponível, é por isso
            //que o cartão e o botão vão preencher a largura da tela, em vez de ficarem
            //do tamanho específico de seu conteúdo
            children: [
              //Faremos a lista de filhos da coluna
              Container(
                //Container é a "caixa" que dará a aparência de cartão ao conjunto de textos
                padding: const EdgeInsets.all(16),
                //espaço interno do Container. Distância entre a borda do cartão e o conteúdo dentro
                decoration: BoxDecoration(
                  //cuida da aparência da caixa (cor de fundo, borda, cantos, etc)
                  color: const Color.fromARGB(167, 91, 158, 224),
                  //pinta o fundo do containeer
                  borderRadius: BorderRadius.circular(12),
                  //Arredonda os quatro cantos do Container com um raio de 12 pixels
                  border: Border.all(color: Colors.blue.shade50),

                  //Desenha um contorno fino ao redor do container
                ),
                child: const Column(
                  //O container também só aceita um filho - aqui, uma Colum própria, local a este cartão).
                  //Const porque nada aqui dentro vai mudar em tempo de execução
                  crossAxisAlignment: CrossAxisAlignment.start,
                  //Dentro do cartão, o alinhamento à esquerda -
                  // uma colum diferente pode ter configuração diferente da colum externa
                  children: [
                    //Faremos a lista de filhos da coluna
                    Text(
                      'Murilo Marques',
                      style: TextStyle(
                        fontSize: 28,
                        //tamanho da fonte em pixels - bem grande
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 4),
                    //wdiget invisivel que adiciona um espaço vertical
                    Text(
                      'Tecnico de manuntenção',
                      style: TextStyle(fontSize: 16,color: Colors.grey),
                      ),
                      SizedBox(height: 4),
                      //wdiget invisivel que adiciona um espaço vertical
                      Row(
                       //Row organiza seus filhos lado a lado
                       //diferente da colum.
                      children: [
                        Icon(Icons.factory, color: Colors.blue,),
                        //icon é apenas um desenho vetorial da biblioteca Material
                        SizedBox(width: 8),
                        //dentro da Row, sizedbox(width:)cria um espaço horizontal
                        //entre o icone e o texto
                        Text('Setor: Manuntenção Industrial')
                      ], 
                      )
                  ],
                ),
              ),
              const SizedBox(height: 24),
              FilledButton.icon(
                onPressed:(){
                  //Ação de callback executada toda vez que o botão é tocado.
                  //Aqui usamos uma função anonima '(){}'
                  ScaffoldMessenger.of(context).showSnackBar(
                    //Context é  o endereço desse widget dentro da arvore
                    const SnackBar(
                      content:Text('Acesso Liberado')
                      ),
                  );
                },
                icon: const Icon(Icons.lock_open),
                label: const Text('Liberar Acesso'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
