void setup() {
  size(800, 600);
  background(0);
}
void draw() {
  if (frameCount%2==0) {
    fill(255);  //draw
  } else {
    fill(0);  //or erase
  }
  rect(mouseX, mouseY, 150, 150);

  translate(width*0.5, height*0.5);
  scale(map(mouseX, 0, width, 0.9, 1.1));  //zoom in speed
  rotate(map(mouseY, 0, height, 0, TWO_PI));  //0 - TWO_PI (6.28)
  translate(-width*0.5, -height*0.5);

  image(get(), 0, 0, width, height);
}