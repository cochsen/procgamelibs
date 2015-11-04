PImage pImg;
Player player;

void setup()
{
  size(400, 400);
  background(0);
  pImg = loadImage("actor.png");
  player = new Player(pImg, width/2, height/2);
}

void draw()
{
  background(0);
  player.display();
}

void mousePressed()
{
  player.update(true);
}