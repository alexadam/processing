// ORIGINAL: 
//P_4_3_1_01.pde
//
// Generative Gestaltung, ISBN: 978-3-87439-759-9
// First Edition, Hermann Schmidt, Mainz, 2009
// Hartmut Bohnacker, Benedikt Gross, Julia Laub, Claudius Lazzeroni
// Copyright 2009 Hartmut Bohnacker, Benedikt Gross, Julia Laub, Claudius Lazzeroni
//
// http://www.generative-gestaltung.de
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at http://www.apache.org/licenses/LICENSE-2.0
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.


PImage img;

void setup() {
  img = loadImage("monalisa.jpg");
  size(img.width, img.height);
  smooth();
  
  background(255);

  //  draw1();
    draw2();
//    draw3();
//    draw4();
//  draw5();
  
  save("e5r1-d2.jpg");
}
void draw1() {
  float x = map(random(width), 0, width, 0.05, 1);
  float y = map(random(height), 0, height, 0.05, 1);

  for (int i = 0; i < img.width; i++) {
    for (int j = 0; j < img.height; j++) {
      float tileWidth = width / (float)img.width;
      float tileHeight = height / (float)img.height;
      float posX = tileWidth * i;
      float posY = tileHeight * j;
      color c = img.pixels[j * img.width + i];
      int greyscale = round(red(c) * 0.222 + green(c) * 0.707 + blue(c) * 0.071);

      float w5 = map(greyscale, 0, 255, 5, 0.2);
      strokeWeight(w5 * y + 0.1);
      color c2 = img.get(min(i + 1, img.width - 1), j);
      stroke(c2);
      int greyscale2 = int(red(c2) * 0.222 + green(c2) * 0.707 + blue(c2) * 0.071);
      float h5 = 50 * x;
      float d1 = map(greyscale, 0, 255, h5, 0);
      float d2 = map(greyscale2, 0, 255, h5, 0);
      line(posX-d1, posY + d1, posX + tileWidth - d2, posY + d2);
    }
  }
}

void draw2() {
  float x = map(random(width), 0, width, 0.05, 1);
  float y = map(random(height), 0, height, 0.05, 1);

  for (int i = 0; i < img.width; i++) {
    for (int j = 0; j < img.height; j++) {
      float tileWidth = width / (float)img.width;
      float tileHeight = height / (float)img.height;
      float posX = tileWidth * i;
      float posY = tileHeight * j;
      color c = img.pixels[j * img.width + i];
      int greyscale = round(red(c) * 0.222 + green(c) * 0.707 + blue(c) * 0.071);

      float w6 = map(greyscale, 0, 255, 25, 0);
      noStroke();
      fill(c);
      ellipse(posX, posY, w6 * x * 2, w6 * x * 2);
    }
  }
}

void draw3() {

  float x = map(random(width), 0, width, 0.05, 1);
  float y = map(random(height), 0, height, 0.05, 1);

  for (int i = 0; i < img.width; i++) {
    for (int j = 0; j < img.height; j++) {
      float tileWidth = width / (float)img.width;
      float tileHeight = height / (float)img.height;
      float posX = tileWidth * i;
      float posY = tileHeight * j;
      color c = img.pixels[j * img.width + i];
      int greyscale = round(red(c) * 0.222 + green(c) * 0.707 + blue(c) * 0.071);

      stroke(c);
      float w7 = map(greyscale, 0, 255, 5, 0.1);
      strokeWeight(w7);
      fill(0, 255 * x);
      pushMatrix();
      translate(posX, posY);
      rotate(greyscale / 255.0 * PI * y);
      rect(0, 0, 50, 50);
      popMatrix();
    }
  }
}

void draw4() {

  float x = map(random(width), 0, width, 0.05, 1);
  float y = map(random(height), 0, height, 0.05, 1);

  for (int i = 0; i < img.width; i++) {
    for (int j = 0; j < img.height; j++) {
      float tileWidth = width / (float)img.width;
      float tileHeight = height / (float)img.height;
      float posX = tileWidth * i;
      float posY = tileHeight * j;
      color c = img.pixels[j * img.width + i];
      int greyscale = round(red(c) * 0.222 + green(c) * 0.707 + blue(c) * 0.071);

      noStroke();
      fill(greyscale, greyscale * x, 255 * y);
      ellipse(posX, posY, 13.5, 53.5); //posY * cos(posY)
      rect(posX+4, posY, 3.5, 3.5);
      rect(posX, posY+4, 3.5, 3.5);
      rect(posX+4, posY+4, 3.5, 3.5);
    }
  }
}

void draw5() {

  float x = map(random(width), 0, width, 0.05, 1);
  float y = map(random(height), 0, height, 0.05, 1);

  for (int i = 0; i < img.width; i++) {
    for (int j = 0; j < img.height; j++) {
      float tileWidth = width / (float)img.width;
      float tileHeight = height / (float)img.height;
      float posX = tileWidth * i;
      float posY = tileHeight * j;
      color c = img.pixels[j * img.width + i];
      int greyscale = round(red(c) * 0.222 + green(c) * 0.707 + blue(c) * 0.071);

      stroke(greyscale, greyscale, greyscale);
      stroke(red(c), green(c), blue(c));
      noFill();
      pushMatrix();
      translate(posX, posY);
      rotate(greyscale/255.0 * PI);
      strokeWeight(1);
      rect(0, 0, 35 * x, 35 * y);
      float w9 = map(greyscale, 0, 255, 15, 0.1);
      strokeWeight(w9);
      stroke(red(c), green(c), blue(c), 70);
      ellipse(0, 0, 50, 25);
      popMatrix();
    }
  }
}

