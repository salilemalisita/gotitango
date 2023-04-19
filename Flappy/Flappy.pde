import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

import processing.sound.*;


//varibles 
float speed,gap=400,size=150,gapx=800,dead,groundx,groundx1=1920,score=0,highscore=score;
//head
float headx=100,heady=540,headsize=100,yspeed,grav;
//block 1
float x1,y1=random(0,gap);
//block 2
float x2,y2=random(0,gap);//500;//random(200,1080-gap);
//block 3
float x3,y3=random(0,gap);//500;//random(200,1080-gap);
PImage head,up,down,ground,background,gotitango,instruct;
import processing.sound.*;
//SoundFile sound;
//SoundFile sound;
SoundFile intense;
void setup() {

  fullScreen();
  reset();
  head = loadImage("head2.png");
  up = loadImage("up.png");
  down = loadImage("down.png");
  ground = loadImage("ground2.png");
  background = loadImage("background.jpg");
  gotitango = loadImage("gotitango.png");
  instruct= loadImage("instruct.png");
  //sound = new SoundFile(this,"finish.mp3");
 intense = new SoundFile(this,"intense.mp3");
// tryagain = new SoundFile(this,"tryagain.mp3");
}
void draw() {
  imageMode(CORNER);
  rectMode(CORNER);
  image(background,0,0);
  image(instruct,100,50,200,200);
 if (keyCode == UP && score>10) {
 intense.play();}
  groundx+=speed;
  groundx1+=speed;
  if (groundx+1950<0) groundx=width;
  image(ground,groundx,height-75);
  image(ground,groundx+325,height-75);
  image(ground,groundx+650,height-75);
  image(ground,groundx+975,height-75);
  image(ground,groundx+1300,height-75);
  image(ground,groundx+1625,height-75);
  if (groundx1+1950<0) groundx1=width;
  image(ground,groundx1,height-75);
  image(ground,groundx1+325,height-75);
  image(ground,groundx1+650,height-75);
  image(ground,groundx1+975,height-75);
  image(ground,groundx1+1300,height-75);
  image(ground,groundx1+1625,height-75);
    
  yspeed+=grav;
  heady+=yspeed;  
  if (dead==0) if (keyPressed) {
    if (keyCode==UP) {
      yspeed=-15;
      grav = 1;
      speed = -5;
      yspeed = -5;
    }
  }
  imageMode(CENTER);
  image(head,headx,heady);  
  //block 1
  x1+=speed;  
  fill(153,0,0);
  rect(x1,y1,size,-9999);
  rect(x1,y1+gap,size,9999);
  if (x1+size<0) {
    x1 = x3 + gapx;
    y1=random(0,gap);//random(0,1080-gap);
  }
  if (headx>x1 && headx<x1+size && heady<y1 || headx>x1 && headx<x1+size && heady>y1+gap) dead=1;
  if (headx>x1&&headx<x1+size&&dead==0) score+=1;  
  //block 2
  x2+=speed;  
  rect(x2,y2,size,-9999);
  rect(x2,y2+gap,size,9999);
  if (x2+size<0) {
    x2 = x1 + gapx;
    y2=random(0,gap);//random(0,1080-gap);
  }
  if (headx>x2 && headx<x2+size && heady<y2 || headx>x2 && headx<x2+size && heady>y2+gap) dead=1;
  if (headx>x2&&headx<x2+size&&dead==0) score+=1;  
  //block 3
  x3+=speed;  
  rect(x3,y3,size,-9999);
  rect(x3,y3+gap,size,9999);
  if (x3+size<0) {
    x3 = x2 + gapx;
    y3=random(0,gap);//random(0,1080-gap);
  }
  if (headx>x3 && headx<x3+size && heady<y3 || headx>x3 && headx<x3+size && heady>y3+gap) dead=1;
  if (headx>x3&&headx<x3+size&&dead==0) score+=1; 
  if (heady>height-50) dead = 1;
  textAlign(CENTER);
  textSize(100);
  fill(255);
  
  if (dead==0) text(floor(score/29),width/2,100);    
  if (dead==1) {
    if (score>highscore)highscore=score;
   
    
    speed=0;
    if (heady>height*2) {
      reset();
      grav = 0;
      textSize(30);
      rectMode(CENTER);
      fill(255,245,220);
      rect(width/2,height/2,320,170);
      fill(255,140,0);
      rect(width/2,height/2+350,200,100); 
      fill(0);
      text("Your Score:   "+floor(score/29),width/2,height/2-50);
      text("Best Score:   "+floor(highscore/29),width/2,height/2+50);
      textSize(40);
      text("Restart",width/2,height/2+360);
   
      if (mouseX>width/2-100&&mouseX<width/2+100&&mouseY>height/2+300&&mouseY<height/2+400&&mousePressed) {
        reset();
        heady=540;
        yspeed=0;
        dead=0;
        score=0;
         
      }
      image(gotitango,width/2,200,800,500);        
       
    }
  }  
}
void reset() {
  x1=width;
  x2=x1+gapx;
  x3=x2+gapx;
  grav = 0;
  speed=0;
   
}
