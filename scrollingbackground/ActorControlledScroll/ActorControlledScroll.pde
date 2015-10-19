PImage bkgrd;
float backgroundX, backgroundSpeed;  // location, speed
float actorX, actorY, actorSpeed;

void setup() {
  size(900, 300);
  bkgrd = loadImage("mybackground1.png");
  backgroundX = 0.0;
  actorX = width/2;
  actorY = height - 45;
  backgroundSpeed = actorSpeed = 10.0;
  image(bkgrd, backgroundX, 0);
  image(bkgrd, backgroundX + width, 0);
}

void draw() {
  drawBackground(bkgrd, backgroundX);
  rectMode(CENTER);
  rect(actorX, actorY, 20, 20);
}

void keyPressed() {
  if (key == 'a') {
    if (actorX > width / 4.0) {
      moveActor(-1);    
    } else {
      backgroundX = moveBackground(-1, backgroundX, backgroundSpeed);
    }
  }
  if (key == 'd') {
    if (actorX < 3.0 * width / 4.0) {
      moveActor(1);
    } else {
      backgroundX = moveBackground(1, backgroundX, backgroundSpeed);
    }    
  }
  print("backgroundX: " + backgroundX + "\n");
}

void moveActor(int _dir) {
  if (_dir == -1) {
    actorX -= actorSpeed;
  }
  if (_dir == 1) {
    actorX += actorSpeed;
  }
}

float moveBackground(int _dir, float _x, float _speed) {
  if (_dir == -1) {
    if (_x >= width) {
      _x = 0;
    } else {
      _x += _speed;
    }
  }
  if (_dir == 1) {
    if (_x <= -width) {
      _x = 0;
    } else {
      _x -= _speed;
    }
  }
  print("width: " + width + ", _x: " + _x + "\n");
  return _x;
}

void drawBackground(PImage img, float _x) {
  image(img, _x, 0);
  image(img, _x + width, 0);  
  image(img, _x - width, 0);
}