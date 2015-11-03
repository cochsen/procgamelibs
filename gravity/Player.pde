class Player 
{
  float xpos, ypos, w, h;
  
  Player(float _xpos, float _ypos, float _w, float _h)
  {
    xpos = _xpos;
    ypos = _ypos;
    w = _w;
    h = _h;
  }
  
  void update(boolean[] keysLR, boolean jump)
  {
    if(jump == false)
    {
      if(ypos<=height-h)
      {
        ypos += speed;
        speed += gravity;
      }      
      else
        speed = 1;  
    }
    else
    {
      if(momentum>0)
      {
        ypos += speed - momentum;
        momentum -= 1;
        speed += gravity;
      }
      else
      {
        momentum = momentumMin;
        if(ypos<=height-h)
        {
          ypos += speed;
          speed += gravity;
        }      
        else
          speed = 1;  
      }
    }
    if(keysLR[0] == true)
    {
      if(player.xpos>0+playerWidth/2)
        player.xpos -= 5;       
    }
    if(keysLR[1] == true)
    {
      if(player.xpos<width-playerWidth/2)
        player.xpos += 5;      
    }
  }
  
  void display()
  {
    rectMode(CENTER);
    rect(xpos, ypos, w, h);
  }
  
}