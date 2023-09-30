OSCdef(\myResponder, {
    |msg, time, addr, recvPort|

    "Message received".postln;
    msg.postln;

}, '/unity');