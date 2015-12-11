void setup() {
  size(800, 600);
  background(0);
  noStroke();
}
void draw() {
  float x= sin(frameCount*0.012)*width*0.4;
  float y= cos(frameCount*0.011)*height*0.4;
  x= x*sin(frameCount*sin(frameCount*0.014)*0.03)*0.3;
  y= y*sin(frameCount*sin(frameCount*0.013)*0.03)*0.3;
  rect(width*0.5+x, height*0.5+y, 2, 2);
}