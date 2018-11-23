class Articulacao{
  int mult, mult2;
  int x1, y1, s1 = 0;    //Pelvis -> 2, 3, 8
  int x2, y2, s2 = 0;    //Perna Direita -> 
  int x3, y3, s3 = 0;    //Perna Esquerda
  int x4, y4, s4 = 0;    //Panturrilha Direita
  int x5, y5, s5 = 0;    //Panturrilha Esquerda
  int x6, y6, s6 = 0;    //Pé Direito
  int x7, y7, s7 = 0;    //Pé Esquerdo
  int x8, y8, s8 = 0;    //Torso
  int x9, y9, s9 = 0;    //Bíceps Direito
  int x10, y10, s10 = 0; //Bíceps Esquerdo
  int x11, y11, s11 = 0; //Antebraço Direito
  int x12, y12, s12 = 0; //Antebraço Esquerdo
  int x13, y13, s13 = 0; //Mão Direita
  int x14, y14, s14 = 0; //Mão Esquerda
  int x15, y15, s15 = 0; //Cabeça
  
  boolean movement;
  int artAtual;
  float angle1, angle2, angle3, angle4, angle5, angle6, angle7, angle8;
  float angle9, angle10, angle11, angle12, angle13, angle14, angle15;
  PShape formaPelvis, formaCabeca;
  Articulacao(int x, int y, boolean move){
    y1 = y; x1 =  x;angle1 = 0;
    x2 = 40; y2 = 0; angle2 = PI/2;
    x3 = -40; y3 = 0; angle3 = PI/2;
    x4 = 120; y4 = 0; angle4 = 0;
    x5 = 120; y5 = 0; angle5 = 0;
    x6 = 70; y6 = 0; angle6 = 0;
    x7 = 70; y7 = 0; angle7 = 0;
    x8 = 0; y8 = -30; angle8 = 0;
    x9 = 65; y9 = -140; angle9 = 0;
    x10 = -65;y10 = -140;angle10 = PI;
    x11 = 90;y11 = 0;angle11 = 0;
    x12 = 90;y12 = 0;angle12 = 0;
    x13 = 90;y13 = 0;angle13 = 0;
    x14 = 90;y14 = 0;angle14 = 0;
    x15 = 0;y15 = -150;angle15 = PI;
    movement = move;
    
    artAtual = 13;
    teclas = new boolean[3];
    strokeWeight(2);
    mult = 8;
    mult2 = 10; 
    formaPelvis = createShape();          //Forma da pelvis
    formaPelvis.beginShape();
    formaPelvis.stroke(s1, 0, 0);
    formaPelvis.vertex(6*mult,-4*mult);
    formaPelvis.vertex(6*mult,0*mult);
    formaPelvis.vertex(2*mult,4*mult);
    formaPelvis.vertex(-2*mult,4*mult);
    formaPelvis.vertex(-6*mult,0*mult);
    formaPelvis.vertex(-6*mult,-4*mult);
    formaPelvis.vertex(6*mult,-4*mult);
    formaPelvis.endShape();
    
    formaCabeca = createShape();          //Forma da cabeça
    formaCabeca.beginShape();
    formaCabeca.stroke(s1,0,0);
    formaCabeca.vertex(0*mult2,0*mult2);
    formaCabeca.vertex(-4*mult2,4*mult2);
    formaCabeca.vertex(-4*mult2,10*mult2);
    formaCabeca.vertex(4*mult2,10*mult2);
    formaCabeca.vertex(4*mult2,4*mult2);
    formaCabeca.vertex(0,0);
    formaCabeca.endShape();
    
  }
  
  void drawArticulacao(){
    updateArticulacao();
  }
  
  void updateArticulacao(){
    //Pelvis(base de tudo)
    pushMatrix();
      formaPelvis.beginShape();
      formaPelvis.stroke(s1,0,0);
      formaPelvis.endShape();
      translate(x1, y1);
      rotate(angle1);
      shape(formaPelvis);
      //Torso 
      pushMatrix();
        stroke(s8,0,0);
        translate(x8,y8);
        rotate(angle8);
        triangle(0,10,75,-150,-75,-150);
        //Bíceps Direito
        pushMatrix();
          stroke(s9,0,0);
          translate(x9,y9);
          rotate(angle9);
          rect(0,-22.5,100,45);
          //Antebraço Direito
          pushMatrix();
            stroke(s11,0,0);
            translate(x11,y11);
            rotate(angle11);
            rect(0,-15,100,30);
            //Mão Direita
            pushMatrix();
              stroke(s13,0,0);
              translate(x13,y13);
              rotate(angle13);
              rect(0,-20,50,40);
            popMatrix();
          popMatrix();
        popMatrix();
        //Bíceps Esquerdo
        pushMatrix();
          stroke(s10,0,0);
          translate(x10,y10);
          rotate(angle10);
          rect(0,-22.5,100,45);
          //Antebraço Esquerdo
          pushMatrix();
            stroke(s12,0,0);
            translate(x12,y12);
            rotate(angle12);
            rect(0,-15,100,30);
            //Mão Esquerda
            pushMatrix();
              stroke(s14,0,0);
              translate(x14,y14);
              rotate(angle14);
              rect(0,-20,50,40);
            popMatrix();
          popMatrix();
        popMatrix();
        //Cabeça
        pushMatrix();
          formaCabeca.beginShape();
          formaCabeca.stroke(s15,0,0);
          formaCabeca.endShape();
          translate(x15,y15);
          rotate(angle15);
          shape(formaCabeca);
        popMatrix();
      popMatrix();
      //Perna Direita
      pushMatrix();
        stroke(s2, 0, 0);
        translate(x2, y2);
        rotate(angle2);
        rect(-10, -20, 150, 40);
        //Panturrilha Direita
        pushMatrix();
          stroke(s4, 0, 0);
          translate(x4, y4);
          rotate(angle4);
          rect(-15, -15, 100, 30);
          //Pé Direito
          pushMatrix();
            stroke(s6,0,0);
            translate(x6,y6);
            rotate(angle6);
            rect(-15,-15,60,30);
          popMatrix();
        popMatrix();
      popMatrix();
      //Perna Esquerda
      pushMatrix();
        stroke(s3, 0, 0);
        translate(x3, y3);
        rotate(angle3);
        rect(-10, -20, 150, 40);
        //Panturrilha Esquerda
        pushMatrix();
          stroke(s5, 0, 0);
          translate(x5, y5);
          rotate(angle5);
          rect(-15, -15, 100, 30);
          //Pé Esquerdo
          pushMatrix();   
            stroke(s7,0,0);
            translate(x7,y7);
            rotate(angle7);
            rect(-15,-15,60,30);
          popMatrix();
        popMatrix();
      popMatrix();
    popMatrix();
    
    if(movement){              //Movimentação de cada parte
      if(teclas[0]){             //Quantidade de rotação
        if(artAtual == 1){         //Pelvis
        } else if(artAtual == 2){  //Perna direita
          if(angle2 >= PI/2){
            angle2 = 0;
          }
          else{
          angle2 += PI/4;
          }
        } else if(artAtual == 3){  //Perna esquerda
          if(angle3 <= PI/2){
            angle3 = PI;
          }
          else{
          angle3 -= PI/4;
          }
        } else if(artAtual == 4){  //Panturrilha direita
          if(angle4 >= PI/2){
            angle4 = 0;
          }
          else{
          angle4 += PI/4;
          }
        } else if(artAtual == 5){  //Panturrilha esquerda
          if(angle5 <= -PI/2){
            angle5 = 0;
          }
          else{
          angle5 -= PI/4;
          }
        } else if(artAtual == 6){  //Pé direito
          if(angle6 > -PI/2){
            angle6 -= PI/4;
          }else{
            angle6 = 0;
          }
        } else if(artAtual == 7){  //Pé esquerdo
          if(angle7 < PI/2){
            angle7 += PI/4;
          }
          else{
            angle7 = 0;
          }
        } else if(artAtual == 8){  //Torso
          if(angle8 < PI/6){
            angle8 += PI/6;
          }else{
            angle8 = -PI/6;
          }
        } else if(artAtual == 9){  //Bíceps direito
          if(angle9 < (2*PI)/4){
            angle9 += PI/4;
          }else{
            angle9 = (2*-PI)/4;
          }
        } else if(artAtual == 10){ //Bíceps esquerdo
          if(angle10 > PI/2){
            angle10 -= PI/4;
          }else{
            angle10 = PI+PI/2;
          }
        } else if(artAtual == 11){ //Antebraço direito
          if(angle11 > -PI/2){
            angle11 -= PI/4;
          }
          else{
            angle11 = PI/2;
          }
        } else if(artAtual == 12){ //Antebraço esquerdo
          if(angle12 > -PI/2){
            angle12 -= PI/4;
          }
          else{
            angle12 = PI/2;
          }
        } else if(artAtual == 13){ //Mão direita
          if(angle13 > -PI/4){
            angle13 -= PI/4;
          }else{
            angle13 = PI/4;
          }
        } else if(artAtual == 14){ //Mão esquerda
          if(angle14 > -PI/4){
            angle14 -= PI/4;
          }else{
            angle14 = PI/4;
          }
        } else if(artAtual == 15){ //Cabeça
          if(angle15 < PI+PI/6-0.1){//<-0.1 == Gambiarra
            angle15 += PI/6;
          }else{
            angle15 = PI+-PI/6;
          }
        } 
      }
      
      if(teclas[2]){ //Definindo articulação atual
        if(artAtual == 15){
          artAtual = 1;
        }else{
          artAtual += 1;
        }
      }
      if(teclas[1]){
        if(artAtual == 1){
          artAtual = 15;
        }else{
          artAtual -= 1;
        }
      }
      
      if(artAtual == 1) s1 = 255; else s1 = 0;  //Colorindo a articulação atual
      if(artAtual == 2) s2 = 255; else s2 = 0;
      if(artAtual == 3) s3 = 255; else s3 = 0;
      if(artAtual == 4) s4 = 255; else s4 = 0;
      if(artAtual == 5) s5 = 255; else s5 = 0;
      if(artAtual == 6) s6 = 255; else s6 = 0;
      if(artAtual == 7) s7 = 255; else s7 = 0;
      if(artAtual == 8) s8 = 255; else s8 = 0;
      if(artAtual == 9) s9 = 255; else s9 = 0;
      if(artAtual == 10) s10 = 255; else s10 = 0;
      if(artAtual == 11) s11 = 255; else s11 = 0;
      if(artAtual == 12) s12 = 255; else s12 = 0;
      if(artAtual == 13) s13 = 255; else s13 = 0;
      if(artAtual == 14) s14 = 255; else s14 = 0;
      if(artAtual == 15) s15 = 255; else s15 = 0;
    }
  }
}
