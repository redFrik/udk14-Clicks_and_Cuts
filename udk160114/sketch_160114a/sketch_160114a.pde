//ascii graphics - move mouse around
import processing.video.*;
Capture video;

int res= 10;

void setup() {
  size(800, 600);
  video= new Capture(this, width/res, height/res);
  video.start();
  noStroke();
  smooth(0);
  fill(255);
}
void captureEvent(Capture c) {
  c.read();
}
void draw() {
  background(0);
  //image(video, 0, 0, width, height);  //debug
  video.loadPixels();
  int index= 0;
  int sca= int(float(mouseX)/width*20)+1;
  int off= int(float(mouseY)/height*20);
  for (int y= 0; y<video.height; y++) {
    for (int x= 0; x<video.width; x++) {
      int pixelColor= video.pixels[index];
      int rgb= ((pixelColor>>16)&0xff)+((pixelColor>>8)&0xff)+(pixelColor&0xff);
      text(char(rgb/sca+off), x*res, y*res);
      index++;
    }
  }
}