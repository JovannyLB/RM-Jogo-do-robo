int x1, y1, x2, y2, points, level = 1, tempo = 0;
float angle1, angle2;
Clock clock;

void setup() {
  size(1200, 800);
  clock = new Clock();
  clock.start();
  tempo = 32 - level * 2;
}

void draw() {
  background(220);
  textAlign(CENTER, CENTER);
  textSize(15);
  fill(0);
  text("PONTOS: " + points,1050,50);
  text("Tempo: " + (tempo - clock.second()), 600, 50);
  text("Level: " + level, 600, 75);
  if(tempo - clock.second() == 0){
    textAlign(CENTER, CENTER);
    textSize(72);
    noLoop();
    text("Você perdeu!", width / 2, height / 2);
    textSize(24);
    text("Pontos: " + points, (width / 2), (height / 2) + 75);
  }
}

///region Testes
void mousePressed()
{
  if (mouseButton==LEFT)
  {
    clock.stop();
  }
  else if (mouseButton==RIGHT)
  {
    clock.start();
  }
}

void keyPressed() {
  if (key == CODED) {
    if (keyCode == UP) {
      points += ((tempo - clock.second()) * 100 * level * 0.5) + 100;
    } else if(keyCode == LEFT){
      clock.stop();
      level--;
      setup();
    }
    else if(keyCode == RIGHT){
      clock.stop();
      level++;
      setup();
    }
  }
}
///end region Testes
