// Source: http://www.openprocessing.org/sketch/22557

void setup() {
  PImage img = loadImage("monalisa.jpg");
  size(img.width, img.height);
  background(0);

  image(img, 0, 0); //draw the image

  for (int i = 0; i < 5000; i++) {
    int xp = int(random(width));
    int yp = int(random(height));
    color c = img.get(xp, yp);
    fill(c, 50); 
    strokeWeight(1); //OPTIONAL
    stroke(0, 50); //OPTIONAL
    rect(xp, yp, random(10, 50), random(10, 50));
  }
  
  save("e3r1.jpg");
}

