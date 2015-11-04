boolean exploding;
int counter;
int cellSize;
int columns, rows;
float[][] xdir, ydir, particleSizes, particleScaling;
PImage img;

void setup()
{
  size(400, 400);
  background(0);
  exploding = false;
  counter = 0;
  cellSize = 4;
  img = loadImage("actor.png");
  columns = img.width / cellSize;
  rows = img.height / cellSize;
  xdir = new float[columns][rows];
  ydir = new float[columns][rows];
  particleSizes = new float[columns][rows];
  particleScaling = new float[columns][rows];
  for(int i=0; i<columns; i++)
  {
    println();
    for(int j=0; j<rows; j++)
    {
      xdir[i][j] = random(-10,10);
      ydir[i][j] = random(-10,10);
      particleSizes[i][j] = cellSize;
      particleScaling[i][j] = random(1);
      print(particleSizes[i][j] + " ");
    }
  }
}

void draw()
{
  background(0);
  if(exploding == false)
  {
    rectMode(CORNER);
    image(img, width/2-img.width/2, height/2-img.height/2, img.width, img.height);
  }
  else
  {
    explode();
  }
}

void explode()
{
  if(counter<60)
  {
    for(int i=0; i<columns; i++)
    {
      for(int j=0; j<rows; j++)
      {
        float x = i*cellSize+cellSize/2;
        float y = j*cellSize+cellSize/2;
        float loc = x+y*img.width;
        color c = img.pixels[int(loc)];
        particleSizes[i][j] = particleSizes[i][j] + 0.5*particleScaling[i][j];
        pushMatrix();
        translate(x+xdir[i][j], y+ydir[i][j]);
        fill(c, 204);
        noStroke();
        rectMode(CENTER);
        rect(width/2-img.width/2, height/2-img.height/2, particleSizes[i][j], particleSizes[i][j]);
        popMatrix();
        xdir[i][j] = xdir[i][j] + 0.1*xdir[i][j];
        ydir[i][j] = ydir[i][j] + 0.1*ydir[i][j];        
      }
    }
    counter++;
  }
  else
  {
    exploding = false;
    counter = 0;
    cellSize = 4;
    for(int i=0; i<columns; i++)
    {
      println();
      for(int j=0; j<rows; j++)
      {
        xdir[i][j] = random(-10,10);
        ydir[i][j] = random(-10,10);
        particleSizes[i][j] = cellSize;
        print(ydir[i][j] + " ");
      }
    }    
  }
}

void mousePressed()
{
  exploding = true;
}