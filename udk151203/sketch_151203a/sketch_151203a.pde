//simple plotting
void setup() {
  size(800, 600);
}
void draw() {
  float x= frameCount%width;
  float y= sin(frameCount*0.1)*100+(height*0.5);
  rect(x, y, 1, 1);
}