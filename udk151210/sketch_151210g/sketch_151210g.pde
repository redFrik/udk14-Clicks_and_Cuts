void setup() {
  size(800, 600);
}
void draw() {
  //background(0);
  float x= sin(frameCount*0.1); //-1.0 to 1.0
  float y= cos(frameCount*0.101); //-1.0 to 1.0
  float z= sin(frameCount*0.005)*200; //-200 to 200
  rect(width*0.5 + (x*z), height*0.5 + (y*z), 10, 10);
}