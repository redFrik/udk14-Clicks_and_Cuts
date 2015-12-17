glitches
--

doing it all 'wrong'

```
{Limiter.ar(Saw.ar(1)%Saw.ar(8))}.play
{Limiter.ar(Saw.ar(1)|Saw.ar(8))}.play
{Limiter.ar(Saw.ar(1)<Saw.ar(8))}.play
{Limiter.ar(Saw.ar([1, 1.1])<Saw.ar(8))}.play
{Limiter.ar(Saw.ar(1)&Saw.ar(8))}.play
{sin(Saw.ar(1)+Saw.ar(8)+Saw.ar(0.25))}.play
{Limiter.ar(Saw.ar(8, SinOsc.ar([50, 51])))}.play
{Limiter.ar(Saw.ar(8, Saw.ar([50, 51])))}.play
```


download and install sc3 plugins (3.6 SC3ExtPlugins-universal.dmg for osx, sc3-plugins-3.6.0-win32.zip for win)

http://sourceforge.net/projects/sc3-plugins/files/

```
{Limiter.ar(GlitchBPF.ar(Saw.ar([500, 600]), -2, 1000))}.play
{Limiter.ar(FreeVerb.ar(GlitchBPF.ar(Saw.ar, Saw.ar(1), SinOsc.ar([0.4, 0.5])*2000)))}.play
{Limiter.ar(GlitchRHPF.ar(SinOsc.ar(1000), Saw.ar(8)*2, SinOsc.ar([4.01, 3.06])*2000))}.play
```


extra
--

loading soundfiles and playing back using a pattern sequencer

```
s.boot;

(
SynthDef(\samplerMono, {|out= 0, buf, atk= 0.01, amp= 0.5, rel= 0.1, gate= 1, cur= 0, start= 0, rate= 1, pan= 0|
var env= EnvGen.ar(Env.asr(atk, amp, rel, cur), gate, doneAction:2);
var src= PlayBuf.ar(1, buf, rate*BufRateScale.ir(buf), 1, start*BufFrames.ir(buf), 1)*SinOsc.ar(1000);
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
