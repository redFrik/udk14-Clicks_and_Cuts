patching
--

programming with patchcoords and object boxes.

maxmsp
--

please download and install the demo of maxmsp <https://cycling74.com>

very good series of maxmspjitter tutorials <https://www.youtube.com/watch?v=5RYy8Cvgkqk&list=PLD45EDA6F67827497>

a typical max patch from back-in-the-days (max v4.1)...

![modsquad_os9.png](modsquad_os9.png?raw=true "modsquad_os9.png")

today (max v7.1) things look more stylish...

![modsquad.png](modsquad.png?raw=true "modsquad.png")

(in max7 you can find ModSquad.maxpat by clicking on filebrowser (to the left), and then search for modsquad)

let's build something very simple...

![random_music_max.png](random_music_max.png?raw=true "random_music_max.png")

now look at `drunk.maxpat` and `fileplayer.maxpat` (see top of this page).

nato.0+55
--

amazing video library for maxmsp. no longer available.

<https://en.wikipedia.org/wiki/Nato.0%2B55%2B3d>

<https://en.wikipedia.org/wiki/Netochka_Nezvanova_(author)>

<https://vimeo.com/10182005> website example

<http://0100101110101101.org/files/art.teleportacia.org/hybrids/00011/10011.html> careful here!

article about nato.0+55 <http://www.bootsquad.com/old_site/nato/nato00.html>

some examples of typical nn/integer/antiorp emails...

<https://lists.puredata.info/pipermail/pd-ot/2000-06/000220.html>

<https://music.columbia.edu/pipermail/music-dsp/2000-June/037827.html>

<http://mail.bek.no/pipermail/55/2005-October/006636.html>

<https://music.columbia.edu/pipermail/music-dsp/1999-February/033416.html>

puredata
--

there's also a free and open-source alternative to maxmsp. see <https://puredata.info>. pure-data can do sound and graphics (gem) just as well as maxmsp but it's less 'polished' and doesn't come with as many examples and helpfiles.

here's the same patch as above but written for pd...

![random_muisc_pd.png](random_muisc_pd.png?raw=true "random_muisc_pd.png")

bonus (advanced)
--

command line sound effects (in terminal):

`brew install sox` #on osx with brew

then you can do...

`play /Applications/Max.app/Contents/Resources/C74/media/msp/cherokee.aif echo 0.8 0.9 1000 0.3 reverb 80`

see <https://h3manth.com/2009/01/08/sox-sound-exchange-2>

```supercollider
//or in realtime with supercollider
s.boot

//test with mic
{AllpassN.ar(SoundIn.ar, 1, 0.4, 4)!2}.play
{CombN.ar(SoundIn.ar, 1, 0.4, 4)!2}.play

//test with file
b= Buffer.read(s, "/Applications/Max.app/Contents/Resources/C74/media/msp/cherokee.aif")

{Splay.ar(AllpassN.ar(PlayBuf.ar(b.numChannels, b, loop:0), 1, 0.4, 4))}.play
{CombN.ar(PlayBuf.ar(1, b, loop:0), 1, 0.2, 2)!2}.play

//detecting when echo is done and the sound is silent
(
a= {
    var snd= PlayBuf.ar(b.numChannels, b);
    var efx= CombN.ar(snd, 0.25, 0.25, 2);
    DetectSilence.ar(efx, doneAction:2);
    Splay.ar(efx);
}.play;
a.onFree({
    "done!".postln;
    NetAddr("127.0.0.1", 12345).sendMsg(\done); //send to processing
});
)

//or with the AllpassN
(
a= {
    var snd= PlayBuf.ar(b.numChannels, b);
    var efx= AllpassN.ar(snd, 0.25, 0.25, 2);
    DetectSilence.ar(efx, doneAction:2);
    Splay.ar(efx);
}.play;
a.onFree({
    "done!".postln;
    NetAddr("127.0.0.1", 12345).sendMsg(\done); //send to processing
});
)

//or with reverb
(
a= {
    var snd= PlayBuf.ar(b.numChannels, b);
    var efx= GVerb.ar(snd, 300, 5, 0.5, 0.9, 50, 1, 0.9, 0.9);
    DetectSilence.ar(efx, doneAction:2);
    Splay.ar(efx);
}.play;
a.onFree({
    "done!".postln;
    NetAddr("127.0.0.1", 12345).sendMsg(\done); //send to processing
});
)

//or this variant
(
a= {
    var snd= PlayBuf.ar(b.numChannels, b);
    var efx= Mix.fill(8, {snd= snd+AllpassN.ar(LPF.ar(snd, 10000.rand), 0.4, 0.4.rand, 3)});
    DetectSilence.ar(efx, doneAction:2);
    Splay.ar(efx);
}.play;
a.onFree({
    "done!".postln;
    NetAddr("127.0.0.1", 12345).sendMsg(\done); //send to processing
});
)
```
