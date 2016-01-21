void setup() {
  size(800, 600);
  background(0);
}
void draw() {

  translate(width*0.5, height*0.5);
  scale(-1.01);  //zoom in speed
  translate(-width*0.5, -height*0.5);

  image(get(), 0, 0, width, height);

  fill(0, 255, 0);
  rect(mouseX, mouseY, 20, 20);
}