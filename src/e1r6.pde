
void setup() {
  size(2000, 2000);

  float a = 0;
  float f = 10;
  float s = 60;

  translate(width/2, width/2);
 
  for (int i = 0; i<1000; i++) {
    pushMatrix();
    
    int m =  (int)random(1, 20);
    int n1 = (int)random(1, 20);
    int n2 = (int)random(1, 20);
    int n3 = (int)random(1, 20);
    int aa = 1;
    int b = 1;
    int t = i - 3500;

    float xt = pow(pow(abs(cos(m * t / 4) / aa), n2) + pow(abs(sin(m * t / 4) / b), n3), -1 / n1) * cos(t);
   float yt = pow(pow(abs(cos(m * t / 4) / aa), n2) + pow(abs(sin(m * t / 4) / b), n3), -1 / n1) * sin(t) * cos(t);

    translate(xt * width/4, yt * width/4);
    strokeWeight(3);
    rotate(cos(a));
    fill(229, 100, 54, 40);
    stroke(1, 150);

    rect(s-a*f, s-a*f, s-a*f, s-a*f);
//    ellipse(s-a*f, s-a*f, s-a*f, s-a*f);
    a+=0.005;

    popMatrix();
  }
  
  
  save("e1r1.jpg");
} 

