PImage bkgrd;
float x;

void setup() {
  size(900, 300);
  bkgrd = loadImage("mybackground1.png");
  x = 0.0;
}

void draw() {
  x = backgroundScroll(bkgrd, x, -2.0, width);
}

float backgroundScroll(PImage img, float x, float _speed, int _width) {
  if (x <= -width) {
    x = 0;
  } else {
    x += _speed;  
  }
  image(img, x, 0);
  image(img, x + width, 0);  
  
  return x;
}