crackles
--

material:

scotch tape, razorblade, cd, cd player

reading
--

[Julien Herion - Yasunao Tone’s Solo for Wounded CD and the Aesthetics of Failure](http://www.academia.edu/8204212/Yasunao_Tones_Solo_for_Wounded_CD_and_the_Aesthetics_of_Failure)

Caleb Kelly - [Cracked and Broken Media in 20th and 21st Century Music and Sound](http://www.canberra.edu.au/researchrepository/file/1d26377d-9390-2343-97c6-d68b52a1ab32/1/full_text.pdf) (chapter 3)

Caleb Stuart - Yasunao Tone's Wounded and Skipping Compact Discs: From Improvisation and Indeterminate Composition to Glitching CDs. Leonardo Electronic Almanac, vol. 10, no. 9, 2002

Caleb Stuart - Damaged Sound: Glitching and Skipping Compact Discs in the Audio of Yasunao Tone, Nicolas Collins and Oval. In Leonardo Music Journal 13 (2003): 47-52

<https://en.wikipedia.org/wiki/C2_error>

listening
--

[Yasunao Tone - Solo for Wounded CD](https://www.youtube.com/watch?v=ElF5pb7sos8)

<https://soundandinteraction.wordpress.com/nick/>

vinyl
--

[Thomas Brinkmann - live clicks and cuts](https://www.youtube.com/watch?v=t8dOo-jBkxM)

[Christian Marclay - Record Without a Cover](https://en.wikipedia.org/wiki/Record_Without_a_Cover)

simulation
--

supercollider code

you can download the soundfiles used below from here...

<https://raw.githubusercontent.com/OSSIA/Jamoma4Max4Live/master/Demo1/Jamomized%20Live%20Project/Samples/Imported/duduk.aif>

<https://raw.githubusercontent.com/OSSIA/Jamoma4Max4Live/master/Demo1/Jamomized%20Live%20Project/Samples/Imported/cherokee.aif>

<https://raw.githubusercontent.com/OSSIA/Jamoma4Max4Live/master/Demo1/Jamomized%20Live%20Project/Samples/Imported/jongly.aif>

but i highly recommend you use your own mono soundfiles.

```
s.boot

b.free
b= Buffer.read(s, "/Applications/Max.app/Contents/Resources/C74/media/msp/duduk.aif") //edit to match your own mono file
b= Buffer.read(s, "/Applications/Max.app/Contents/Resources/C74/media/msp/cherokee.aif")
b= Buffer.read(s, "/Applications/Max.app/Contents/Resources/C74/media/msp/jongly.aif")
b.plot //just to see and make sure it was loaded

//
(   //move the mouse to the right hand side (>0.5) to trigger a 'glitch'
{
    PlayBuf.ar(1, b, 1, MouseX.kr(0, 1)>0.5, 2000, loop: 1);
}.play;
)

(   //automatic trigger a 'glitch' every 0.5 second (twice/sec)
{
    PlayBuf.ar(1, b, 1, Impulse.kr(2), 2000, loop: 1);
}.play;
)

(   //move the mouse to set the speed of the automatic trigger
{
    PlayBuf.ar(1, b, 1, Impulse.kr(MouseX.kr(1, 100)), 6000, loop: 1);
}.play;
)

//same as above but with additional control over offset (where in the sound file the 'glitch' should jump to)

(
{
    PlayBuf.ar(1, b, 1, MouseX.kr(0, 1)>0.5, MouseY.kr(0, BufFrames.ir(b)-1), loop: 1);
}.play;
)

(
{
    PlayBuf.ar(1, b, 1, Impulse.kr(2), MouseY.kr(0, BufFrames.ir(b)-1), loop: 1);
}.play;
)

(
{
    PlayBuf.ar(1, b, 1, Impulse.kr(MouseX.kr(1, 100)), MouseY.kr(0, BufFrames.ir(b)-1), loop: 1);
}.play;
)

//to make it sound less 'metallic' and more 'natural', try adding some randomness to both the trigger rate and trigger offset.
(
{
    PlayBuf.ar(1, b, 1, Impulse.kr(MouseX.kr(1, 100)+LFNoise2.kr(1, 1)), MouseY.kr(0, BufFrames.ir(b)-1)+LFNoise2.kr(1, 50), loop: 1)!2;
}.play;
)

//experiment with LFNoise0, LFNoise1, LFNoise2 at different rates and different amplitudes.
```

more advanced examples.  try with different type of sounds - drumloops, drones, recorded instruments, voices.

```
//

(
{
    var trigger= Impulse.ar(MouseY.kr(0.1, 100, 1)+LFNoise1.kr(0.1));
    var offset= MouseX.kr(0, BufFrames.ir(b)-1);
    var src= PlayBuf.ar(1, b, 1, trigger, offset, 1);
    Pan2.ar(src, LFNoise2.kr(1, 0.5));
}.play
)


//same but press mouse button to start stuttering
(
{
    var trigger= Impulse.ar(MouseY.kr(0.1, 100, 1)+LFNoise1.kr(0.1));
    var offset= MouseX.kr(0, BufFrames.ir(b)-1);
    var src= PlayBuf.ar(1, b, 1, trigger, offset, 1);
    var src2= PlayBuf.ar(1, b, 1, 1, 0, 1);
    Pan2.ar(XFade2.ar(src2, src, MouseButton.kr(-1, 1, 0.2)), LFNoise2.kr(1, 0.5)); //0.2 is xfade time
}.play
)

//or the same but stutters when you press the key 'J'
(
{
    var trigger= Impulse.ar(MouseY.kr(0.1, 100, 1)+LFNoise1.kr(0.1));
    var offset= MouseX.kr(0, BufFrames.ir(b));
    var src= PlayBuf.ar(1, b, 1, trigger, offset, 1);
    var src2= PlayBuf.ar(1, b, 1, 1, 0, 1);
    Pan2.ar(XFade2.ar(src2, src, KeyState.kr(38, -1, 1, 0.2)), LFNoise2.kr(1, 0.5)); //0.2 is xfade time
}.play
)
```

another example that uses ascii values from a string to set the playback rate.

```
(
a= {|rate= 1|
    var trigger= Impulse.ar(rate);
    var src= PlayBuf.ar(1, b, 1, trigger, 0, 1);
    src
}.play
)

a.set(\rate, "E".ascii);  //test some different characters

(
Task({
    var str= "hej alla glada!!!";  //edit this string
    str.do{|chr|
        a.set(\rate, chr.postln.ascii);
        0.25.wait;  //playback rate
    };
    a.set(\rate, 1);
    "done".postln;
}).play
)

a.release(2) //fade out in 2sec
```



record sound into buffer with mic.  (also you can of course use Audacity)

```
s.boot

b= Buffer.alloc(s, 3*s.sampleRate); //create an empty 3sec mono buffer


//run this once to record from mic into buffer - also while the examples above are running
//then you can dynamically fill the buffer - or record the output in a feedback way
(
{
    RecordBuf.ar(SoundIn.ar, b, loop: 0, doneAction:2);
}.play;
)

b.plot; //see
b.play; //test

//save content of b to disk
b.write("~/mybuff.aiff".standardizePath);
```

automatic cutup...

```
//read a drumloop
b= Buffer.readChannel(s, "/Applications/Max.app/Contents/Resources/C74/media/msp/jongly.aif", channels:[0]); //edit

(
{
    //var trigger= Amplitude.ar(SoundIn.ar)>0.8; //use mic to trigger
    var trigger= Impulse.ar(LFNoise1.kr(0.1).exprange(1, 1000)); //1000 is max trigger frequency
    //var offset= 0;
    var offset= LFNoise1.kr(0.1).range(0, BufFrames.ir(b)-1);
    //var rate= 1;
    var rate= LFNoise1.kr(0.1).exprange(0.5, 2);
    var src= PlayBuf.ar(1, b, rate, trigger, offset, 1); //wet
    var src2= PlayBuf.ar(1, b, 1, 1, 0, 1); //dry
    var xfade= LFNoise1.kr(1).range(-2, 2).clip(-1, 1); //switch between dry/wet
    Pan2.ar(XFade2.ar(src2, src, xfade), LFNoise2.kr(1, 0.5));
}.play
)
```

last also try GrainBuf - as opposed to PlayBuf it will play a lot of overlapping segments of the soundfile and also apply an envelope (no click and you can control attack and release time).

```
{GrainBuf.ar(1, Impulse.kr(MouseX.kr(1, 100)), 1, b)}.play

{GrainBuf.ar(1, Impulse.kr(MouseX.kr(1, 100)), 1, b, MouseY.kr(0.1, 2)+LFNoise2.kr(1))}.play
```


extra
--

gui control. set volume with left hand side sliders, click 'ed' to edit indidivual parameters.

```
(
Ndef(\a, {|pfreq= 4, rate= 1| GrainBuf.ar(1, Impulse.kr(pfreq), 1, b, rate+LFNoise2.kr(1))}).play;
Ndef(\b, {|pfreq= 4, rate= 1| GrainBuf.ar(1, Impulse.kr(pfreq), 1, b, rate+LFNoise2.kr(1))}).play;
Ndef(\c, {|pfreq= 4, rate= 1| GrainBuf.ar(1, Impulse.kr(pfreq), 1, b, rate+LFNoise2.kr(1))}).play;
Ndef(\d, {|pfreq= 4, rate= 1| GrainBuf.ar(1, Impulse.kr(pfreq), 1, b, rate+LFNoise2.kr(1))}).play;
Ndef(\e, {|pfreq= 4, rate= 1| GrainBuf.ar(1, Impulse.kr(pfreq), 1, b, rate+LFNoise2.kr(1))}).play;
Ndef(\f, {|pfreq= 4, rate= 1| GrainBuf.ar(1, Impulse.kr(pfreq), 1, b, rate+LFNoise2.kr(1))}).play;
)
NdefMixer(s);
``


extra
--

simple example demonstrating how to send numbers from processing to supercollider for soundfile playback.

click the mouse to play next soundfile. you will need to install the oscP5 library for processing and provide a folder with soundfiles (see `var names`...).

```
//--supercollider code...
(
s.latency= 0.05;
s.waitForBoot{
    var names= "/Applications/Max.app/Contents/Resources/C74/media/msp/*".pathMatch; //edit to point to a folder with soundfiles
    names.do{|x, i| (""+i+x).postln};  //debug
    OSCdef(\file, {|msg|
        var path;
        msg.postln;  //debug
        path= names.wrapAt(msg[1]);
        path.postln;  //debug
        b.free;  //free previous buffer
        b= Buffer.readChannel(s, path, channels: [0], action:{|x|
            {PlayBuf.ar(1, x, 1, doneAction:2)!2}.play(fadeTime: 0);  //fadeTime is attack
        });
    }, \file);
};
)
```

```cpp
//--processing code

import oscP5.*;
import netP5.*;

OscP5 oscP5;
NetAddress supercollider;
int index= 0;  //which file to play

void setup() {
    size(400, 300);
    oscP5= new OscP5(this, 12000);
    supercollider= new NetAddress("127.0.0.1", 57120);  //ip supercollider
}
void draw() {
}
void mousePressed() {
    sendOsc(index);
    index= index+1;
}
void sendOsc(int i) {      //osc out
    OscMessage msg= new OscMessage("/file");
    msg.add(i);
    oscP5.send(msg, supercollider);
}
```
