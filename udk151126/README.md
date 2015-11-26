graphics in processing
--

please bring laptop.

and download and install processing version 3 <http://processing.org>. version 2 will work except for the last audio examples.


excercise1
--

```
void setup() {
    size(640, 480);
}
void draw() {
    rect(10, 20, 30, 40);
}
```

```
void setup() {
    size(640, 480);
}
void draw() {
    background(100);
    rect(10, 20, 30, random(200));
}
```

etc.

now animate some simple rectangles, play with positions and sizes.

excercise2
--

use built-in laptop camera or connect an external usb webcamera.

```
import processing.video.*;
Capture video;

void setup() {
    size(640, 480);
    video = new Capture(this, width, height);
    video.start();
}
void draw() {
    if (video.available() == true) {
        video.read();
    }
    image(video, 0, 0, width, height);
}
```

now downsample

```
import processing.video.*;
Capture video;

void setup() {
    size(640, 480);
    video = new Capture(this, width, height);
    video.start();
}
void draw() {
    if (video.available() == true) {
        video.read();
    }
    if (frameCount%60==0) {  //downsample to about 1 frame per second
        image(video, 0, 0, width, height);
    }
}
```

next example is drawing a black rectangle with some alpha - this is a way to create trails.

```
import processing.video.*;
Capture video;

void setup() {
    size(640, 480);
    video = new Capture(this, width, height);
    video.start();
}
void draw() {
    fill(0, 20);  //alpha is fade out time (0-255), higher is faster 
    rect(0, 0, width, height);
    if (video.available() == true) {
        video.read();
    }
        if ((frameCount%60==0) || (frameCount%42==3) || (frameCount%133==4)) {  //trigger pattern
        image(video, 0, 0, width, height);
    }
}
```

excercise3
--

```
//lines
import processing.video.*;
Capture video;
void setup() {
    size(640, 480);
    video = new Capture(this, width, height);
    video.start();
}
void draw() {
    if (video.available() == true) {
        video.read();
        PImage img = createImage(width, height, RGB);
        arrayCopy(video.pixels, img.pixels);
        img.resize(width, 1);  //resize copy to height 1 
        image(img, 0, 0, width, height);  //stretch out copy over full size
    }
}
```
![lines.png](lines.png?raw=true "lines.png")

now try making horizontal lines in the same manner.

and to do big distinct pixels use smooth(0); or noSmooth();

```
//cubes
import processing.video.*;
Capture video;
void setup() {
    size(640, 480);
    video = new Capture(this, width, height);
    video.start();
    smooth(0); //also try with 2, 3, 4 and 8
}
void draw() {
    if (video.available() == true) {
        video.read();
        PImage img = createImage(width, height, RGB);
        arrayCopy(video.pixels, img.pixels);
        img.resize(8, 6);  //test different number of pixels 
        image(img, 0, 0, width, height);  //stretch out copy over full size
    }
}
```

![cubes.png](cubes.png?raw=true "cubes.png")

watch
--

<https://www.youtube.com/watch?v=omDE_h1T7_A> Ryoji Ikeda - Test Pattern (live at Disslab)
(if not all at least the section starting at 13:52)

exercise4
--

this example just use randomly sized rectangles

```
//fake
void setup() {
    size(640, 480);
    noStroke();
}
void draw() {
    background(0);

    int numLeft= int(random(100));
    for(int i= 0; i<numLeft; i++) {
        rect(0, random(height), width*0.5, random(15));
    }

    int numRight= int(random(100));
    for(int i= 0; i<numRight; i++) {
        rect(width*0.5, random(height), width*0.5, random(15));
    }
}
```

here we get the amplitude of the audio input (mic/line)

```
//real
import processing.sound.*;
AudioIn input;
Amplitude amp;

void setup() {
    size(640, 480);
    amp= new Amplitude(this);
    input = new AudioIn(this, 0);  //mic or line in
    input.start();
    amp.input(input);
}
void draw() {
    int i= frameCount%height;
    stroke(amp.analyze()*255);
    line(0, i, width*0.5, i);  //change these values
    line(width*0.5, height-i, width, height-i);  //and these
}
```

![real.png](real.png?raw=true "real.png")

spectrum analysis (fft) with stereo sound input.

