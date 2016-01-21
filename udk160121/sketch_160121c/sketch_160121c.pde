void setup() {
  size(800, 600);
  background(0);
}
void draw() {

  translate(width*0.5, height*0.5);
  scale(1.01);  //zoom in speed
  rotate(0.33333*PI);  //0 - TWO_PI (6.28)
  translate(-width*0.5, -height*0.5);

  image(get(), 0, 0, width, height);

  fill(0, 255, 0);
  ellipse(mouseX, mouseY, mouseX-pmouseX, mouseY-pmouseY);
}