// Original: Marius Watz - http://workshop.evolutionzone.com

void setup() {
  PImage img = loadImage("monalisa.jpg");
  size(img.width, img.height);

  noLoop();
  smooth();
  background(0);

  int N = 5;
  int N2 = 5;

  int F1 = (random(100) < 50 ? N2 : 0);
  int F2 = (random(100) < 50 ? N2 : 0);
  int F3 = (random(100) < 50 ? N2 : 0);
  int F4 = (random(100) < 50 ? N2 : 0);

  int what = (int)random(4);

  stroke(255);
  for (int i = 0; i < width; i++) {
    for (int j = 0; j < height; j++) {
      int col = img.get(i * N, j * N);
      float bright = (brightness(col) / 255) * 8;

      stroke(col); // OPTIONAL
      strokeWeight(bright/2);

      int howManyLines = (int) random(1, 4);   //OPTIONAL

       /*F1 = (random(100) < 50 ? N2 : 0);   //OPTIONALS
       F2 = (random(100) < 50 ? N2 : 0);
       F3 = (random(100) < 50 ? N2 : 0);
       F4 = (random(100) < 50 ? N2 : 0);*/

      for (int k = 0; k < howManyLines; k++) {
        if (what == 0) {
          line(i * N2 + F1, j * N2 + F2, i * N2 + F3, j * N2 + F4);
        } else if (what == 1) {
          line(i * N2, j * N2 + N2, i * N2 + N2, j * N2);
        } else if (what == 2) {
          line(i * N2, j * N2, i * N2 + N2, j * N2 + N2);
        } else {
          line(i * N2 + N2, j * N2, i * N2 + N2, j * N2 + N2);
        }
      }
    }
  }
  
  save("e4r1.jpg");
}

