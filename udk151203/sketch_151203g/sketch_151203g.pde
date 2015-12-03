//let this run for a bit
void setup() {
  size(1200, 600);
  strokeWeight(0.5);
}
void draw() {
  fill(0, 10);
  rect(0, 0, width, height);
  stroke(255);
  for(float x= 0; x<width; x= x+(sin(frameCount*0.001)*20+21)) {
    float y= sin(x*0.012+(frameCount* 0.021))*200;
    float yy= sin(x*0.023+(frameCount* -0.003));
    float yyy= sin(x*0.041+(frameCount* 0.04))*100;
    line(x, height*0.5+(y*yy+yyy), x, height*0.5-(y*yy+yyy));
  }
}