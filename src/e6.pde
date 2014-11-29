int strokeR = (int)random(241, 253);
int strokeG = (int)random(94, 255);
int strokeB = 58;

void setup() {
  size(500, 500);
  smooth();
  background(36, 39, 41);

  float rFactor = 25;

  if (random(100) < rFactor) {
    drawEntity1();
  }
  if (random(100) < rFactor) {
    drawEntity2();
  }
  if (random(100) < rFactor) {
    drawEntity3();
  }
  if (random(100) < rFactor) {
    drawSpray();
  }
  if (random(100) < rFactor) {
    drawLines();
  }
  if (random(100) < rFactor) {
    drawLines2();
  }
  if (random(100) < rFactor) {
    drawLines3();
  }
  if (random(100) < rFactor) {
    drawBrush();
  }
  if (random(100) < rFactor) {
    drawGraphite();
  }
  if (random(100) < rFactor) {
    drawSpiderWeb();
  } 

  if (random(100) < 10) {
    filter(BLUR, 1);
  }
  
  save("e6r1.jpg");
}


void drawEntity1() {
  int nrOfPoints = (int)random(300, 600);
  int nrOfIterations = (int)random(80, 120);

  float gs = 3.0; //random(0.0, 3.0);
  float gx = 0.5; //random(0.0, 1.0);
  float gy = 0.75; //random(0.0, 1.0);
  float a = random(-2.5, 2.5);
  float b = random(-2.5, 2.5);
  float c = random(-2.5, 2.5);
  float d = random(-2.5, 2.5);

  Entity1[] points = new Entity1[nrOfPoints];

  for (int i = 0; i < nrOfPoints; i++) {
    points[i] = new Entity1();
  }

  for (int j = 0; j < nrOfIterations; j++) {
    for (int i = 0; i < nrOfPoints; i++) {
      points[i].nextStep(gs, gx, gy, a, b, c, d);
    }
  }
}

void drawEntity2() {
  int nrOfPoints = (int)random(300, 600);
  int nrOfIterations = (int)random(80, 120);

  float mx = 0;
  float my = 0;
  float limit = 5;
  float factor = 1.05;
  float drag = 0.01;

  Entity2[] points2 = new Entity2[nrOfPoints];

  for (int i = 0; i < nrOfPoints; i++) {
    points2[i] = new Entity2(limit);
  }

  for (int j = 0; j < nrOfIterations; j++) {
    mx += 0.3 * (random(width) - mx);
    my += 0.3 * (random(height) - my);

    for (int i = 0; i < nrOfPoints; i++) {
      points2[i].nextStep(factor, drag, mx, my);
    }
  }
}

void drawEntity3() {
  int nrOfPoints = (int)random(2000, 4000);
  int nrOfIterations = (int)random(80, 120);

  float size = 15; //VARIABLE
  float a = random(TWO_PI);
  float c = cos(a);
  float s = sin(a);
  float scale = 1.0/nrOfPoints;

  Entity3[] points3 = new Entity3[nrOfPoints];

  for (int i = 0; i < nrOfPoints; i++) {
    points3[i] = new Entity3(i * scale, random(1));
  }

  for (int j = 0; j < nrOfIterations; j++) {
    for (int i = 0; i < nrOfPoints; i++) {
      points3[i].nextStep(s, c, size);
    }
  }
}


class Entity1 {
  float x, y;

  public Entity1() {
    x = random(-1.0, 1.0);
    y = random(-1.0, 1.0);
  }

  public void nextStep(float gs, float gx, float gy, float a, float b, float c, float d) {
    x = sin(a * y) - cos(b * x);
    y = sin(c * x) - cos(d * y);

    stroke(strokeR, strokeG, strokeB, (int)(random(25, 100)));
    point((x / gs + gx) * width, (y / gs + gy) * width);
  }
}

class Entity2 {
  float x = 0;
  float y = 0;
  float dx = 0;
  float dy = 0;
  float px = 0;
  float py = 0;
  float w = 0;

  Entity2(float limit) {
    x = random(width);
    y = random(height);
    w = random(1 / limit, limit);
  }

  void nextStep(float factor, float drag, float mx, float my) {
    dx /= factor;
    dy /= factor;
    dx += drag * (mx - x) * w / factor;
    dy += drag * (my - y) * w / factor;
    x += dx;
    y += dy;

    if (x != 0 && y != 0 && px != 0 && py != 0) {
      stroke(strokeR, strokeG, strokeB, (int)(random(5, 10)));
      line(x, y, px, py);
    }

    px = x;
    py = y;
  }
}

class Entity3 {

  float x1, y1, x2, y2;

  Entity3(float x, float y) {
    x1 = x; 
    y1 = y;
  }

  public void nextStep(float s, float c, float size) {
    float k = y1 - x1 * x1;
    y1 = (x1 * s) + (k * c);
    x1 = (x1 * c) - (k * s);
    x2 = width / 2 + size * x1;
    y2 = height / 2 + size * y1;

    if (x2 > 0 && x2 < width && y2 > 0 && y2 < height) {
      stroke(strokeR, strokeG, strokeB, (int)(random(25, 100)));
      point(x2, y2);
    }
  }
}

void drawSpray() {
  int nrOfPoints = 4096;
  PVector[] points = new PVector[nrOfPoints];

  fill(255, 50);
  smooth();

  for (int i = 0; i < nrOfPoints; i++) {
    points[i] = new PVector(random(0, width), random(0, height));
  }

  noiseDetail(3);

  for (int j = 0; j < 20; j++) {
    for (int i = 0; i < nrOfPoints; i++) {
      points[i].x = width * noise(points[i].y * 0.07 + random(15)); 
      points[i].y = height * noise(points[i].x * 0.07 + random(15)); 

      if (points[i].x < 0 || points[i].y < 0 || points[i].x > width || points[i].y > height) {
        points[i].x = random(0, width);
        points[i].y = random(0, height);
      }

      stroke(strokeR, strokeG, strokeB, (int)(random(25, 100)));
      point(points[i].x, points[i].y);
    }
  }
}

