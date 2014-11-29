
void setup() {
  PImage img = loadImage("monalisa.jpg");
  size(img.width, img.height);
  int minPoint = 4;
  int maxPoint = 16;
  imageMode(CENTER);
  noStroke();
  background(255);
  
  for (int i = 0; i < 100000; i++) {
    float nDim = map(random(0, width), 0, width, minPoint, maxPoint);
    int x = int(random(img.width));
    int y = int(random(img.height));
    color pix = img.get(x, y);
    fill(pix, 64);
    if (random(100) < 50) {
      ellipse(x, y, nDim, nDim);
    } else {
      rect(x, y, nDim, nDim);
    }
  }
}

