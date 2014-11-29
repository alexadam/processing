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
  save("f2r1.jpg");
}
void createFont() {
  boolean isLowerCase = false;

  f = new Fontastic(this, "f2");
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
    f.addGlyph(Character.toLowerCase(c));

    System.out.println(pnts.length + " len");
    PVector[] points = new PVector[4];

    for (int tt = 0; tt < mpoints.length; tt++) {
      mpoints[tt].y = mpoints[tt].y + 10 * cos(tt * 6.28 * 10 / mpoints.length);  
      mpoints[tt].x = mpoints[tt].x + 10 * sin(tt * 6.28 * 10 / mpoints.length);
    }

    f.getGlyph(c).addContour(mpoints);
    f.getGlyph(Character.toLowerCase(c)).addContour(mpoints);
  }
  f.buildFont();
  f.cleanup();
}

