class Player
{
  boolean exploding;
  int counter;
  int cellSize;
  int columns, rows;
  float xpos, ypos;
  float[][] pxdir, pydir, pSizes, pScaling;
  PImage img;
  
  Player(PImage _img, float _xpos, float _ypos)
  {
    xpos = _xpos;
    ypos = _ypos;
    img = _img;
    
    // attributes associated with explosion method
    exploding = false;
    counter = 0;
    cellSize = 4;
    columns = img.width / cellSize;
    rows = img.height / cellSize;
    pxdir = new float[columns][rows];
    pydir = new float[columns][rows];
    pSizes = new float[columns][rows];
    pScaling = new float[columns][rows];    

    // initialization of arrays
    for(int i=0; i<columns; i++)
    {
      println();
      for(int j=0; j<rows; j++)
      {
        pxdir[i][j] = random(-10,10);
        pydir[i][j] = random(-10,10);
        pSizes[i][j] = cellSize;
        pScaling[i][j] = random(1);
      }
    }    
  }
  
  void update(boolean _exploding)
  {
    exploding = _exploding;
  }
  
  void display()
  {
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
    if(counter<frameRate/2)
    {
      for(int i=0; i<columns; i++)
      {
        for(int j=0; j<rows; j++)
        {
          float x = i*cellSize+cellSize/2;
          float y = j*cellSize+cellSize/2;
          float loc = x+y*img.width;
          color c = img.pixels[int(loc)];
          if(counter<frameRate/4)
            pSizes[i][j] = pSizes[i][j] + 0.5*pScaling[i][j];
          else
            pSizes[i][j] = pSizes[i][j] - 0.5*pScaling[i][j];
          pushMatrix();
          translate(x+pxdir[i][j], y+pydir[i][j]);
          fill(c, 204);
          noStroke();
          rectMode(CENTER);
          rect(width/2-img.width/2, height/2-img.height/2, pSizes[i][j], pSizes[i][j]);
          popMatrix();
          pxdir[i][j] = pxdir[i][j] + 0.1*pxdir[i][j];
          pydir[i][j] = pydir[i][j] + 0.1*pydir[i][j];        
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
          pxdir[i][j] = random(-10,10);
          pydir[i][j] = random(-10,10);
          pSizes[i][j] = cellSize;
        }
      }    
    }
  }  
}