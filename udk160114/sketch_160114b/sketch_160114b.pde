//simple example that scans through ascii values
void setup() {
  size(800, 600);
}
void draw() {
  background(0);  //clear screen
  fill(255);  //set text colour to white
  textSize(300);
  text(char(frameCount), width*0.5, height*0.5);
  //text(char(mouseX), width*0.5, height*0.5);  //variant - use mouse to scan
}