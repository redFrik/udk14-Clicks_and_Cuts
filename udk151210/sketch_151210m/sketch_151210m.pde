//frequency modulation
void setup() {
  size(800, 600);
}
void draw() {
  background(0);
  for(int i= 0; i<500; i= i+1) {
    float x= sin(i+frameCount*(sin(frameCount*0.01)*0.1));
    float y= cos(i+frameCount*(sin(frameCount*0.011)*0.1));
  
    rect(width*0.5 + (x*200), height*0.5 + (y*200), i, 10);
  }
}