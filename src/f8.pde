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
  save("f8r1.jpg");
}
void createFont() {

  boolean isLowerCase = false;

  f = new Fontastic(this, "f8");
  f.setAuthor("user");

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
    FPoint[] points = new FPoint[0];

    for (int ii=0; ii<pnts.length-1; ii++) {
      if (ii % 5 == 0) {
        RPoint p = pnts[ii];
        points = (FPoint[]) append(points, new FPoint(new PVector(p.x * 5, -p.y * 5), new PVector(p.x * 5 * 2, -p.y * 5 + 10), new PVector(p.x * 5 / 2, -p.y * 5 + 20)));
      }
    }

    f.getGlyph(c).addContour(points);
  }
  f.buildFont();
  f.cleanup();
}

