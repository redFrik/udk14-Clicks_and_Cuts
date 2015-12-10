void setup() {
  size(800, 600);
}
void draw() {
  float x= sin(frameCount*0.01)*width*0.25;
  float y= cos(frameCount*0.01)*height*0.25;
  rect(width*0.5+x, height*0.5+y, 2, 2);
}