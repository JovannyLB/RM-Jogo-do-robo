Jogo do robo / Jogo de mimica
===

---

O jogo
---

Esse jogo foi um dos nossos trabalhos da faculdade, é um jogo simples onde o jogador tem que imitar as poses que o "oponente" está fazendo, a premissa é bem simples, imite perfeitamente e ganhe, erre e perca, boa sorte.

---

Como adicionar suas próprias poses/leveis
---

Nós criamos uma maneira simples e rápida de adicionar suas próprias poses ao nosso jogo, esse é o processo:

1. Modifique a variavel `tempoTotal` para quee você tenha tempo o suficiente para colocar sua pose, assim:
```processing
void setup() {
  fullScreen();
  frameRate(10);
  etc...
  tempoTotal = x;
}
```
2. Comece o jogo e faça sua pose livremente
3. Quando achar que a pose é o suficiente aperte a tecla **B** do seu teclado
4. Logo em seguida aperte a tecla **A**, isso ira fechar o jogo
5. Agora, na pasta `JogoMimica`, existe o arquivo `poses.txt`, esse arquivo contém todas informações sobre sua pose (tente não começar o jogo novamente pois isso apagara as informações contidas no arquivo)
6. De um `CTRL + A` e um `CTRL + C` no texto que o arquivo contém e vá para o processing
7. No arquivo `JogoMimica.pde`, no método `void criarPose(){}`(linha 180) você criará um novo `else if` após o último assim:
```processing
void criarPose(){
  if (level == x){
    pose.angle1 = y;
    pose.angle2 = y;
    pose.angle3 = y;
    etc...
  } else if (level == x + 1){
      pose.angle1 = y;
      pose.angle2 = y;
      pose.angle3 = y;
      etc...  }
}
```
8. E, por último, você terá que atualizar a quantidade de niveis no método `void testeDeFinal(){}`(linha 170) assim:
```processing
void testeDeFinal(){  
    if (level > x + 1){
      textAlign(CENTER, CENTER);
      textSize(72);
      etc...
    }
}
```
---
