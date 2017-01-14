odds and ends
--

soundwaves
--

```supercollider
//waveToProcessing.scd
(
s.latency= 0.025;
s.waitForBoot{
    var waveSize= 735;  //1/60*44100
    var processing= NetAddr("127.0.0.1", 47130);
    var waveBuf= Buffer.alloc(s, waveSize, 1);
    CmdPeriod.doOnce({waveBuf.free});
    SynthDef(\waveTrk, {|in= 0, buf, sample= 1|
        var z= HPF.ar(Mix(In.ar(in, 2)), 9);
        //var trig= Trig1.ar(HPZ1.ar(z>0).abs, 1/60);
        var trig= Impulse.ar(60);
        var phase= Sweep.ar(trig, sample*SampleRate.ir);
        BufWr.ar(z, buf, phase, 0);
    }).add;
    s.sync;
    Synth(\waveTrk, [\buf, waveBuf], s.defaultGroup, addAction:'addAfter');
    Routine.run({
        inf.do{
            waveBuf.getn(0, waveSize, {|data| processing.sendMsg(\waveData, *data)});
            (1/60).wait;
        };
    });
};
)


//some simple testsounds
{SinOsc.ar(MouseX.kr(1, 999))!2}.play;
{Saw.ar(MouseX.kr(50, 500))!2}.play;
{Pulse.ar(140)*0.1!2}.play;
{SoundIn.ar!2}.play;


{Saw.ar(XLine.kr(4000, 40, 20))}.play;
{LFTri.ar(XLine.kr(4000, 40, 20))}.play;
{LFTri.ar(60)}.play;
{LFTri.ar(59.5)}.play;
```

now start processing with the sketch 'waveToProcessing.pde' and play some supercollider sounds you have made.

note: you will need to have the library OscP5 installed. to install it from within processing click on 'tools' and 'Add Tool...' and then 'libraries' and then search for 'oscp5'. select it and click install.

```cpp
//waveToProcessing.pde
import oscP5.*;
import netP5.*;
OscP5 oscP5;

final int BUFFERSIZE= 735;  //should correspond with bufferSize in supercollider
float[] waveData;

void setup() {
    size(735, 735, FX2D);
    frameRate(60);
    background(0);
    
    waveData= new float[BUFFERSIZE];
    for (int i= 0; i<BUFFERSIZE; i++) {
        waveData[i]= 0.0;
    }
    
    OscProperties properties= new OscProperties();
    properties.setListeningPort(47130);  //osc receive port (from sc)
    properties.setDatagramSize(5136);  //5136 is the minimum 
    oscP5= new OscP5(this, properties);
}
void oscEvent(OscMessage msg) {
    if (msg.checkAddrPattern("/waveData")) {
        for (int i= 0; i<BUFFERSIZE; i++) {
            waveData[i]= msg.get(i).floatValue();
        }
    }
}
void draw() {
    if (frameCount%100==0) {
        println(frameRate);
    }

    noStroke();
    fill(0, 10);  //a bit of trail effect
    rect(0, 0, width, height);
    
    translate(width*0.5, height*0.5);
    scale(map(mouseY, 0, height, 0.95, 1.25));
    rotate(map(mouseX, 0, width, -0.5, 0.5));
    translate(-width*0.5, -height*0.5);
    image(get(), 0, 0);

    stroke(255);
    translate(0, height*0.5);
    float ly= 0;
    for (int x= 1; x<BUFFERSIZE; x++) {
        float y= waveData[x]*255.0;
        //line(x, y, x, 0);
        line(x, y, x-1, ly);
        //rect(x, y, 1, 1);
        ly= y;
    }
}
```

![waveToProcessing.png](waveToProcessing.png?raw=true "waveToProcessing.png")

note: you will need to have the video library installed. see above on how to install it.

slitscan
--

```cpp
import processing.video.*;
final int numDelays= 12;  //try changing this
PImage img;
Capture cam;
void setup() {
    size(800, 480);
    cam = new Capture(this, width, height);
    cam.start();
    img= createImage(width, height, RGB);
}
void draw() {
    if (cam.available()) {
        cam.read();
        int slotWidth= width/(numDelays+1);
        for (int i= numDelays; i>0; i--) {
            img.copy(img, slotWidth*(i-1), 0, slotWidth, height, slotWidth*i, 0, slotWidth, height);
        }
        img.copy(cam, 0, 0, slotWidth, height, 0, 0, slotWidth, height); 
        image(img, 0, 0);
    }
}
```

also see the examples SlitScan, Spatiotemporal and Time Displacement. they are in File / Examples / Libraries / Video /

extra
--

```cpp
import processing.video.*;
Capture cam;
void setup() {
    size(800, 800);
    cam = new Capture(this, width, height);
    cam.start();
    background(0);
}
void draw() {
    if (cam.available()) {
        cam.read();
        translate(width*0.5, height*0.5);
        rotate(frameCount* -0.005);  //rotation speed
        scale(1, 0.1);
        translate(-width*0.5, -height*0.5);
        image(cam, 0, 0);
    }
}
```
