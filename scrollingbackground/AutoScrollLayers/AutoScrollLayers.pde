PGraphics layer1, layer2;
PImage myBackground1, myBackground2;
float x1, x2, speed1, speed2;

void setup() {
  size(900, 300);
  myBackground1 = loadImage("mybackground2.png");
  myBackground2 = loadImage("mybackground3.png");
  x1 = x2 = 0.0;
  speed1 = -1.0; speed2 = -3.0;
  
  layer1 = createGraphics(width, height);
  layer2 = createGraphics(width, height);
}

void draw() {
  x1 = backgroundScroll(myBackground1, x1, speed1, width);
  x2 = backgroundScroll(myBackground2, x2, speed2, width);
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