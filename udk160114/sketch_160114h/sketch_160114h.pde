void setup() {
  size(800, 600);
}
void draw() {
  background(0);
  fill(255);  //colour to white

  textSize(10);
  for (int y= 0; y<100; y++) { //0-9
    for (int x= 0; x<100; x++) { //0-9
      text(
        char(x*y+frameCount), 
        map(x, 0, 99, 0, width), 
        map(y, 0, 99, 0, height)
        );
    }
  }
}