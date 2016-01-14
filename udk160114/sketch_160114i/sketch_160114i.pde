void setup() {
  size(800, 600);
}
void draw() {
  background(0);
  fill(0, 255, 0);  //set text colour to green

  textSize(25);
  for (int y= 0; y<20; y++) { //0-9
    for (int x= 0; x<20; x++) { //0-9
      text(
        char((frameCount/(x+1)+y)%255), 
        map(x, 0, 19, 0, width), 
        map(y, 0, 19, 0, height)
        );
    }
  }
}