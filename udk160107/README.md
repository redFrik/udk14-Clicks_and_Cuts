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

```
s.boot

b.free
b= Buffer.read(s, "/Applications/Max.app/Contents/Resources/C74/media/msp/duduk.aif") //edit to match your own mono file
b= Buffer.read(s, "/Applications/Max.app/Contents/Resources/C74/media/msp/cherokee.aif")
b= Buffer.read(s, "/Applications/Max.app/Contents/Resources/C74/media/msp/jongly.aif")
b.plot //just to see and make sure it was loaded

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
```

record sound into buffer with mic.  (also you can of course use Audacity)

```
s.boot

b= Buffer.alloc(s, 3*s.sampleRate); //create an empty 3sec mono buffer


//run this once to record from mic into buffer
(
{
    RecordBuf.ar(SoundIn.ar, b, loop: 0, doneAction:2);
}.play;
)


b.plot; //see
b.play; //test
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
