PFont menufont;
int screensize; // 0 - fullscreen, 1 - 600x400, 2 - 640x480, 3 - 800x600
int[] screenSizes = {0, 1, 2, 3};
float w, h, textOffSet;

void setup()
{
  size(640,480);
  surface.setResizable(true); 
  screensize = 1;
  resetFonts();
  background(0);
}

void draw()
{
  background(0);
  textAlign(CENTER);
  stroke(255);
  fill(255);
  text("Screen Resolution", width/2, height*3/16);
  setTextColor(0);
  text("600 x 400", width/2, height*4/16);
  setTextColor(1);
  text("640 x 480", width/2, height*5/16);
  setTextColor(2);
  text("800 x 600", width/2, height*6/16);
  setTextColor(3);
  text("Back", width/2, height*8/16);
}

void keyPressed()
{
  switch(keyCode)
  {
    case UP:   
      if(screensize == screenSizes[0]) screensize = screenSizes[screenSizes.length-1];
      else screensize--;
      break;
    case DOWN:
      if(screensize == screenSizes[screenSizes.length-1]) screensize = 0;
      else screensize++;
      break;
    case ENTER:
      setRes();
  }
  println(screensize);
}

void setRes()
{
  switch(screensize)
  {
    case 0:
      surface.setSize(600,400);
      resetFonts();
      break;
    case 1:
      surface.setSize(640,480);
      resetFonts();
      break;      
    case 2:
      surface.setSize(800,600);
      resetFonts();
      break;           
    case 3:
      exit();
  }
}

void resetFonts()
{
  menufont = createFont("SF Atarian System.ttf", height/16);
  textFont(menufont);
}

void setTextColor(int n)
{
  if(screensize == n)
  {
    stroke(0,0,255);
    fill(0,0,255);
  }
  else
  {
    stroke(255);
    fill(255);
  }
}