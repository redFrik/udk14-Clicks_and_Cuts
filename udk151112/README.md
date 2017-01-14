cut experiments
--

please bring laptop+headphones.

and download and install audacity <http://audacityteam.org>

listening
--

[Bernhard Günter](https://en.wikipedia.org/wiki/Bernhard_Günter) - untitled 1-92

[Ilmar Laaban](http://www.estlit.ee/elis/?cmd=writer&id=19315&txt=46567) - stentorsstön (text-sound compositions - a stockholm festival disc 4, 1967-68)

[John Oswald](https://en.wikipedia.org/wiki/John_Oswald_(composer)) - dab (plunderphonic cd, 1989)

reading
--

<https://en.wikipedia.org/wiki/Plunderphonics>

exercise1
--

make an endless/seamless loop.

1. open audacity and record something like your voice singing aaaaa...

2. cut away the beginning and the end so that you have a more or less stable sound.
![clickless_endless_00.png](clickless_endless_00.png?raw=true "clickless_endless_00.png")

3. select a bit in the end and do a fade out (effects menu).
![clickless_endless_01.png](clickless_endless_01.png?raw=true "clickless_endless_01.png")

4. cut the selection (cmd+x), make a new track and paste in the sound at the beginning.
![clickless_endless_02.png](clickless_endless_02.png?raw=true "clickless_endless_02.png")

5. select a bit of the beginning of the original track and do a fade in (effects menu).
![clickless_endless_03.png](clickless_endless_03.png?raw=true "clickless_endless_03.png")

6. select the two tracks and do a mix and render. last try looping it (shift-click on the play icon).
![clickless_endless_04.png](clickless_endless_04.png?raw=true "clickless_endless_04.png")

the sound should now repeat without discontinuities (no clicks or sudden jumps).
save it as a .wav or .aiff soundfile and make a few more.

exercise2
--

use [supercollider](http://supercollider.github.io/download.html) to make an endlessly varying sound texture composition.

```supercollider
//scrambler.scd
s.boot;

(
~buffers= [
    "/Users/abc/Desktop/endlessvoice1.aiff", //edit here to match your own soundfiles
    "/Users/abc/Desktop/endlessvoice2.aiff",
    "/Users/abc/Desktop/endlessvoice3.aiff"
    //add more buffers here
].collect{|path| Buffer.readChannel(s, path, channels:[0])};
SynthDef(\sampler, {|buf, atk= 5, sus= 5, rel= 5, rate= 1|
    var env= EnvGen.kr(Env.linen(atk, sus, rel), doneAction:2);
    var src= PlayBuf.ar(1, buf, rate, loop: 1);
    Out.ar(0, Pan2.ar(src, LFNoise2.kr(0.1), env));
}).add;
)

(
Tdef(\player, {
    var atk, sus, rel, rate;
    loop{
        atk= 3.rrand(6); //attack time
        sus= 5.rrand(10); //sustain time
        rel= 8.rrand(10); //release time
        rate= 0.15.bilinrand+1; //variation in pitch (playback speed)
        Synth(\sampler, [\buf, ~buffers.choose, \atk, atk, \sus, sus, \rel, rel, \rate, rate, ]);
        5.rrand(8).wait; //time between new synths
    };
}).play;
)

Tdef(\player).stop;


//texture
(
Tdef(\player, {
    var atk, sus, rel, rate;
    loop{
        atk= 0.01;
        sus= 0.4;
        rel= 0.1;
        rate= 0-[0.5, 1, 2, 3].choose; //backwards
        Synth(\sampler, [\buf, ~buffers.choose, \atk, atk, \sus, sus, \rel, rel, \rate, rate]);
        0.01.wait; //time between new synths
    };
}).play;
)

//rhythmic
(
Tdef(\player, {
    var atk, sus, rel, rate;
    loop{
        atk= 0.01;
        sus= 0.1;
        rel= 0.1;
        rate= [1, 2, 3].choose;
        Synth(\sampler, [\buf, ~buffers.choose, \atk, atk, \sus, sus, \rel, rel, \rate, rate]);
        0.125.wait; //time between new synths
    };
}).play;
)


//sequencer
(
Tdef(\player, {
    var atk, sus, rel, rate, i= 0;
    loop{
        atk= 0.005;
        sus= 0.01;
        rel= [1, 0.5, 0.1, 0.1, 0.1].wrapAt(i);
        rate= [1, 1.1, 1.2, 0.5].wrapAt(i);
        Synth(\sampler, [\buf, ~buffers.wrapAt(i), \atk, atk, \sus, sus, \rel, rel, \rate, rate]);
        0.2.wait; //time between new synths
        i= i+1;
    };
}).play;
)
```

exercise3
--

now do the same but with some samples from here...

<http://www.musicradar.com/news/tech/free-music-samples-download-loops-hits-and-multis-627820>
