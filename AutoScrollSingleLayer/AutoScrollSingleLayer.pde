PImage bkgrd;

float x;

void setup() {
  size(900, 300);
  bkgrd = loadImage("cityscape.jpg");
  x = 0;
}

void draw() {
    if (x <= -width) {
      x = 0;
    } else {
      x -= 2.0;  
    }
    image(bkgrd, x, 0);
    image(bkgrd, x + width, 0);
}