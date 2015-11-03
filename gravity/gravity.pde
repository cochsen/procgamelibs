boolean jump;
float speed, gravity, 
  momentum, momentumMin, momentumMax,
  playerWidth, playerHeight;
boolean[] keysLR;
Player player;

void setup()
{
  size(400,400);
  background(200);
  jump = false;
  speed = 1;
  gravity = 1;
  momentumMin = 0;
  momentumMax = 30;
  momentum = momentumMin;
  playerWidth = playerHeight = 40;
  keysLR = new boolean[2];  // mapping: [LEFT, RIGHT]
  for(int i=0; i<keysLR.length; i++) keysLR[i] = false;  
  player = new Player(width/2, height/2, playerWidth, playerHeight);
}

void draw()
{
  background(200);
  player.update(keysLR, jump);
  player.display();
}

void keyPressed()
{
  if(keyCode == UP)
  {
    if(player.ypos >= height-player.h)
    {
      momentum = momentumMax;
      jump = true;      
    }
  }
  if(keyCode == LEFT) 
    if(keysLR[1] == false)
      keysLR[0] = true;
  if(keyCode == RIGHT) 
    if(keysLR[0] == false)
      keysLR[1] = true;
}

void keyReleased()
{
  if(keyCode == LEFT) keysLR[0] = false; 
  if(keyCode == RIGHT) keysLR[1] = false;
}