Particle[] particle;
int asteroidX=400;
int asteroidY=400;
int starX=0;
int starY=0;
int timer=1000000000;
void setup(){
  size(800,800);
  particle= new Particle[100];
  for(int i=0;i< 10;i++){
    particle[i]= new OddParticle();
  }
  for(int i=10;i< particle.length;i++){
    particle[i]= new Particle();
  }
  for(int i=0;i< particle.length;i++){
        particle[i].myX=100000000;
        particle[i].myY=100000000;
      }
 
 
 
}
void draw(){
  background(0);
  for(int i=0;i<100;i++){
    noStroke();
    fill(252,252,252);
    ellipse(starX,starY, 5,5);
    starX=(int)(Math.random()*800);
    starY=(int)(Math.random()*800);
  }
  fill(56, 54, 49);
  stroke(5);
  strokeWeight(3);
  ellipse(asteroidX,asteroidY,120,120);
  ellipse(asteroidX-20,asteroidY, 30,20);
  ellipse(asteroidX+20, asteroidY,18,20);
  ellipse(asteroidX-30, asteroidY+30,20,20);
  ellipse(asteroidX, asteroidY+30,20,25);
  ellipse(asteroidX+25, asteroidY+30,17,20);
  ellipse(asteroidX+20, asteroidY-30,20,20);
  ellipse(asteroidX-10, asteroidY-30,20,22);

  asteroidX+=(int)(Math.random()*5)-2;
  asteroidY+=(int)(Math.random()*5)-2;

  for(int i=0; i<particle.length;i++){
    particle[i].move();
    particle[i].show();
  }

}
void mousePressed(){
 
  
  if(mouseX<asteroidX+60 && mouseX>asteroidX-60){
    if(mouseY<asteroidY+60 && mouseY>asteroidY-60){
      while(timer>=0){
        timer--;
      }
      for(int i=0;i< particle.length;i++){
        particle[i].myX=mouseX;
        particle[i].myY=mouseY;
      }
      asteroidX=(int)(Math.random()*800);
      asteroidY= (int)(Math.random()*800);
      for(int i=0;i<timer;i--){
      timer=1000;
      }
    }
  }

}
class Particle{
  double myX, myY, myColor, mySpeed, myAngle, mySize;
  Particle(){
    myX=400;
    myY=400;
    mySpeed= Math.random()*10.0;
    myAngle= Math.random()*(2*Math.PI);
    myColor= color((int)(Math.random()*256), (int)(Math.random()*256), (int)(Math.random()*256));
    mySize= 20;
  }
  void move(){
    myX=myX+(Math.cos(myAngle)*mySpeed);
    myY=myY+(Math.sin(myAngle)*mySpeed);
  }
  void show(){
   
   fill(56, 54, 49);
    ellipse((float)myX, (float)myY, (float)mySize,(float)mySize);
  }
 
}
class OddParticle extends Particle{
  OddParticle() {
    myX=400;
    myY=400;
    mySpeed= Math.random()*3.0;
    myAngle= Math.random()*(2*Math.PI);
    myColor= color((int)(Math.random()*256), (int)(Math.random()*256), (int)(Math.random()*256));
    mySize= 45;
  }
 
}
