s.boot;

(
~buffers= [
	"/Users/Stirling/Desktop/endlessvoice1.aiff",
	"/Users/Stirling/Desktop/endlessvoice2.aiff",
	"/Users/Stirling/Desktop/endlessvoice3.aiff"
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
