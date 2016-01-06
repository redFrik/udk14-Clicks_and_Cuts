crackles
--

material:

scotch tape, razorblade, cd, cd player

reading
--

Caleb Kelly - [Cracked and Broken Media in 20th and 21st Century Music and Sound](http://www.canberra.edu.au/researchrepository/file/1d26377d-9390-2343-97c6-d68b52a1ab32/1/full_text.pdf)

Caleb Stuart - Yasunao Tone's Wounded and Skipping Compact Discs: From Improvisation and Indeterminate Composition to Glitching CDs. Leonardo Electronic Almanac, vol. 10, no. 9, 2002

Caleb Stuart - Damaged Sound: Glitching and Skipping Compact Discs in the Audio of Yasunao Tone, Nicolas Collins and Oval. In Leonardo Music Journal 13 (2003): 47-52

simulation
--

supercollider code

```
s.boot

b= Buffer.read(s, "/Applications/Max.app/Contents/Resources/C74/media/msp/duduk.aif") //edit to match your own mono file
b= Buffer.read(s, "/Applications/Max.app/Contents/Resources/C74/media/msp/cherokee.aif")
b= Buffer.read(s, "/Applications/Max.app/Contents/Resources/C74/media/msp/jongly.aif")
b.plot //just to see and make sure it was loaded

(
{
    var trigger= Impulse.ar(MouseY.kr(0.1, 100, 1)+LFNoise1.kr(0.1));
    var offset= MouseX.kr(0, BufFrames.ir(b));
    var src= PlayBuf.ar(1, b, 1, trigger, offset, 1);
    Pan2.ar(src, LFNoise2.kr(1, 0.5));
}.play
)


//same but press mouse button to start stuttering
(
{
    var trigger= Impulse.ar(MouseY.kr(0.1, 100, 1)+LFNoise1.kr(0.1));
    var offset= MouseX.kr(0, BufFrames.ir(b));
    var src= PlayBuf.ar(1, b, 1, trigger, offset, 1);
    var src2= PlayBuf.ar(1, b, 1, 1, 0, 1);
    Pan2.ar(XFade2.ar(src2, src, MouseButton.kr(-1, 1, 0.2)), LFNoise2.kr(1, 0.5)); //0.2 is xfade time
}.play
)
```
