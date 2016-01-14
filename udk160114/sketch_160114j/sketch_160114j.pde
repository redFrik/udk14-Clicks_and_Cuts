void setup() {
  size(800, 600);
  background(0);  //clear screen
}
void draw() {
  if (frameCount%4==0) {
    fill(255);  //colour to white
  } else {
    fill(0);
  }
  textSize(20);

  for (int y= 0; y<60; y++) { //0-59
    for (int x= 0; x<60; x++) { //0-59
      text(
        char((frameCount*x/(y+1))%255), 
        map(x, 0, 59, 0, width), 
        map(y, 0, 59, 0, height)
        );
    }
  }
}