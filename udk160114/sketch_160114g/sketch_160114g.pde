void setup() {
  size(800, 600);
}
void draw() {
  background(0);
  fill(255);  //set text colour to white

  textSize(20);
  for (int y= 0; y<10; y++) { //0-9
    for (int x= 0; x<10; x++) { //0-9
      text(
        char(x*y+frameCount), 
        map(x, 0, 9, 0, width), 
        map(y, 0, 9, 0, height)
        );
    }
  }
}