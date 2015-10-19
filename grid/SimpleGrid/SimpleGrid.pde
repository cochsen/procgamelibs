ArrayList<Integer> x = new ArrayList<Integer>();
ArrayList<Integer> y = new ArrayList<Integer>();

int w=30, h=30, bs=20;

void setup() {
  size(600, 600); 
  for(int i=0; i<w; i+=2) x.add(i);
  for(int j=0; j<h; j+=2) y.add(j);
}

void draw() {
  background(255);
  for(int i=0; i<w; i++) line(i*bs, 0, i*bs, height);
  for(int i=0; i<h; i++) line(0, i*bs, width, i*bs);
  for(int i=0; i<x.size(); i++) {
    for(int j=0; j<y.size(); j++) {
      fill(80);
      rect(x.get(i)*bs, y.get(j)*bs, bs, bs);      
    }
  }
}