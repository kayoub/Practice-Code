Practice-Code
=============
//Variables

//game play on or off
int running=1;

//coordinates of ball
int x;
int y;

//diameter of ball
int sz;

//speed of ball's movement
int speedx=4;
int speedy=4;

//coordinates of left paddle
int leftx=50;
int lefty;

//movement of left paddle
int lmove=7;

//coordinates of right paddle
int rightx=700;

//width of paddles
int rectw=15;

//height of paddles
int recth=70;

//score of left player
int score1=0;

//score of right player
int score2=0;

//maximum score before game over
int scoremax=5;


void setup() {
  size (750, 500); 
  stroke(255, 50, 0);
  sz=25;
  x=width/2;
  y=height/2;
  lefty=height/2;
}

void draw() {
  background(255);

  //begin game
  if (running==1) {

    //ball
    noStroke();
    fill(map(x, 0, width, 50, 200), map(y, 50, height, 50, 200), map(y, 0, height, 50, 200));
    ellipse(x, y, sz, sz);

    //movement of ball
    x=x+speedx;
    y=y+speedy;

    //right paddle
    fill(0, 0, 0);
    rect(rightx, mouseY, rectw, recth);

    //bouncing of ball off right paddle
    if (x+sz/2 >=rightx && y<=mouseY+recth && y>=mouseY) {
      speedx=-abs(speedx);
    }

    //bouncing of ball off top and bottom walls
    if (y+sz/2>=height || y-sz/2<=0) {
      speedy=-speedy;
    }

    //left paddle
    fill(0, 0, 0);
    rect(leftx, lefty, rectw, recth);

    //movement of left paddle
    if (keyPressed) {
      if (key==CODED) {
        if (keyCode == UP) {
          lefty=lefty-lmove;
        }
        if (keyCode == DOWN) {
          lefty=lefty+lmove;
        }
      }
    }

    //bouncing of ball of left paddle
    if (x-sz/2 <=leftx+rectw && y<=lefty+recth && y>=lefty) {
      speedx=abs(speedx);
    }

    //resetting of ball
    if (x+sz/2>=width) {
      x=width/2;
      speedx=-speedx;
      score1+=1;
    }
    if (x-sz/2<=0) {
      x=width/2;
      speedx=-speedx;
      score2+=1;
    }

    //scoring
    fill(200, 20, 70);
    textSize(30);
    text("PLAYER 1 SCORE", 100, 50);
    text(score1, 170, 85);
    text("PLAYER 2 SCORE", 380, 50);
    text(score2, 530, 85);

    if (score1>=scoremax || score2>=scoremax) {
      running=0;
    }
  }

  //end game


  if (running==0) {
    textSize(60);  
    fill(random(255), random(255), random(255));
    //text("GAME OVER!", 210, 200);
    if (score1 > score2) {
      text("Player 1 Wins!", 190, 200);
    }
    else{
      text("Player 2 Wins!", 190, 200);
    }
  }
  if (keyPressed && key == ' ') {
    //start a new game
    score1=0;
    score2=0;
    running=1;
  }
}