```
//real2
import processing.sound.*;
AudioIn input0, input1;
AudioDevice device;
FFT fft0, fft1;
final int bands = 128;
float step;

void setup() {
    size(640, 480);
    device = new AudioDevice(this, 44100, bands);
    input0 = new AudioIn(this, 0);  //mic or line in left
    input1 = new AudioIn(this, 1);  //mic or line in right
    input0.start();
    input1.start();
    fft0 = new FFT(this, bands);
    fft0.input(input0);
    fft1 = new FFT(this, bands);
    fft1.input(input1);
    step= height/float(bands);  //line width
    strokeWeight(step);
}
void draw() {
    fft0.analyze();
    fft1.analyze();
    for (int i = 0; i < bands; i++) {
        float val0= fft0.spectrum[bands-1-i];   //draw lowest frequencies at the bottom
        stroke(max(0, val0*255));
        line(0, i*step, width*0.5, i*step);
        float val1= fft1.spectrum[bands-1-i];   //draw lowest frequencies at the bottom
        stroke(max(0, val1*255));
        line(width*0.5, i*step, width, i*step);
    }
}
```

![real2.png](real2.png?raw=true "real2.png")

similar but with mirroring...

```
//real3
import processing.sound.*;
AudioIn input0, input1;
AudioDevice device;
FFT fft0, fft1;
final int bands = 128;
float step;

void setup() {
    size(640, 480);
    device = new AudioDevice(this, 44100, bands);
    input0 = new AudioIn(this, 0);  //mic or line in
    input1 = new AudioIn(this, 1);  //mic or line in
    input0.start();
    input1.start();
    fft0 = new FFT(this, bands);
    fft0.input(input0);
    fft1 = new FFT(this, bands);
    fft1.input(input1);
    step= height/float(bands);
    strokeWeight(step);
}
void draw() {
    background(0);
    fft0.analyze();
    fft1.analyze();
    for (int i = 0; i < bands; i++) {
        float val0= fft0.spectrum[i];
        stroke(max(0, val0*255));
        line(0, height*0.5+i, width*0.5, height*0.5+i);  //play with these numbers
        line(0, height*0.5-i, width*0.5, height*0.5-i);  //and these
        float val1= fft1.spectrum[i];
        stroke(max(0, val1*255));
        line(width*0.5, height*0.5+i, width, height*0.5+i);  //here too
        line(width*0.5, height*0.5-i, width, height*0.5-i);  //and here
    }
}
```

![real3.png](real3.png?raw=true "real3.png")

extra
--

applying filters (effects) to video (images)

```
//filter images
//note that there are better and more efficient ways to do this using shaders
import processing.video.*;
Capture video;

void setup() {
    size(640, 480);
    video = new Capture(this, width, height);
    video.start();
}
void draw() {
    if (video.available() == true) {
        video.read();
        video.filter(THRESHOLD, 0.5);  //0.0-1.0
        //video.filter(GRAY);
        //video.filter(INVERT);
        //video.filter(POSTERIZE, 5);  //2-255
        //video.filter(BLUR, 4);  //1-~64
        //video.filter(ERODE);
        //video.filter(DILATE);
    }
    image(video, 0, 0, width, height);
}
```

extra2
--

(advanced) drawing to a PGraphics, applying a filter and then stretching out to display dimensions

```
//filter graphics
import processing.sound.*;
AudioIn input;
AudioDevice device;
FFT fft;
final int bands = 128;
float step;
PGraphics pg;

void setup() {
    size(640, 480);
    device = new AudioDevice(this, 44100, bands);
    input = new AudioIn(this, 0);  //mic or line in left
    input.start();
    fft = new FFT(this, bands);
    fft.input(input);
    pg= createGraphics(width, bands);
}
void draw() {
    fft.analyze();
    pg.beginDraw();
    for (int i = 0; i < bands; i++) {
        float val= fft.spectrum[bands-1-i];   //draw lowest frequencies at the bottom
        pg.stroke(max(0, val*255));
        pg.line(0, i, width, i);
    }
    pg.endDraw();
    pg.filter(BLUR, 2);
    image(pg, 0, 0, width, height);  //stretch out pg to fill full window height
}
```
