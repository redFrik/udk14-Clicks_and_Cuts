//ascii graphics - video camera input
//move mouse around. x is spread and y is offset into the ascii table

import processing.video.*;
Capture video;

int res= 10;  //down sample camera

void setup() {
  size(800, 600);
  video= new Capture(this, width/res, height/res);
  video.start();
  noStroke();
  smooth(0);  //sharp edges
  fill(255);  //text colour
}
void captureEvent(Capture c) {
  c.read();  //update pixels if new image from camera available
}
void draw() {
  background(0);  //clear background each frame
  //image(video, 0, 0, width, height);  //debug
  video.loadPixels();
  int index= 0;
  int sca= int(float(mouseX)/width*20)+1;  //+1 to avoid division with zero
  int off= int(float(mouseY)/height*20);  //offset into ascii table
  for (int y= 0; y<video.height; y++) {  //go through the vertical pixels
    for (int x= 0; x<video.width; x++) {  //go through the horizontal pixels
      int pixelColor= video.pixels[index];  //colour at pixel
      int rgb= ((pixelColor>>16)&0xff)+((pixelColor>>8)&0xff)+(pixelColor&0xff);
      text(char(rgb/sca+off), x*res, y*res);  //draw an ascii character based on colour at x and y
      index++;
    }
  }
}