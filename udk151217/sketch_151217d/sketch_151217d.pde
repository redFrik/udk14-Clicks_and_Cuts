void setup() {
  size(800, 600);
}
void draw() {
  background(0);
  fill(255);
  noStroke();
  
  translate(40, 30);
  for(int x= 0; x<100; x++) {
    for(int y= 0; y<150; y++) {
      if(random(10000)<1) {
        scale(1.1, 0.9);
        //rotate(0.01);  //or rotate(-0.02)
        //translate(1, 1);    //translate(-2.4, random(2));
      } else {
       
      }
      rect(x*3, y*3, 2, 2);
    }
  }
  
}