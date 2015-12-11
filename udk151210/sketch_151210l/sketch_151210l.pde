//frequency modulation
void setup() {
  size(800, 600);
}
void draw() {
  //background(0);
  float x= sin(frameCount*(sin(frameCount*0.01)*0.1));
  float y= cos(frameCount*(sin(frameCount*0.011)*0.1));
  
  rect(width*0.5 + (x*200), height*0.5 + (y*200), 10, 10);
}