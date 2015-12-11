//frequency modulation
void setup() {
  size(800, 600);
}
void draw() {
  background(0);
  float x= sin(frameCount*(sin(frameCount*0.01)*0.1));
  
  rect(width*0.5 + (x*100), height*0.5, 10, 10);
}