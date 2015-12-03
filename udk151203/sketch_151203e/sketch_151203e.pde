//ropes
void setup() {
  size(800, 600);
}
void draw() {
  background(0);
  for(int x= 0; x<width; x++) {
    stroke(sin(frameCount*0.03)*127+127); //0-255
    rect(
      x,
      sin(x*0.01+(frameCount*0.01))*100+(height*0.5),
      sin(x*0.022)*10,
      sin(x*0.043)*20
    );
    rect(
      x,
      sin(x*0.02+(frameCount*0.01))*100+(height*0.5),
      sin(x*0.032)*10,
      sin(x*0.043)*20
    );
  }
}