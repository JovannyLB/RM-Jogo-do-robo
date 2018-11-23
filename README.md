# Jogo do robo / Jogo de mimica

##O jogo

Esse jogo foi um dos nossos trabalhos da faculdade, é um jogo simples onde o jogador tem que imitar as poses que o "oponente" está fazendo, a premissa é bem simples, imite perfeitamente e ganhe, erre e perca, boa sorte.

---

##Como adicionar suas próprias poses/leveis

Nós criamos uma maneira simples e rápida de adicionar suas próprias poses ao nosso jogo, esse é o processo:

1. Modifique a variavel de tempo para quee você tenha tempo o suficiente para colocar sua pose:
...
void setup() {
  fullScreen();
  frameRate(10);
  clock = new Clock();
  clock.start();
  **tempoTotal = 60;**
  tempo = tempoTotal;
  level = 0;
  points = 0;
  angulosPlayer = new FloatList();
  angulosPose = new FloatList();
  player = new Articulacao(width/4,height/2,true);
  pose = new Articulacao(width/4*3,height/2,false);
  criacaoPose = createWriter("poses.txt");
}
...
2. Comece o jogo e faça sua pose livremente
3. Quando achar que a pose é o suficiente aperte a tecla **B** do seu teclado
4. Logo em seguida aperte a tecla **A**, isso ira fechar o jogo
5. Agora, na pasta 'JogoMimica', existe o arquivo 'poses.txt', esse arquivo contém todas informações sobre sua pose (tente não começar o jogo novamente pois isso apagara as informações contidas no arquivo)
6. De um 'CTRL + A' e um 'CTRL + C' no texto que o arquivo contém e vá para o processing
7. No arquivo 'JogoMimica.pde', no método 'void criarPose(){}'(linha 180) você criará um novo 'else if' após o último assim:
...
void criarPose(){
  if (level == 0){
    pose.angle1 = x;
    pose.angle2 = x;
    pose.angle3 = x;
    etc...
  } **else if (level == *um número a mais do que do ultimo if/else if*){**
    **CTRL + V para adicionar as informações da sua pose**
  }
}
...
8. E, por último, você terá que atualizar a quantidade de niveis no método 'void testeDeFinal(){}'(linha 170) assim:
...
void testeDeFinal(){  
    **if (level > *novo número leveis*){**
      textAlign(CENTER, CENTER);
      textSize(72);
      noLoop();
      text("Você venceu!", width / 2, height / 2);
      textSize(24);
      text("Pontos: " + points, (width / 2), (height / 2) + 75);
    }
}
...