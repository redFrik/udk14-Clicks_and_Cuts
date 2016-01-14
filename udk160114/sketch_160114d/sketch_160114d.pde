void setup() {
  size(800, 600);
}
void draw() {
  background(0);  //clear screen
  fill(255);  //set text colour to white
  for (int i= 0; i<10; i++) {  //draw 10 things
    textSize((frameCount+i*20)%500+1);  //increasing text sizes
    text(char(frameCount+i*10), width*0.25, height*0.75);
  }
}