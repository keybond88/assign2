//You should implement your assign2 here.
final int GAME_START=0;
final int GAME_RUN=1;
final int GAME_OVER=2;
int state;
int bloodSpeed=20;
PImage startImg;
PImage endImg;
PImage bg1Img;
PImage bg2Img;
PImage enemyImg;
PImage fighterImg;
PImage hpImg;
PImage treasureImg;
int bg1x=640;
int bg2x=0;
int x=0;
int y=0;
int hpX=0;
int hpY=0;
int treasureX=0;
int enemyX=0;
int enemyY=floor(random(481));
int treasureY=floor(random (481));
int bloodX=40;
boolean upPressed=false;
boolean downPressed=false;
boolean rightPressed=false;
boolean leftPressed=false;
int fighterImgX;
int fighterImgY;
int speed=5;

void setup () {
  size(640, 480) ;
 state=GAME_START;
 startImg=loadImage("img/start1.png");
  endImg=loadImage("img/end1.png");
   bg1Img=loadImage("img/bg1.png");
  bg2Img=loadImage("img/bg2.png");
  enemyImg=loadImage("img/enemy.png");
  hpImg=loadImage("img/hp.png");
  treasureImg=loadImage("img/treasure.png");
  fighterImg=loadImage("img/fighter.png");
  fighterImgX=width/2;
  fighterImgY=height/2;
}

void draw() {

    switch(state){
       case GAME_START:{
           image(startImg,0,0);
           if (mouseX<460 && 200<mouseX ){
               if(mouseY<420 && 370<mouseY){
                 stroke(0,255,0);
                 noFill();
                 rect(200,370,260,50); 
                 if(mousePressed){
                  fighterImgX=width/2;
                  fighterImgY=height/2;
                   bloodX = 40;
                   state=GAME_RUN;
                  }
               }
           }
           break;
           }
       case GAME_RUN:{
         
         if (upPressed){
          fighterImgY -=speed;
          }
        if (downPressed){
          fighterImgY +=speed;
          }
        if (rightPressed){
          fighterImgX +=speed;
          }
        if (leftPressed){
          fighterImgX -=speed;
          }
        if(fighterImgX>width-50){
           fighterImgX=width-50;
           }
       if(fighterImgX<0){
           fighterImgX=0;
           }
       if(fighterImgY>height-50){
           fighterImgY=height-50;
           }
       if(fighterImgY<0){
           fighterImgY=0;
           }
         bg1x %= 1280;
          x=-640+bg1x;
          image(bg1Img,x,0);
          bg2x %=1280;
          y=-640+bg2x;   
          image(bg2Img,y,0); 
          bg1x=bg1x+5;
          bg2x=bg2x+5;
          enemyX %= 640;
          image(enemyImg,enemyX,enemyY);
          enemyX = enemyX +10;
          image(hpImg,hpX,hpY);
          image(treasureImg,treasureX,treasureY);
          treasureX=treasureX+6;
          image(fighterImg,fighterImgX,fighterImgY);
          fill(255,0,0);
          rect(5,5,bloodX,20);
           if (enemyX >= fighterImgX-20 && enemyX <= fighterImgX+50){
               if(enemyY >= fighterImgY-50 && enemyY <= fighterImgY+50 ){
                 enemyX=0;
                 bloodX -=bloodSpeed;
                                  
               }
            }
             if (treasureX >= fighterImgX-20 && treasureX <= fighterImgX+50){
               if(treasureY >= fighterImgY-50 && treasureY <= fighterImgY+50 ){
                 treasureY=0;
                 bloodX  +=bloodSpeed;
                                  
               }
            }
          if (bloodX <= 0)
             state=GAME_OVER;
          
           break;
         
           }
       case GAME_OVER:{
           image(endImg,0,0);
               if (mouseX<460 && 200<mouseX ){
                    if(mouseY<350 && 300<mouseY){
                       if(mousePressed){
                          state=GAME_START;
                                                }
                    }
                    
            }
          break;
       }     
                 
    }
           
    }
       
   

void keyPressed(){
  if(key==CODED){
   switch (keyCode) {
     case UP:
      upPressed=true;
      break;
     case DOWN:
      downPressed=true;
       break;
     case RIGHT:
     rightPressed=true;
      break;
     case LEFT:
     leftPressed=true;
      break;
     
   
       
   }
    
  }

}
void keyReleased(){
  if(key==CODED){
   switch (keyCode) {
     case UP:
      upPressed=false;
      break;
     case DOWN:
      downPressed=false;
       break;
     case RIGHT:
     rightPressed=false;
      break;
     case LEFT:
     leftPressed=false;
      break;
   }
  }
  
}
