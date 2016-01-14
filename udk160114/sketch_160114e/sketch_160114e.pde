//draw with the mouse
void setup() {
  size(800, 600);
  background(0);  //clear screen
}
void draw() {

  if (frameCount%2==0) {  //every other frame
    fill(255);  //set text colour to white
  } else {
    fill(0);  //else set it to black
  }

  textSize(100);
  text(char(frameCount), mouseX, mouseY);
}