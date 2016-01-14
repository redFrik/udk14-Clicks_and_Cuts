void setup() {
  size(800, 600);
}
void draw() {
  background(0);  //clear screen
  fill(255);  //colour to white
  textSize(frameCount%500+1);  //slowly increasing text size
  text(char(frameCount), width*0.25, height*0.75);
}