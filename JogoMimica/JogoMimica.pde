int points, level, tempo, tempoTotal, pontosVitoria;
Clock clock;
Articulacao player, pose;
FloatList angulosPlayer, angulosPose;
boolean[] teclas;
boolean state, pstate;
PrintWriter criacaoPose;

void setup() {
  fullScreen();
  //frameRate(10);
  clock = new Clock();
  clock.start();
  tempoTotal = 60;
  tempo = tempoTotal;
  level = 0;
  points = 0;
  angulosPlayer = new FloatList();
  angulosPose = new FloatList();
  player = new Articulacao(width/4,height/2,true);
  pose = new Articulacao(width/4*3,height/2,false);
  criacaoPose = createWriter("poses.txt");
}

void draw() {
  background(220);
  fill(255);
  criarPose();
  player.updateArticulacao();
  pose.updateArticulacao();
  textAlign(CENTER, CENTER);
  textSize(15);
  fill(0);
  text("↑: Próxima articulação", 150, 50);
  text("↓: Articulação anterior", 150, 75);
  text("ESPAÇO: Mudar ângulo", 152.5, 100);
  text("C: Confirmar pose", 135, 125);
  text("PONTOS: " + points,1050,50);
  text("Tempo: " + (tempo - clock.second()), 600, 50);
  text("Level: " + level, 600, 75);
  if(tempo - clock.second() <= 0){
    testeDeFinal(); //<>//
  }
  
  // Sistema de teclas (previni a repetição se a tecla for segurada)
  state = false;
  state = keyPressed;
  if (keyPressed && state != pstate) {
    if (key == CODED) {
      if (keyCode == UP) {        //Proxima articulacao: artAtual + 1
        teclas[2] = true;
      }
      if(keyCode == DOWN){  //Articulacao anterior: artAtual - 1   
        teclas[1] = true;
      }
    }else{
      if(key == ' '){             //Rotate artAtual    
        teclas[0] = true;
      }
      if(key == 'c'){
        testeDeFinal();
      }
  
      if(key == 'a'){
        criacaoPose.flush();
        criacaoPose.close();
        exit();
      }
      if(key == 'b'){
      angulosPlayer.append(player.angle1);
      angulosPlayer.append(player.angle2);
      angulosPlayer.append(player.angle3);
      angulosPlayer.append(player.angle4);
      angulosPlayer.append(player.angle5);
      angulosPlayer.append(player.angle6);
      angulosPlayer.append(player.angle7);
      angulosPlayer.append(player.angle8);
      angulosPlayer.append(player.angle9);
      angulosPlayer.append(player.angle10);
      angulosPlayer.append(player.angle11);
      angulosPlayer.append(player.angle12);
      angulosPlayer.append(player.angle13);
      angulosPlayer.append(player.angle14);
      angulosPlayer.append(player.angle15);
        for(int i = 0; i < 15; i++){
          criacaoPose.println("pose.angle" + (i + 1) + " = " + angulosPlayer.get(i) + ";");
        }
        criacaoPose.println();
      angulosPlayer.clear();
      }
  
    }
  } else {
    teclas[0] = false;
    teclas[1] = false;
    teclas[2] = false;
  }
  pstate = state;

}

void testeDeFinal(){
    // Criação do array de angulos
    angulosPlayer.append(player.angle1);
    angulosPlayer.append(player.angle2);
    angulosPlayer.append(player.angle3);
    angulosPlayer.append(player.angle4);
    angulosPlayer.append(player.angle5);
    angulosPlayer.append(player.angle6);
    angulosPlayer.append(player.angle7);
    angulosPlayer.append(player.angle8);
    angulosPlayer.append(player.angle9);
    angulosPlayer.append(player.angle10);
    angulosPlayer.append(player.angle11);
    angulosPlayer.append(player.angle12);
    angulosPlayer.append(player.angle13);
    angulosPlayer.append(player.angle14);
    angulosPlayer.append(player.angle15);
    
    angulosPose.append(pose.angle1);
    angulosPose.append(pose.angle2);
    angulosPose.append(pose.angle3);
    angulosPose.append(pose.angle4);
    angulosPose.append(pose.angle5);
    angulosPose.append(pose.angle6);
    angulosPose.append(pose.angle7);
    angulosPose.append(pose.angle8);
    angulosPose.append(pose.angle9);
    angulosPose.append(pose.angle10);
    angulosPose.append(pose.angle11);
    angulosPose.append(pose.angle12);
    angulosPose.append(pose.angle13);
    angulosPose.append(pose.angle14);
    angulosPose.append(pose.angle15);
        
    // Cheque de pose
    for(int i = 0; i < 15; i++){
      if (angulosPlayer.get(i) == 0.0 && angulosPose.get(i) == 0.0){
          pontosVitoria++;
      } else {
        for(float j = -0.0000010; j < 0.0000010; j += 0.0000001){
          if (angulosPlayer.get(i) == (angulosPose.get(i) + j)){
            pontosVitoria++;
            break;
          }
        }
      }
    }
    
    if (pontosVitoria == 15){
      angulosPlayer.clear();
      angulosPose.clear();
      pontosVitoria = 0;
      points += 10;
      level++;
      tempo += tempoTotal - level;
    } else {
      textAlign(CENTER, CENTER);
      textSize(72);
      noLoop();
      text("Você perdeu!", width / 2, height / 2);
      textSize(24);
      text("Pontos: " + points, (width / 2), (height / 2) + 75);
    }
    
    if (level > 8){
      textAlign(CENTER, CENTER);
      textSize(72);
      noLoop();
      text("Você venceu!", width / 2, height / 2);
      textSize(24);
      text("Pontos: " + points, (width / 2), (height / 2) + 75);
    }
}

