crush experiments
--

please bring laptop+headphones.

and download and install audacity <https://audacityteam.org>

listening
--

[DAT politics](https://www.datpolitics.com) - Hardwai

reading
--

<https://en.wikipedia.org/wiki/Bitcrusher>

exercise1
--

play with sample rate reduction in audacity

1. open audacity and record something like your voice singing aaaaa...

2. apply the 'Normalize...' effect from the effect menu
![crush_00.png](crush_00.png?raw=true "crush_00.png")

3. then click on the small track menu on the left and select 'Set Rate'. select 8000 Hz
![crush_01.png](crush_01.png?raw=true "crush_01.png")

4. last copy the sound and past it into a few other tracks. use the shift tool <-> to move it in time, again change rate in the track menu. make a short composition
![crush_02.png](crush_02.png?raw=true "crush_02.png")

exercise2
--

1. record a new sound in audacity

2. apply the 'Normalize...' effect from the effect menu

3. in the track menu, use 'Set Rate' 'Other...' and reduce it to something like 1000 Hz.
![rate_00.png](rate_00.png?raw=true "rate_00.png")

4. apply the 'Change Speed...' effect from the effect menu
![rate_01.png](rate_01.png?raw=true "rate_01.png")

5. set the 'Speed Multiplier' to something like 10
![rate_02.png](rate_02.png?raw=true "rate_02.png")

now experiment with different sounds, samplerates, speeds.

exercise3
--

use [supercollider](https://supercollider.github.io/download.html) to apply sample rate reduction and bit depth reduction

```supercollider
//crusher.scd
s.boot;

//downsample 1000Hz
{Latch.ar(SoundIn.ar, Impulse.ar(1000))!2}.play;

//downsample with mouse control
{Latch.ar(SoundIn.ar, Impulse.ar((SampleRate.ir*MouseX.kr(0, 0.5)).poll))!2}.play;

//downsample with delay
{Latch.ar(DelayN.ar(SoundIn.ar, 2, 2), Impulse.ar((SampleRate.ir*MouseX.kr(0, 0.5)).poll))!2}.play;

//downsample with echo
{Latch.ar(CombN.ar(SoundIn.ar, 0.25, 0.25, 2), Impulse.ar((SampleRate.ir*MouseX.kr(0, 0.5)).poll))!2}.play;

//bitreduction
{SoundIn.ar.round(0.5**3)!2}.play;

//bitreduction with mouse control
{SoundIn.ar.round(0.5**MouseX.kr(0.01, 10).poll)!2}.play;

//ring modulation 400Hz
{SoundIn.ar*SinOsc.ar(400)!2}.play

//ring modulation with mouse control
{SoundIn.ar*SinOsc.ar(MouseX.kr(1, 1000).poll)!2}.play

//ring modulation with delay
{DelayN.ar(SoundIn.ar, 2, 2)*SinOsc.ar(MouseX.kr(1, 1000).poll)!2}.play

//ring modulation with echo
{CombN.ar(SoundIn.ar, 0.25, 0.25, 2)*SinOsc.ar(MouseX.kr(1, 1000).poll)!2}.play

//downsample and bitreduce with mouse x/y
{Latch.ar(CombN.ar(SoundIn.ar, 0.25, 0.25, 2).round(0.5**MouseX.kr(0.01, 10)), Impulse.ar((SampleRate.ir*MouseY.kr(0, 0.5))))!2}.play

//same but effects in different order
{CombN.ar(Latch.ar(SoundIn.ar.round(0.5**MouseX.kr(0.01, 10)), Impulse.ar((SampleRate.ir*MouseY.kr(0, 0.5)))), 0.25, 0.25, 2)!2}.play

//+ring modulation
{CombN.ar(Latch.ar((SoundIn.ar*SinOsc.ar(MouseX.kr(1, 1000, 1))).round(0.5**MouseY.kr(0.01, 10)), Impulse.ar((SampleRate.ir*MouseY.kr(0, 0.5)))), 0.25, 0.25, 2)!2}.play
```

exercise4
--

now do the same but with some samples from here...

<https://www.musicradar.com/news/tech/free-music-samples-download-loops-hits-and-multis-627820>

```supercollider
//crusher_soundfile.scd
s.boot;

//edit to match your own soundfile
b= Buffer.read(s, "/Users/asdf/musicradar-nu-disco-samples/125bpm Loops n Lines/Main Beats/ND_BeatA125-01.wav");

//downsample 1000Hz
{Latch.ar(PlayBuf.ar(b.numChannels, b, 1, loop:1), Impulse.ar(1000))}.play;

//downsample with mouse control
{Latch.ar(PlayBuf.ar(b.numChannels, b, 1, loop:1), Impulse.ar((SampleRate.ir*MouseX.kr(0, 0.5)).poll))}.play;

//downsample with delay
{Latch.ar(DelayN.ar(PlayBuf.ar(b.numChannels, b, 1, loop:1), 2, 2), Impulse.ar((SampleRate.ir*MouseX.kr(0, 0.5)).poll))}.play;

//downsample with echo
{Latch.ar(CombN.ar(PlayBuf.ar(b.numChannels, b, 1, loop:1), 0.25, 0.25, 2), Impulse.ar((SampleRate.ir*MouseX.kr(0, 0.5)).poll))}.play;

//bitreduction
{PlayBuf.ar(b.numChannels, b, 1, loop:1).round(0.5**3)}.play;

//bitreduction with mouse control
{PlayBuf.ar(b.numChannels, b, 1, loop:1).round(0.5**MouseX.kr(0.01, 10).poll)}.play;

//ring modulation 400Hz
{PlayBuf.ar(b.numChannels, b, 1, loop:1)*SinOsc.ar(400)}.play

//ring modulation with mouse control
{PlayBuf.ar(b.numChannels, b, 1, loop:1)*SinOsc.ar(MouseX.kr(1, 1000).poll)}.play

//ring modulation with delay
{DelayN.ar(PlayBuf.ar(b.numChannels, b, 1, loop:1), 2, 2)*SinOsc.ar(MouseX.kr(1, 1000).poll)}.play

//ring modulation with echo
{CombN.ar(PlayBuf.ar(b.numChannels, b, 1, loop:1), 0.25, 0.25, 2)*SinOsc.ar(MouseX.kr(1, 1000).poll)}.play

//downsample and bitreduce with mouse x/y
{Latch.ar(CombN.ar(PlayBuf.ar(b.numChannels, b, 1, loop:1), 0.25, 0.25, 2).round(0.5**MouseX.kr(0.01, 10)), Impulse.ar((SampleRate.ir*MouseY.kr(0, 0.5))))}.play

//same but effects in different order
{CombN.ar(Latch.ar(PlayBuf.ar(b.numChannels, b, 1, loop:1).round(0.5**MouseX.kr(0.01, 10)), Impulse.ar((SampleRate.ir*MouseY.kr(0, 0.5)))), 0.25, 0.25, 2)}.play

//+ring modulation
{CombN.ar(Latch.ar((PlayBuf.ar(b.numChannels, b, 1, loop:1)*SinOsc.ar(MouseX.kr(1, 1000, 1))).round(0.5**MouseY.kr(0.01, 10)), Impulse.ar((SampleRate.ir*MouseY.kr(0, 0.5)))), 0.25, 0.25, 2)}.play
```

extra
--

```supercollider
//changing playback speed with mouse
{PlayBuf.ar(b.numChannels, b, MouseX.kr(-1, 2).poll, loop:1).round(0.5**MouseY.kr(1, 16))}.play;
```

extra2
--

```supercollider
//my crusher - use as a general effect - XFade2 with MouseX crossfades between 'dry' and 'wet' sound
(
{
    var src, efx;
    //src= PlayBuf.ar(b.numChannels, b, 1, loop:1); //soundfile
    src= SoundIn.ar!2;  //mic or line in
    efx= src.round(0.5**4);
    efx= Latch.ar(efx, Impulse.ar(1000));
    efx= efx+CombN.ar(efx, 0.25, 0.25, 2);
    XFade2.ar(src, efx, MouseX.kr(-1, 1));
}.play
)
```