void drawLines() {
  ArrayList history = new ArrayList();
  float distthresh = 60;

  float p1 = random(100, 200);
  float p2 = random(p1, p1+200);

  for (int i = 0; i < random (11); i++) {
    float k = random(p1, p2);
    PVector d = new PVector(random(k, k + 10), random(k, k + 10));
    history.add(0, d);

    if (i > 0) {
      for (int p = 0; p < history.size (); p++) {
        PVector v = (PVector) history.get(p);
        d = v;
        if (p > 0)
          d = (PVector) history.get(p-1);

        stroke(strokeR, strokeG, strokeB, (int)(random(25, 100)));
        line(d.x, d.y, v.x, v.y);
      }
    }
  }
}

void drawLines2() {
  stroke(strokeR, strokeG, strokeB, (int)(random(20, 30)));
  float[] a = new float[14];

  for (int j = 0; j < random (15); j++) {
    a[7] = random(width); 
    a[0] = random(height);

    for (int k = 0; k < 18; k++) {
      for (int i = 1; i < 7; i++) {
        a[i] += (a[i-1] - a[i]) / i;
        a[i+7] += (a[i+6] - a[i+7]) / i;

        line(a[i], a[i+7], a[i-1], a[i+6]);
      }
    }
  }
}

void drawLines3() {
  stroke(strokeR, strokeG, strokeB, (int)(random(25, 100)));

  float x1 = random(10, 400);
  float y1 = random(10, 400);
  float x2 = random(10, 400);
  float y2 = random(10, 400);

  for (float i = 0; i < random (20, 35); i++) {
    float bound = random(2, 10);
    line(x1 + random(-bound, bound), y1 + random(-bound, bound), x2 + random(-bound, bound), y2 + random(-bound, bound));
  }
}


void drawBrush() {
  stroke(strokeR, strokeG, strokeB, 255);
  for (int j = 0; j < random (1, 11); j++) {
    float x1 = random(10, 400);
    float y1 = random(10, 400);
    float x2 = random(10, 400);
    float y2 = random(10, 400);

    float dx = (x2 - x1) * 0.1;
    float dy = (y2 - y1) * 0.1;
    float weight = dist(x1, y1, x2, y2);

    int startSize = (int)random(3, 10);
    int nrOfPoints = 30;

    for (int i = 0; i < nrOfPoints; i++) {
      if (random(100) < 50)
        startSize += 1;
      else if (startSize > 0)
        startSize -= 1;

      strokeWeight(startSize);
      line(x1, y1, x1 + x2 / nrOfPoints, y1 + y2 / nrOfPoints);

      x1 += x2 / nrOfPoints;
      y1 += y2 / nrOfPoints;
    }
  }
}

void drawGraphite() {
  //source http://www.openprocessing.org/sketch/2922
  int num = 4096;
  PVector[] pos = new PVector[num];
  PVector[] vel = new PVector[num];

  fill(255, 50);
  smooth();
  stroke(100, 255);
  for (int i = 0; i < num; i++) {
    pos[i] = new PVector(random(0, width), random(0, height));
    vel[i] = new PVector(0, 0);
  }

  noiseDetail(14);
  float noisy = 0.007;

  for (int j = 0; j < random (50, 100); j++) {
    for (int i = 0; i < num; i++) {
      stroke(strokeR, strokeG, strokeB, (int)(random(25, 100)));
      point(pos[i].x, pos[i].y);
      vel[i].x = 10 * noise(pos[i].x * 0.7, pos[i].y * 0.7, noisy * 0.2) * cos(12 + PI * noise(pos[i].x * 0.007, pos[i].y * 0.007, noisy * 0.5));
      vel[i].y = 10 * noise(pos[i].x * 0.7, pos[i].y * 0.7, noisy * 0.2) * sin(12 * PI * noise(pos[i].x * 0.007, pos[i].y * 0.7, noisy * 0.5));
      pos[i].add(vel[i]);
    }
    noisy += .007;
  }
}

void drawSpiderWeb() {
  /*
   Original:
   Name: Drunken Spider
   Author: Marco Scarfagna
   
   */

  //  colorMode(HSB, 360, 100, 100, 100);
  float x, y;
  float dirX = 2.7;                      
  float dirY = 1.5;                      
  float offset = 0.75;
  float drunkFactor = random(0.5, 2);    
  int attraction = int(random(20, 60));  

  ArrayList history  = new ArrayList();
  int lineDensity = 5;

  for (int t = 0; t < random (10000, 20000); t++) {

    x = random(width) + random(0.5, 2) * cos(radians(drunkFactor % 360));
    y = random(height) + random(0.5, 2)  *sin(radians(drunkFactor % 360));

    for (int i = 0; i < history.size (); i = i + lineDensity) {
      PVector p = (PVector) history.get(i);
      float d = dist(x, y, p.x, p.y);
      stroke(strokeR, strokeG, strokeB, (int)(random(10, 20)));
      //      stroke(1+int(sq(11*cos(radians(i)))), 1+int(sq(11*cos(radians(i)))), 1+int(sq(11*cos(radians(i)))), d*4);
      if (d > 1) {
        strokeWeight(1/d);
      }
      if (d < attraction) {
        if (random(10) < lineDensity)
          line(x, y, p.x + 1, p.y + 1);
      }
    }
    history.add(new PVector(x, y));
  }
}

