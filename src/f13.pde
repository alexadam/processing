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
  save("f13r1.jpg");
}
void createFont() {


  boolean isLowerCase = false;

  f = new Fontastic(this, "f13");
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
    f.addGlyph(Character.toLowerCase(c));

    System.out.println(pnts.length + " len");
    PVector[] points = new PVector[4];
    points[0] = new PVector(0, 0);
    points[1] = new PVector(500, 0);
    points[2] = new PVector(500, 10);
    points[3] = new PVector(0, 20);

    for (int tt = 0; tt < mpoints.length; tt++) {

      if (random(100) < 50) {
        int pointSize = (int)(random(5, 35));
        PVector[] newpoi = new PVector[4];
        newpoi[0] = (new PVector(mpoints[tt].x - pointSize, mpoints[tt].y - pointSize));
        newpoi[1] = (new PVector(mpoints[tt].x + pointSize, mpoints[tt].y - pointSize));
        newpoi[2] = (new PVector(mpoints[tt].x - pointSize, mpoints[tt].y + pointSize));
        newpoi[3] = (new PVector(mpoints[tt].x + pointSize, mpoints[tt].y + pointSize));
        f.getGlyph(c).addContour(newpoi);
      }
    }

    f.getGlyph(Character.toLowerCase(c)).addContour(mpoints);
  }
  f.buildFont();
  f.cleanup();
}
