void setup() {
  size(800, 600);
}
void draw() {
  background(0);
  for (int i= 0; i<200; i++) {
    float x= sin((i+frameCount)*0.01)*width*0.25;
    float y= cos((i+frameCount)*0.01)*height*0.25;
    float xx= sin((i+frameCount)*0.1)*width*0.1;
    float yy= cos((i+frameCount)*0.1)*width*0.1;
    float xxx= sin((i+frameCount)*1)*width*0.01;
    float yyy= cos((i+frameCount)*1)*width*0.01;
    rect(width*0.5+x+xx+xxx, height*0.5+y+yy+yyy, 20, 20);
  }
}