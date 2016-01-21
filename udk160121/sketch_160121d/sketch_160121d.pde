void setup() {
  size(800, 600);
  background(0);
}
void draw() {

  translate(width*0.5, height*0.5);
  scale(map(mouseX, 0, width, 0.9, 1.1));  //zoom in speed
  rotate(map(mouseY, 0, height, 0, TWO_PI));  //0 - TWO_PI (6.28)
  translate(-width*0.5, -height*0.5);

  filter(ERODE);  //try with BLUR, INVERT, DILATE, THRESHOLD, POSTERIZE

  image(get(), 0, 0, width, height);

  fill(100, 255, 0);
  ellipse(mouseX, mouseY, 120, 120);
}