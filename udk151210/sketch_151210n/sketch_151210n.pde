//frequency modulation
void setup() {
  size(800, 600);  //fullScreen(2);
}
void draw() {
  for(int i= 0; i<500; i= i+1) {
    float x= sin(i+frameCount*(sin(frameCount*0.01)*0.1));
    float y= cos(i+frameCount*(sin(frameCount*0.011)*0.1));
    float z= sin(i+frameCount*0.01)*200;
    fill(x*255, y*255, z*255);
    rect(width*0.25 + (x*z), height*0.5 + (y*z), i*z, i*z);
  }
}