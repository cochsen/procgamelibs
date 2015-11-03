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
  
  void update(boolean jump)
  {
    if(jump == false)
    {
      if(ypos<height-h)
      {
        ypos += speed;
        speed += gravity;
      }      
      else
      {
        speed = 1;  
      }
    }
    else
    {
      if(momentum>0)
      {
        ypos += speed - momentum;
        momentum -= 2;
        speed += gravity;
      }
      else
      {
        momentum = momentumMin;
        if(ypos<height-h)
        {
          ypos += speed;
          speed += gravity;
        }      
        else
        {
          speed = 1;  
        }
      }
    }
  }
  
  void display()
  {
    rectMode(CENTER);
    rect(xpos, ypos, w, h);
  }
  
}