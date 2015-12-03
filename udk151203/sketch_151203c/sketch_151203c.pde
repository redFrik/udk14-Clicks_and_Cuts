//tube
void setup() {
  size(800, 600);
}
void draw() {
  background(0);
  stroke(255);
  for(int x= 0; x<width; x++) {
    float y= sin(frameCount*0.01+x)*100+(height*0.5);
    rect(x, y, 1, 1);
  }
}