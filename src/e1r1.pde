
void setup() {
  size(600, 600);

  float a=0;
  float f = 30;

  for (int i = 0; i<5000; i++) {
    pushMatrix();

    translate(width / 2, height / 2);
    strokeWeight(3);
    rotate(cos(a) + cos(a));
    stroke(229, 0, 54, 20);
    fill(1, 150);

    //    rect(200-a*f, 200-a*f, 200-a*f, 200-a*f);
    ellipse(200-a*f, 200-a*f, 200-a*f, 200-a*f);
    a+=0.005;

    popMatrix();
  }
} 
