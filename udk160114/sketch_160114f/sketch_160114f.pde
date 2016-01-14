void setup() {
  size(800, 600);
  background(0);  //clear screen
}
void draw() {

  if (frameCount%2==0) {
    fill(255);  //colour to white
  } else {
    fill(0);
  }
  textSize(20);
  translate(width*0.5, height*0.5);
  rotate(frameCount*0.01);
  for (int y= 0; y<70; y++) { //0-69
    for (int x= 0; x<70; x++) { //0-69
      text(
        char((frameCount/(x+1)+y)%255), 
        map(x, 0, 69, 0, width), 
        map(y, 0, 69, 0, height)
        );
    }
  }
}