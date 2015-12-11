void setup() {
  size(800, 600);
}
void draw() {
  //background(0);
  float x= sin(frameCount*0.1); //-1.0 and 1.0
  //float y= sin(frameCount*0.1 + (PI*0.5));
  float y= cos(frameCount*0.1);
  rect(width*0.5 + (x*100), height*0.5 + (y*100), 20, 20);
}