//tube2
void setup() {
  size(800, 600);
}
void draw() {
  background(0);
  for(int x= 0; x<width; x++) {
    stroke(sin((x+frameCount)*0.1)*127+127); //0-255
    fill(sin((x+frameCount)*0.13)*127+127); //0-255
    rect(
      x,
      sin(x*0.1+(frameCount*0.01))*100+(height*0.5),
      sin(x*0.22)*10,
      sin(x*0.43)*20
    );
    rect(
      x,
      sin(x*0.2+(frameCount*0.01))*100+(height*0.5),
      sin(x*0.32)*10,
      sin(x*0.43)*20
    );
  }
}