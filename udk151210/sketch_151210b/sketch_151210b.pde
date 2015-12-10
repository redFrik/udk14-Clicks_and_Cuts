void setup() {
  size(800, 600);
}
void draw() {
  float x= sin(frameCount*0.01)*width*0.25;
  float y= cos(frameCount*0.01)*height*0.25;
  float xx= sin(frameCount*0.1)*width*0.1;
  float yy= cos(frameCount*0.1)*width*0.1;
  rect(width*0.5+x+xx, height*0.5+y+yy, 2, 2);
}