//sin+cos
void setup() {
  size(800, 600);
}
void draw() {
  fill(0, 10);
  rect(0, 0, width, height);  //erase with alpha
  fill(255);  //white
  float num= 100;
  for(int i= 0; i<num; i++) {
    float y= sin(frameCount*0.1+(i/num*6.28))*sin(frameCount*0.03)*200+(height*0.5);
    float x= cos(frameCount*0.03+sin(i/num*6.28))*200+(width*0.5);
    rect(x, y, sin(frameCount*0.4)*100+100, 10);
  }
}