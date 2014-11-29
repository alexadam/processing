import fontastic.*;
import geomerative.*;

Fontastic f;
RFont font;

void setup() {
  size(1000, 300);
  fill(0);

  RG.init(this);
  font = new RFont("f1.ttf", 100);

  RCommand.setSegmentLength (2);
  RCommand.setSegmentator(RCommand.UNIFORMLENGTH); 

  createFont();
}
void draw() {
  background(255);
  PFont myFont = createFont(f.getTTFfilename(), 150);
  textFont(myFont);
  textAlign(CENTER, CENTER);
  text(Fontastic.alphabet, 0, Fontastic.alphabet.length/2, width/2, height/5);
  text(Fontastic.alphabet, Fontastic.alphabet.length/2, Fontastic.alphabet.length, width/2, height/5*2.5);
  noLoop();
  save("f1r1.jpg");
}
void createFont() {


  boolean isLowerCase = false;

  f = new Fontastic(this, "f1");
  f.setAuthor("author");

  for (char c : Fontastic.alphabet) {
    RShape shp = font.toShape(c);
    RPoint[] pnts = new RPoint[0];
    try {
      pnts = shp.getPoints();
    } 
    catch (NullPointerException e) {
      println("Problem with setSegmentOffset at Character "+c);
    }

    PVector[] mpoints = new PVector[0];
    for (int ii=0; ii<pnts.length-1; ii++) {
      RPoint p = pnts[ii];
      mpoints = (PVector[]) append(mpoints, new PVector(p.x * 5, -p.y * 5));
    }

    f.addGlyph(c);

    System.out.println(pnts.length + " len");
    PVector[] points = new PVector[4];

    for (int tt = 0; tt < mpoints.length; tt++) {     
      int pp1 = (int) random(mpoints.length - 1);

      if (tt % 4 ==0) {
        mpoints[pp1].y = mpoints[(pp1 + 5)  % mpoints.length].y;  
        mpoints[pp1].x = mpoints[(pp1 + 10)  % mpoints.length].x;
      }
    }

    f.getGlyph(c).addContour(mpoints);
  }
  f.buildFont();
  f.cleanup();
}

