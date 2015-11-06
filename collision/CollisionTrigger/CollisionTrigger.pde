boolean counterOn;
int counter;
Player p;
Obstacle o;

void setup()
{
  size(400,400);
  background(225);
  counterOn = false;
  counter = 0;
  p = new Player(width/4, height/2, 40, 40);
  o = new Obstacle(3*width/4, height/2, 60, 60);
}

void draw()
{
  background(225);
  p.update(mouseX,mouseY);
  p.display();
  o.display();
  detectCollision(p.xstart, p.xend, p.ystart, p.yend, o.xstart, o.xend, o.ystart, o.yend);
  println(counterOn);
  startCounter();
}

void detectCollision(float pxstart, float pxend, float pystart, float pyend,
                     float oxstart, float oxend, float oystart, float oyend)
{
  if(pxstart>oxstart && pxend<oxend && pystart>oystart && pyend<oyend)
    counterOn = true;
}

void startCounter()
{
  if(counterOn)
  {
    textAlign(CENTER, TOP);
    textSize(24);
    fill(0);
    text("Counter: " + counter, width/2, height/4);
    if(counter<300)
      counter++;
    else
    {
      counterOn = false;
      counter = 0;
    }
  }
}