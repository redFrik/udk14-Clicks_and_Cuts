//screensaver with mic input
import processing.sound.*;
AudioIn input;
AudioDevice device;
FFT fft;
final int bands = 32;

void setup() {
  size(640, 480);
  device = new AudioDevice(this, 44100, bands);
  input = new AudioIn(this, 0);  //mic or line in
  input.start();
  fft = new FFT(this, bands);
  fft.input(input);
  //smooth(4);
}
void draw() {
  stroke(0);
  strokeWeight(0);
  fill(0, 10);
  rect(0, 0, width, height);

  fft.analyze();
  for (int i = 0; i < bands; i++) {
    float val= fft.spectrum[i];
    strokeWeight(sin(frameCount*0.009+i)*5+5);
    stroke(min(255, val*10000), sin(frameCount*0.002+i/88)*127+127, sin(frameCount*0.0023+i*0.1)*127+127, 20);
    line(0, height*sin(frameCount*0.003)+((cos(frameCount*0.01+i)+1)*150), width, height*sin(frameCount*0.005)+((sin(frameCount*0.011+i)+1)*250));
    line(0, height*cos(frameCount*0.004)-((sin(frameCount*0.013+i)+1)*150), width, height*cos(frameCount*0.006)-((cos(frameCount*0.012+i)+1)*250));
  }
}