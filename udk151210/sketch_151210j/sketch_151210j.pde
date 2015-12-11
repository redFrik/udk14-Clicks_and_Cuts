//additive synthesis
void setup() {
  size(800, 600);
}
void draw() {
  float x= sin(frameCount*0.01);  //-1.0 to 1.0
  float xx= sin(frameCount*0.1)*0.2;  //-0.2 to 0.2
  float xxx= sin(frameCount*0.2)*0.12;  //-0.2 to 0.2
  
  float y= cos(frameCount*0.013);
  float yy= cos(frameCount*0.1)*0.22;
  float yyy= cos(frameCount*0.2)*0.12;
  
  float z= sin(frameCount*0.02)*200;
  
  rect(width*0.5 + ((x+xx+xxx)*z), height*0.5 + ((y+yy+yyy)*z), 10, 10);
}