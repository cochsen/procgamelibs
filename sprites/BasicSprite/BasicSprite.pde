Animation animation1, animation2;
PImage left01, right01;

int dir;
float xpos, ypos;

void setup() {
  size(640, 180);
  frameRate(24);
  left01 = loadImage("runleft00.png");
  right01 = loadImage("runright00.png");
  animation1 = new Animation("runleft", 3);
  animation2 = new Animation("runright", 3);
  ypos = height * 0.8;
}

void draw() {
  background(200);
  if (keyPressed) {
    if (key == 'a') {
      if (xpos > 0) {
        xpos -= 5.0;
        dir = -1;
        animation1.display(xpos, ypos);
      }
    }
    if (key == 'd') {
      if (xpos < width) {
        dir = 1;
        xpos += 5.0;
        animation2.display(xpos, ypos);
      }
    }    
  } else {
    if (dir == -1) {
      image(left01, xpos, ypos);  
    } else {
      image(right01, xpos, ypos);  
    }
  }
}

class Animation {
  PImage[] images;
  int imageCount;
  int frame;
  
  Animation(String imagePrefix, int count) {
    imageCount = count;
    images = new PImage[imageCount];
    
    for (int i = 0; i < imageCount; i++) {
      String filename = imagePrefix + nf(i, 2) + ".png";
      images[i] = loadImage(filename);
      print(images[i] + "\n");
    }
  }
  
  void display(float xpos, float ypos) {
    frame = (frame + 1) % imageCount;
    image(images[frame], xpos, ypos);
  }
  
  int getWidth() {
    return images[0].width;  
  }
}