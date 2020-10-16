Ball ball;
BallBat batleft;
BallBat batright;
void setup()
{
size(800,600);
ball=new Ball(width/2,height/2,50);
batleft=new BallBat(20,height/2,40,200);
batright=new BallBat(width-20,height/2,40,200);
ball.ballspeedx=3;
ball.ballspeedy=random(-2,2);
}
void draw()
{
background(0);
ball.move_ball();
ball.draw();
ball.bouce_ball();
batleft.move_BallBat();
batleft.draw();
batright.move_BallBat();
batright.draw();
batright.draw();
hit_ball();
textSize(40);
textAlign(CENTER);
text(ball.scoreright, width/2+200, 30);
text(ball.scoreleft, width/2-200, 30);
}
class Ball
{
  float ballx;
  float bally;
  float ballspeedx;
  float ballspeedy;
  float ballsize;
  int scoreleft;
  int scoreright;
  Ball(float tempX,float tempY,float tempSize)
  {
   this.ballx=tempX;
   this.bally=tempY;
   this.ballsize=tempSize;
   this.ballspeedx=0;
   this.ballspeedy=0;
   this.scoreleft=0;
   this.scoreright=0;
  }

void move_ball()
{
  this.ballx=this.ballx+this.ballspeedx;
  this.bally=this.bally+this.ballspeedy;
}

void draw()
{
  ellipse(this.ballx,this.bally,this.ballsize,this.ballsize);
}

void bouce_ball()
{
if(this.ball_right()>width)
{
this.scoreleft=this.scoreleft+1;
this.ballx=width/2;
this.bally=height/2;
ball.ballspeedx=3;
ball.ballspeedy=random(-2,2);
}
if(this.ball_left()<0)
{
this.scoreright=this.scoreright+1;
this.ballx=width/2;
this.bally=height/2;
ball.ballspeedx=3;
ball.ballspeedy=random(-2,2);
}
if(this.ball_bottom()>height)
{
this.ballspeedy=-this.ballspeedy;
}
if(this.ball_top()<0)
{
this.ballspeedy=-this.ballspeedy;
}
}

float ball_left()
{
  return this.ballx-this.ballsize/2;
}  
float ball_right()
{
  return this.ballx+this.ballsize/2;
}  
float ball_top()
{
  return this.bally-this.ballsize/2;
}  
float ball_bottom()
{
  return this.bally+this.ballsize/2;
}  
}

public class BallBat
{
float batx;
float baty;
float bat_width;
float bat_height;
float offset=0.0;
boolean overbat=false;
boolean locked=false;
  public BallBat(float tempX,float tempY,float tempWidth,float tempHeight)
   {
   this.batx=tempX;
   this.baty=tempY;
   this.bat_width=tempWidth;
   this.bat_height=tempHeight;

   }
void move_BallBat()
{
this.check();
this.mouseDragged();
this.mouseReleased();
}
void draw()
{
  if(mouseX>bat_left() && mouseX<bat_right()&&  mouseY >bat_top()&& mouseY<bat_bottom())
{
this.overbat=true;
}
else
{
this.overbat=false;
}
  rect(batx-bat_width/2,baty-bat_height/2,bat_width,bat_height);
}
void check() {
  if(mousePressed==true)
  {
  if(this.overbat) { 
   this.locked = true; 
  
}
  
  else {
    this.locked = false;
  }
  
  }
}

void mouseDragged()
  {
  if(this.locked) {

  baty=baty+mouseY-pmouseY; 
  
  
}

}
void mouseReleased() {
  this.locked = false;
}
void hit_Ball()
{

}

float bat_left()
{
return this.batx-this.bat_width/2;
}

float bat_right()
{
return this.batx+this.bat_width/2;
}

float bat_top()
{
return this.baty-this.bat_height/2;
}

float bat_bottom()
{
return this.baty+this.bat_height/2;
}


}
class PongGame
{
int score_player1=0;
int score_player2=0;
void start_game()
{
}

void count_score()
{
} 

void reset_game()
{
}
}
void hit_ball()
{
  if(ball.ball_left()<batleft.bat_right()&&ball.bally>batleft.bat_top()&&ball.bally<batleft.bat_bottom())
  {
  ball.ballspeedx = -ball.ballspeedx;
  if(ball.ballspeedx>0)
    {
      ball.ballspeedx+=1;
    }
  if(ball.ballspeedx<0)
    {
      ball.ballspeedx-=1;
    }
  ball.ballspeedy=map(ball.bally-batleft.baty,-batleft.bat_height/2,batleft.bat_height/2,-10,10);
  }

  if( ball.ball_right() > batright.bat_left() && ball.bally > batright.bat_top() && ball.bally < batright.bat_bottom())
    {
    ball.ballspeedx = -ball.ballspeedx;
    if(ball.ballspeedx>0)
    {
      ball.ballspeedx+=1;
    }
    if(ball.ballspeedx<0)
    {
      ball.ballspeedx-=1;
    }
  ball.ballspeedy = map(ball.bally -batright.baty, -batright.bat_height/2, batright.bat_height/2, -10, 10);
  }
}
