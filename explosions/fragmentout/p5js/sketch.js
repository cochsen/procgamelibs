var img;
function preload() {
  img = loadImage("assets/actor.png");
}

var columns, rows;
var exploding;
var cellSize;
var xdir, ydir, particleSizes, particleScaling;

function setup() {
  createCanvas(400, 400);
  setupEnv();
}

function draw() {
  background(0);
  if (exploding === false) {
    imageMode(CENTER);
    image(img, width/2, height/2);
  }
  else {
    explode();
  }
}

function explode() {
  if(counter < frameRate()) {
    for(var i=0; i<columns; i++) {
      for(var j=0; j<rows; j++) {
        var x = i*cellSize+cellSize/2;
        var y = i*cellSize+cellSize/2;
        var loc = x+y*img.width;
        var d = pixelDensity();
        img.loadPixels();
        var c = img.get(i,j);
        if(counter<frameRate/4)
          particleSizes[i][j] = particleSizes[i][j] + 0.5*particleScaling[i][i];
        else
          particleSizes[i][j] = particleSizes[i][j] - 0.5*particleScaling[i][i];
        push();
        translate(x+xdir[i][j], y+ydir[i][j]);
        fill(c, 204);
        noStroke();
        rectMode(CENTER);
        rect(width/2-img.width/2, height/2-img.height/2, particleSizes[i][j], particleSizes[i][j]);
        pop();
        xdir[i][j] = xdir[i][j] + 0.1*xdir[i][j];
        ydir[i][j] = ydir[i][j] + 0.1*ydir[i][j];
      }
    }
    counter++;
  }
  else {
    setupEnv();
  }
}

function mousePressed() {
  exploding = true;
}

function setupEnv() {
  exploding = false;
  counter = 0;
  cellSize = 4;
  columns = img.width / cellSize;
  rows = img.height / cellSize;
  xdir = [];
  ydir = [];
  particleSizes = [];
  particleScaling = [];
  for(var i=0; i<columns; i++) {
    xdir[i] = [];
    ydir[i] = [];
    particleSizes[i] = [];
    particleScaling[i] = [];
    for(var j=0; j<rows; j++) {
      xdir[i][j] = (Math.random() < 0.5 ? -1 : 1)*(Math.random())*20;
      ydir[i][j] = (Math.random() < 0.5 ? -1 : 1)*(Math.random())*20;
      particleSizes[i][j] = cellSize;
      particleScaling[i][j] = Math.random();
      console.log("xdir: " + xdir[i][j] + ", ydir: " + ydir[i][j] + ", particleSize: " + particleSizes[i][j]);  
    }
  }  
}
