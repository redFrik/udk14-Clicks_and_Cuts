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
