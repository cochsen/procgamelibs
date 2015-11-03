boolean jump;
float speed, gravity, 
  momentum, momentumMin, momentumMax,
  playerWidth, playerHeight;
Player player;

void setup()
{
  size(400,400);
  background(200);
  jump = false;
  speed = 1;
  gravity = 1;
  momentumMin = 0;
  momentumMax = 20;
  momentum = momentumMin;
  playerWidth = playerHeight = 40;
  player = new Player(width/2, height/2, playerWidth, playerHeight);
}

void draw()
{
  background(200);
  player.update(jump);
  player.display();
}

void keyPressed()
{
  if(keyCode == UP)
  {
    momentum = momentumMax;
    jump = true;
  }
  if(keyCode == LEFT)
  {
    if(player.xpos>0+playerWidth/2)
    {
      player.xpos -= 5;  
    }
  }
  if(keyCode == RIGHT)
  {
    if(player.ypos<width-playerWidth/2)
    {
      player.xpos += 5;  
    }
  }
  
}