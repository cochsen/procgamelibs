class Obstacle
{
  float x, y, w, h;
  float xstart, xend, ystart, yend;
  
  Obstacle(float _x, float _y, float _w, float _h)
  {
    x = _x;
    y = _y;
    w = _w;
    h = _h;
    xstart = x-w/2;
    xend = x+w/2;
    ystart = y-h/2;
    yend = y+h/2;
  }
  
  void update(float mx, float my)
  {
    x = mx;
    y = my;
  }
  
  void display()
  {
    rectMode(CENTER);
    fill(100, 200);
    rect(x, y, w, h);
  }    
}