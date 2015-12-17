glitches
--

doing it all 'wrong'

processing
--

* [sketch_151217a](https://github.com/redFrik/udk14-Clicks_and_Cuts/tree/master/udk151217/sketch_151217a/sketch_151217a.pde)
* [sketch_151217b](https://github.com/redFrik/udk14-Clicks_and_Cuts/tree/master/udk151217/sketch_151217b/sketch_151217b.pde)
* [sketch_151217c](https://github.com/redFrik/udk14-Clicks_and_Cuts/tree/master/udk151217/sketch_151217c/sketch_151217c.pde)
* [sketch_151217d](https://github.com/redFrik/udk14-Clicks_and_Cuts/tree/master/udk151217/sketch_151217d/sketch_151217d.pde)
* [sketch_151217e](https://github.com/redFrik/udk14-Clicks_and_Cuts/tree/master/udk151217/sketch_151217e/sketch_151217e.pde)
* [sketch_151217f](https://github.com/redFrik/udk14-Clicks_and_Cuts/tree/master/udk151217/sketch_151217f/sketch_151217f.pde)


```cpp
//spiral - use mouse to control how much glitch
void setup() {
    size(800, 600);
    noStroke();
}
void draw() {
    background(0);
    translate(width*0.5, height*0.5);
    float theta= sin(frameCount*0.001)*TWO_PI*4;
    for(int y= 0; y<height; y++) {
        for(int i= 0; i<10; i++) {
            if(random(2000)<map(mouseX, 0, width, 0.0, 2.0)) {
                theta= 0;
            }
            rotate(theta*0.001);
            rect(sin(y*0.1+theta+(i*2))*100, y, 2, 2);
        }
    }
}
```

supercollider
--

careful - the sounds below might be very loud.

```
{LFSaw.ar(1)}.play //non-band limited
{Saw.ar(1)}.play  //band limited - not generating frequencies >22050 (half s.r.)

{Limiter.ar(Saw.ar(1)%Saw.ar(8))}.play
{Limiter.ar(Saw.ar(1)|Saw.ar(8))}.play
{Limiter.ar(Saw.ar(1)<Saw.ar(8))}.play
{Limiter.ar(Saw.ar([1, 1.1])<Saw.ar(8))}.play
{Limiter.ar(Saw.ar(1)&Saw.ar(8))}.play
{sin(Saw.ar(1)+Saw.ar(8)+Saw.ar(0.25))}.play
{Limiter.ar(Saw.ar(8, SinOsc.ar([50, 51])))}.play
{Limiter.ar(Saw.ar(8, Saw.ar([50, 51])))}.play

{Limiter.ar(Saw.ar(100)*Saw.ar(8)%Saw.ar(1.25))}.play
{Limiter.ar(Saw.ar(-8)*Saw.ar([50, 51]))}.play
{Limiter.ar(Saw.ar(-8)%Saw.ar([50, 51]))}.play
{Limiter.ar(Saw.ar(-8)%Saw.ar([50, 51])%Saw.ar(5))}.play
{sin(Saw.ar(0.1)+Saw.ar(0.2)+Saw.ar(0.3)+Saw.ar(0.4)+Saw.ar(0.5))}.play

{LFPulse.ar}.plot //non-band limited
{Pulse.ar}.plot  //band limited

{Limiter.ar(Pulse.ar(1)%Pulse.ar(10000))}.play
{Limiter.ar(Pulse.ar([1,0.9])*Pulse.ar(10000))}.play
{sin(Pulse.ar(1.5)+Pulse.ar(1.4)+Pulse.ar(1.3)+Pulse.ar(1.2)+Pulse.ar(1.1))}.play

```


download and install sc3 plugins (3.6 SC3ExtPlugins-universal.dmg for osx, sc3-plugins-3.6.0-win32.zip for win)

http://sourceforge.net/projects/sc3-plugins/files/

```
{Limiter.ar(GlitchBPF.ar(Saw.ar([500, 600]), -2, 1000))}.play
{Limiter.ar(FreeVerb.ar(GlitchBPF.ar(Saw.ar, Saw.ar(1), SinOsc.ar([0.4, 0.5])*2000)))}.play
{Limiter.ar(GlitchRHPF.ar(SinOsc.ar(1000), Saw.ar(8)*2, SinOsc.ar([4.01, 3.06])*2000))}.play

{GlitchRHPF.ar(GbmanN.ar([2300,1150]),LFSaw.ar(Pulse.ar(4,[1,2]/8,1,LFPulse.ar(1/8)/5+1))+2)}.play//#SuperCollider

{SinOsc.ar(0.1, GlitchRHPF.ar(SinOsc.ar(MouseY.kr(1, 9999, 1), 2pi), 1/MouseX.kr(1, 99, 1), 4), 1)!2}.play

{LeakDC.ar(Saw.ar(0.1, GlitchRHPF.ar(Saw.ar(MouseY.kr(1, 9999, 1), 2pi), 1/MouseX.kr(1, 99, 1), 4), 1)!2)}.play

{Limiter.ar(MoogFF.ar(Saw.ar(10), 500000*Saw.ar(3), 4*Saw.ar(2.01)))}.play
```

```
//	attack of the mutant pigs
//	/fO 020104

({GlitchRHPF.ar(
    BrownNoise.ar([1,1]),
    LFSaw.kr(FSinOsc.kr(0.06,0.7,0.15),0.79,LFSaw.kr(0.06,1,2)),
    FSinOsc.kr(FSinOsc.kr(0.3,0.5,0.49),0.5,0.5)
).clip2(0.6)}.play)

```

extra
--

loading soundfiles and playing back using a pattern sequencer

```
s.boot;

(
SynthDef(\samplerMono, {|out= 0, buf, atk= 0.01, amp= 0.5, rel= 0.1, gate= 1, cur= 0, start= 0, rate= 1, pan= 0|
    var env= EnvGen.ar(Env.asr(atk, amp, rel, cur), gate, doneAction:2);
    var src= PlayBuf.ar(1, buf, rate*BufRateScale.ir(buf), 1, start*BufFrames.ir(buf), 1);
    Out.ar(out, Pan2.ar(src, pan, env));
}).add;
)

//here edit and add your own soundfiles
(
~buffers= [
"/Users/abc/musicradar-nu-disco-samples/125bpm Loops n Lines/Bass/ND_CoBass_125_A-01.wav",
"/Users/abc/musicradar-nu-disco-samples/125bpm Loops n Lines/Bass/ND_CoBass_125_A-02.wav",
"/Users/abc/musicradar-nu-disco-samples/125bpm Loops n Lines/Bass/ND_CoBass_125_C-01.wav",
"/Users/abc/musicradar-nu-disco-samples/125bpm Loops n Lines/Bass/ND_CoBass_125_C-02.wav",
"/Users/abc/musicradar-nu-disco-samples/125bpm Loops n Lines/Bass/ND_CoBass_125_E-01.wav",
"/Users/abc/musicradar-nu-disco-samples/125bpm Loops n Lines/Bass/ND_CoBass_125_E-02.wav",
"/Users/abc/musicradar-nu-disco-samples/125bpm Loops n Lines/Bass/ND_DuberBass_125_A-01.wav",
"/Users/abc/musicradar-nu-disco-samples/125bpm Loops n Lines/Bass/ND_DuberBass_125_A-02.wav",
"/Users/abc/musicradar-nu-disco-samples/125bpm Loops n Lines/Bass/ND_DuberBass_125_C-01.wav",
"/Users/abc/musicradar-nu-disco-samples/125bpm Loops n Lines/Bass/ND_DuberBass_125_C-02.wav",
"/Users/abc/musicradar-nu-disco-samples/125bpm Loops n Lines/Bass/ND_DuberBass_125_E-01.wav",
"/Users/abc/musicradar-nu-disco-samples/125bpm Loops n Lines/Bass/ND_DuberBass_125_E-02.wav",
"/Users/abc/musicradar-nu-disco-samples/125bpm Loops n Lines/Bass/ND_Ray77_125_A-01.wav",
"/Users/abc/musicradar-nu-disco-samples/125bpm Loops n Lines/Bass/ND_Ray77_125_A-02.wav",
"/Users/abc/musicradar-nu-disco-samples/125bpm Loops n Lines/Bass/ND_Ray77_125_C-01.wav",
"/Users/abc/musicradar-nu-disco-samples/125bpm Loops n Lines/Bass/ND_Ray77_125_C-02.wav",
"/Users/abc/musicradar-nu-disco-samples/125bpm Loops n Lines/Bass/ND_Ray77_125_E-01.wav",
"/Users/abc/musicradar-nu-disco-samples/125bpm Loops n Lines/Bass/ND_Ray77_125_E-02.wav",
"/Users/abc/musicradar-nu-disco-samples/125bpm Loops n Lines/Bass/ND_Ray79_125_A-01.wav",
"/Users/abc/musicradar-nu-disco-samples/125bpm Loops n Lines/Bass/ND_Ray79_125_A-02.wav",
"/Users/abc/musicradar-nu-disco-samples/125bpm Loops n Lines/Bass/ND_Ray79_125_C-01.wav",
"/Users/abc/musicradar-nu-disco-samples/125bpm Loops n Lines/Bass/ND_Ray79_125_C-02.wav",
"/Users/abc/musicradar-nu-disco-samples/125bpm Loops n Lines/Bass/ND_Ray79_125_E-01.wav",
"/Users/abc/musicradar-nu-disco-samples/125bpm Loops n Lines/Bass/ND_Ray79_125_E-02.wav",
"/Users/abc/musicradar-nu-disco-samples/125bpm Loops n Lines/Bass/ND_Ripper_125_A-01.wav",
"/Users/abc/musicradar-nu-disco-samples/125bpm Loops n Lines/Bass/ND_Ripper_125_A-02.wav",
"/Users/abc/musicradar-nu-disco-samples/125bpm Loops n Lines/Bass/ND_Ripper_125_C-01.wav",
"/Users/abc/musicradar-nu-disco-samples/125bpm Loops n Lines/Bass/ND_Ripper_125_C-02.wav",
"/Users/abc/musicradar-nu-disco-samples/125bpm Loops n Lines/Bass/ND_Ripper_125_E-01.wav",
"/Users/abc/musicradar-nu-disco-samples/125bpm Loops n Lines/Bass/ND_Ripper_125_E-02.wav"
].collect{|x| Buffer.readChannel(s, x, channels:[0])};
)

(
Pdef(\player1, Pbind(
    \instrument, \samplerMono,
    \buf, ~buffers[1],
    \rate, -2,
    \amp, 1
)).play(quant: 1);
)


(
Pdef(\player2, Pbind(
    \instrument, \samplerMono,
    \buf, ~buffers[3],
    \rate, Pseq([2, 2, 2, 4], inf),
    \dur, 0.5,
    \amp, 1
)).play(quant: 1);
)

(
Pdef(\player3, Pbind(
    \instrument, \samplerMono,
    \buf, Pfunc({~buffers.choose}),
    \rate, -8,
    \start, 0.5,
    \atk, 0,
    \legato, 3,
    \dur, 0.25,
    \pan, Pwhite(-1.0, 1.0),
    \amp, Pwhite(0.0, 1.0)
)).play(quant: 1);
)
```

bonus
--

spiral example ported to supercollider

```
(
var width= 800, height= 600;
var win= Window("spiral", Rect(100, 100, width, height), false);
var usr= UserView(win, Rect(0, 0, width, height));
usr.background= Color.black;
usr.animate= true;
usr.drawFunc= {
    var theta= sin(usr.frame*0.001)*2pi*4;
    Pen.fillColor= Color.white;
    Pen.translate(width*0.5, height*0.5);
    height.do{|y|
        10.do{|i|
            Pen.rotate(theta*0.001);
            Pen.fillRect(Rect(sin(y*0.1+theta+(i*2))*100, y, 2, 2));
        };
    };
};
CmdPeriod.doOnce({win.close});
win.front;
)
```