void criarPose(){
  if (level == 0){
    pose.angle1 = 0.0;
    pose.angle2 = 1.5707964;
    pose.angle3 = 1.5707964;
    pose.angle4 = 0;
    pose.angle5 = 0;
    pose.angle6 = 0;
    pose.angle7 = 0;
    pose.angle8 = 0;
    pose.angle9 = -0.7853982;
    pose.angle10 = 2.3561945;
    pose.angle11 = -0.7853982;
    pose.angle12 = -0.7853982;
    pose.angle13 = -0.7853982;
    pose.angle14 = -0.7853982;
    pose.angle15 = 3.1415927;
  } else if (level == 1){
    pose.angle1 = 0.0;
    pose.angle2 = 1.5707964;
    pose.angle3 = 3.1415927;
    pose.angle4 = 0;
    pose.angle5 = -0.7853982;
    pose.angle6 = 0;
    pose.angle7 = 0.7853982;
    pose.angle8 = 0.5235988;
    pose.angle9 = -0.7853982;
    pose.angle10 = 3.9269907;
    pose.angle11 = -0.7853982;
    pose.angle12 = -0.7853982;
    pose.angle13 = -0.7853982;
    pose.angle14 = -0.7853982;
    pose.angle15 = 3.1415927;
  } else if (level == 2){
    pose.angle1 = 0.0;
    pose.angle2 = 0.0;
    pose.angle3 = 3.1415927;
    pose.angle4 = 0.7853982;
    pose.angle5 = -0.7853982;
    pose.angle6 = -1.5707964;
    pose.angle7 = 1.5707964;
    pose.angle8 = 0.0;
    pose.angle9 = 0.0;
    pose.angle10 = 3.1415925;
    pose.angle11 = 0.7853982;
    pose.angle12 = -0.7853982;
    pose.angle13 = 0.7853982;
    pose.angle14 = -0.7853982;
    pose.angle15 = 3.1415927;
  } else if (level == 3){
    pose.angle1 = 0.0;
    pose.angle2 = 1.5707964;
    pose.angle3 = 1.5707964;
    pose.angle4 = 0.0;
    pose.angle5 = 0.0;
    pose.angle6 = -1.5707964;
    pose.angle7 = 1.5707964;
    pose.angle8 = -0.5235988;
    pose.angle9 = 0.7853982;
    pose.angle10 = 2.3561945;
    pose.angle11 = 0.0;
    pose.angle12 = -0.7853982;
    pose.angle13 = 0.0;
    pose.angle14 = -0.7853982;
    pose.angle15 = 3.6651912;
  } else if (level == 4){
    pose.angle1 = 0.0;
    pose.angle2 = 0.0;
    pose.angle3 = 3.1415927;
    pose.angle4 = 0.0;
    pose.angle5 = 0.0;
    pose.angle6 = -1.5707964;
    pose.angle7 = 1.5707964;
    pose.angle8 = 0.0;
    pose.angle9 = 1.5707964;
    pose.angle10 = 1.570796;
    pose.angle11 = 0.0;
    pose.angle12 = 0.0;
    pose.angle13 = 0.0;
    pose.angle14 = 0.0;
    pose.angle15 = 3.1415925;
  } else if (level == 5){
    pose.angle1 = 0.0;
    pose.angle2 = 0.7853982;
    pose.angle3 = 2.3561945;
    pose.angle4 = 1.5707964;
    pose.angle5 = -1.5707964;
    pose.angle6 = 0.0;
    pose.angle7 = 0.0;
    pose.angle8 = 0.0;
    pose.angle9 = -1.5707964;
    pose.angle10 = 4.712389;
    pose.angle11 = 0.0;
    pose.angle12 = 0.0;
    pose.angle13 = 0.0;
    pose.angle14 = 0.0;
    pose.angle15 = 3.1415925;
  } else if (level == 6){
    pose.angle1 = 0.0;
    pose.angle2 = 1.5707964;
    pose.angle3 = 3.1415927;
    pose.angle4 = 0.7853982;
    pose.angle5 = -0.7853982;
    pose.angle6 = -1.5707964;
    pose.angle7 = 1.5707964;
    pose.angle8 = 0.5235988;
    pose.angle9 = 0.7853982;
    pose.angle10 = 3.9269907;
    pose.angle11 = 0.0;
    pose.angle12 = 0.0;
    pose.angle13 = 0.0;
    pose.angle14 = 0.0;
    pose.angle15 = 3.6651912;
  } else if (level == 7){
    pose.angle1 = 0.0;
    pose.angle2 = 1.5707964;
    pose.angle3 = 1.5707963;
    pose.angle4 = 0.0;
    pose.angle5 = 0.0;
    pose.angle6 = -1.5707964;
    pose.angle7 = 1.5707964;
    pose.angle8 = -0.5235988;
    pose.angle9 = 1.5707964;
    pose.angle10 = 1.570796;
    pose.angle11 = 0.0;
    pose.angle12 = 0.0;
    pose.angle13 = 0.0;
    pose.angle14 = 0.0;
    pose.angle15 = 2.6179938;
  } else if (level == 8){
    pose.angle1 = 0.0;
    pose.angle2 = 1.5707964;
    pose.angle3 = 1.5707963;
    pose.angle4 = 0.0;
    pose.angle5 = 0.0;
    pose.angle6 = 0.0;
    pose.angle7 = 0.0;
    pose.angle8 = 0.0;
    pose.angle9 = 0.0;
    pose.angle10 = 3.1415925;
    pose.angle11 = 0.0;
    pose.angle12 = 0.0;
    pose.angle13 = 0.0;
    pose.angle14 = 0.0;
    pose.angle15 = 3.1415925;
  }
}
