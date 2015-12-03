//frequency modulation
void setup() {
  size(800, 600);
}
void draw() {
  background(0);
  stroke(255);
  for(int x= 0; x<width; x++) {
    rect(
      x,
      (sin((x+frameCount)*0.05*sin((x+frameCount)*0.004)))*100+(width*0.5),
      4,
      4
    );
  }
}