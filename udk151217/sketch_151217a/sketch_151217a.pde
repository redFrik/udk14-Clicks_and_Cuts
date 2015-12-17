//no glitches
void setup() {
  size(800, 600);
  noStroke();
}
void draw() {
  background(0);
  for(int y= 0; y<(height/8); y++) {
    for(int x= 0; x<(width/8); x++) {
      rect(x*6, y*6, 2, 2);
    }
  }
}