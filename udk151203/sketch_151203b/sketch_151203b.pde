//also sin functions for colours
void setup() {
  size(800, 600);
}
void draw() {
  stroke(sin(frameCount*0.026)*127+127);  //greyscale sin
  fill(sin(frameCount*0.065)*127+127);  //greyscale sin
  rect(
    frameCount%width,
    sin(frameCount*0.1)*100+(height*0.5),
    sin(frameCount*0.02)*30,
    sin(frameCount*0.045)*50
  );
}