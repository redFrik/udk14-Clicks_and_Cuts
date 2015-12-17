void setup() {
  size(800, 600);
}
void draw() {
  background(0);
  fill(255);
  noStroke();
  
  for(int x= 0; x<100; x++) {
    for(int y= 0; y<150; y++) {
      if(random(100)<map(mouseX, 0, width, 0, 100)) {
        fill(20);
      } else {
       fill(255);
      }
      rect(x*3, y*3, 2, 2);
    }
  }
  
}