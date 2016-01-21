import processing.video.*;
Capture video;

void setup() {
  size(800, 600);
  video= new Capture(this, 320, 240);
  video.start();
  background(0);
}
void captureEvent(Capture c) {
  c.read();  //update pixels if new image from camera available
}
void draw() {

  translate(width*0.5, height*0.5);
  scale(1.05);  //zoom in speed
  rotate(map(mouseX, 0, width, -PI, PI));
  translate(-width*0.5, -height*0.5);
  tint(255, map(mouseY, 0, height, 0, 255));
  image(get(), 0, 0, width, height);

  image(video, (width-video.width)*0.5, (height-video.height)*0.5, video.width, video.height);
}