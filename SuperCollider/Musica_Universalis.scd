//  Musica Universalis               *
//                                   |
//  Antonio Rizzitiello - 2/10/2023  |
//                                   |
/*-----------------------------------*-----------------------------------*/
//                                                                        |
// Project structure:  sclang  <--- OSC ---> scsynth <--- OSC --- unity   |
//                                                                        |
// This code represents the sclang and scsynth part.                      |
//                                                                        |
// INPUT: OSC message with selected chord (tonality&color, eg [c, cmaj7]) |
//                                                                        |
// OUTPUT: generated melody arrays (pitches and durations) & playback     |
//                                                                        |
/*-----------------------------------------------------------------------*/







/* ------------- SERBER BOOT & UTILITIES (changing device) ------------- */

s.boot;


//~outputDevices = ServerOptions.outDevices;
//~outputDevices.do { |device|
//    device.postln;
//};

//eg. to set device at index 2 --> s.options.outDevice = 2;
//s.options.outDevice = ~outputDevices[0];
//s.reboot;

//{SinOsc.ar}.play







/* ------------- CHORD ARRAYS DEFINITIONS & UTILITIES ------------- */


/* CHORD & SCALES ARRAYS

DESCRIPTION: the following arrays represent extensions of triads and quadriads (MIDI note numbers) along the whole keyboard.
They will be greatly used in the project, specifically for selecting ON BEAT notes (vs OFF BEAT notes).
(ON BEAT notes are part of the underlying chord, while OFF BEAT notes can be any note of the respective tonality)

*/

// extended chords (MIDI note number). Used for generating ON BEAT notes
~chordArrays = (

	c: [0, 4, 7, 12, 16, 19, 24, 28, 31, 36, 40, 43, 48, 52, 55, 60, 64, 67, 72, 76, 79, 84, 88, 91, 96, 100, 103, 108, 112, 115, 120, 124, 127],
	cmaj7: [0, 4, 7, 11, 12, 16, 19, 23, 24, 28, 31, 35, 36, 40, 43, 47, 48, 52, 55, 59, 60, 64, 67, 71, 72, 76, 79, 83, 84, 88, 91, 95, 96, 100, 103, 107, 108, 112, 115, 119, 120, 124, 127],
	c7: [0, 4, 7, 10, 12, 16, 19, 22, 24, 28, 31, 34, 36, 40, 43, 46, 48, 52, 55, 58, 60, 64, 67, 70, 72, 76, 79, 82, 84, 88, 91, 94, 96, 100, 103, 106, 108, 112, 115, 118, 120, 124, 127],
	cm: [0, 3, 7, 12, 15, 19, 24, 27, 31, 36, 39, 43, 48, 51, 55, 60, 63, 67, 72, 75, 79, 84, 87, 91, 96, 99, 103, 108, 111, 115, 120, 123, 127],
	cm7: [0, 3, 7, 10, 12, 15, 19, 22, 24, 27, 31, 34, 36, 39, 43, 46, 48, 51, 55, 58, 60, 63, 67, 70, 72, 75, 79, 82, 84, 87, 91, 94, 96, 99, 103, 106, 108, 111, 115, 118, 120, 123, 127],
	cm7b5: [0, 3, 6, 10, 12, 15, 18, 22, 24, 27, 30, 34, 36, 39, 42, 46, 48, 51, 54, 58, 60, 63, 66, 70, 72, 75, 78, 82, 84, 87, 90, 94, 96, 99, 102, 106, 108, 111, 114, 118, 120, 123, 126],
	db: [1, 5, 8, 13, 17, 20, 25, 29, 32, 37, 41, 44, 49, 53, 56, 61, 65, 68, 73, 77, 80, 85, 89, 92, 97, 101, 104, 109, 113, 116],
	dbmaj7: [1, 5, 8, 12, 13, 17, 20, 24, 25, 29, 32, 36, 37, 41, 44, 48, 49, 53, 56, 60, 61, 65, 68, 72, 73, 77, 80, 84, 85, 89, 92, 96, 97, 101, 104, 108, 109, 113, 116, 120, 121, 125, 128],
	csmaj7: [1, 5, 8, 12, 13, 17, 20, 24, 25, 29, 32, 36, 37, 41, 44, 48, 49, 53, 56, 60, 61, 65, 68, 72, 73, 77, 80, 84, 85, 89, 92, 96, 97, 101, 104, 108, 109, 113, 116, 120, 121, 125, 128],
	db7: [1, 5, 8, 11, 13, 17, 20, 23, 25, 29, 32, 35, 37, 41, 44, 47, 49, 53, 56, 59, 61, 65, 68, 71, 73, 77, 80, 83, 85, 89, 92, 95, 97, 101, 104, 107, 109, 113, 116, 119, 121, 125, 128],
	cs7: [1, 5, 8, 11, 13, 17, 20, 23, 25, 29, 32, 35, 37, 41, 44, 47, 49, 53, 56, 59, 61, 65, 68, 71, 73, 77, 80, 83, 85, 89, 92, 95, 97, 101, 104, 107, 109, 113, 116, 119, 121, 125, 128],
	dbm: [1, 4, 8, 13, 16, 20, 25, 28, 32, 37, 40, 44, 49, 52, 56, 61, 64, 68, 73, 76, 80, 85, 88, 92, 97, 100, 104, 109, 112, 116, 121, 124, 128],
	csm: [1, 4, 8, 13, 16, 20, 25, 28, 32, 37, 40, 44, 49, 52, 56, 61, 64, 68, 73, 76, 80, 85, 88, 92, 97, 100, 104, 109, 112, 116, 121, 124, 128],
	dbm7: [1, 4, 8, 11, 13, 16, 20, 23, 25, 28, 32, 35, 37, 40, 44, 47, 49, 52, 56, 59, 61, 64, 68, 71, 73, 76, 80, 83, 85, 88, 92, 95, 97, 100, 104, 107, 109, 112, 116, 119, 121, 124, 127],
	csm7: [1, 4, 8, 11, 13, 16, 20, 23, 25, 28, 32, 35, 37, 40, 44, 47, 49, 52, 56, 59, 61, 64, 68, 71, 73, 76, 80, 83, 85, 88, 92, 95, 97, 100, 104, 107, 109, 112, 116, 119, 121, 124, 127],
	dbm7b5: [1, 4, 7, 11, 13, 16, 19, 23, 25, 28, 31, 35, 37, 40, 43, 47, 49, 52, 55, 59, 61, 64, 67, 71, 73, 76, 79, 83, 85, 88, 91, 95, 97, 100, 103, 107, 109, 112, 115, 119, 121, 124, 127],
	csm7b5: [1, 4, 7, 11, 13, 16, 19, 23, 25, 28, 31, 35, 37, 40, 43, 47, 49, 52, 55, 59, 61, 64, 67, 71, 73, 76, 79, 83, 85, 88, 91, 95, 97, 100, 103, 107, 109, 112, 115, 119, 121, 124, 127],
	d: [2, 6, 9, 14, 18, 21, 26, 30, 33, 38, 42, 45, 50, 54, 57, 62, 66, 69, 74, 78, 81, 86, 90, 93, 98, 102, 105, 110, 114, 117, 122, 126],
	dmaj7: [2, 6, 9, 13, 14, 18, 21, 25, 26, 30, 33, 37, 38, 42, 45, 49, 50, 54, 57, 61, 62, 66, 69, 73, 74, 78, 81, 85, 86, 90, 93, 97, 98, 102, 105, 109, 110, 114, 117, 121, 122, 126],
	d7: [2, 6, 9, 12, 14, 18, 21, 24, 26, 30, 33, 36, 38, 42, 45, 48, 50, 54, 57, 60, 62, 66, 69, 72, 74, 78, 81, 84, 86, 90, 93, 96, 98, 102, 105, 108, 110, 114, 117, 120, 122, 126],
	dm: [2, 5, 9, 14, 17, 21, 26, 29, 33, 38, 41, 45, 50, 53, 57, 62, 65, 69, 74, 77, 81, 86, 89, 93, 98, 101, 105, 110, 113, 117, 122, 125],
	dm7: [2, 5, 9, 12, 14, 17, 21, 24, 26, 29, 33, 36, 38, 41, 45, 48, 50, 53, 57, 60, 62, 65, 69, 72, 74, 77, 81, 84, 86, 89, 93, 96, 98, 101, 105, 108, 110, 113, 117, 120, 122, 125],
	dm7b5: [2, 5, 8, 12, 14, 17, 20, 24, 26, 29, 32, 36, 38, 41, 44, 48, 50, 53, 56, 60, 62, 65, 68, 72, 74, 77, 80, 84, 86, 89, 92, 96, 98, 101, 104, 108, 110, 113, 116, 120, 122, 125],
	eb: [3, 7, 10, 15, 19, 22, 27, 31, 34, 39, 43, 46, 51, 55, 58, 63, 67, 70, 75, 79, 82, 87, 91, 94, 99, 103, 106, 111, 115, 118, 123, 127],
	ds: [3, 7, 10, 15, 19, 22, 27, 31, 34, 39, 43, 46, 51, 55, 58, 63, 67, 70, 75, 79, 82, 87, 91, 94, 99, 103, 106, 111, 115, 118, 123, 127],
	ebmaj7: [3, 7, 10, 14, 15, 19, 22, 26, 27, 31, 34, 38, 39, 43, 46, 50, 51, 55, 58, 62, 63, 67, 70, 74, 75, 79, 82, 86, 87, 91, 94, 98, 99, 103, 106, 110, 111, 115, 118, 122, 123, 127],
	dsmaj7: [3, 7, 10, 14, 15, 19, 22, 26, 27, 31, 34, 38, 39, 43, 46, 50, 51, 55, 58, 62, 63, 67, 70, 74, 75, 79, 82, 86, 87, 91, 94, 98, 99, 103, 106, 110, 111, 115, 118, 122, 123, 127],
	eb7: [3, 7, 10, 13, 15, 19, 22, 25, 27, 31, 34, 37, 39, 43, 46, 49, 51, 55, 58, 61, 63, 67, 70, 73, 75, 79, 82, 85, 87, 91, 94, 97, 99, 103, 106, 109, 111, 115, 118, 121, 123, 127],
	ds7: [3, 7, 10, 13, 15, 19, 22, 25, 27, 31, 34, 37, 39, 43, 46, 49, 51, 55, 58, 61, 63, 67, 70, 73, 75, 79, 82, 85, 87, 91, 94, 97, 99, 103, 106, 109, 111, 115, 118, 121, 123, 127],
	ebm: [3, 6, 10, 15, 18, 22, 27, 30, 34, 39, 42, 46, 51, 54, 58, 63, 66, 70, 75, 78, 82, 87, 90, 94, 99, 102, 106, 111, 114, 118, 123, 126],
	dsm: [3, 6, 10, 15, 18, 22, 27, 30, 34, 39, 42, 46, 51, 54, 58, 63, 66, 70, 75, 78, 82, 87, 90, 94, 99, 102, 106, 111, 114, 118, 123, 126],
	ebm7: [3, 6, 10, 13, 15, 18, 22, 25, 27, 30, 34, 37, 39, 42, 46, 49, 51, 54, 58, 61, 63, 66, 70, 73, 75, 78, 82, 85, 87, 90, 94, 97, 99, 102, 106, 109, 111, 114, 118, 121, 123, 126],
	dsm7: [3, 6, 10, 13, 15, 18, 22, 25, 27, 30, 34, 37, 39, 42, 46, 49, 51, 54, 58, 61, 63, 66, 70, 73, 75, 78, 82, 85, 87, 90, 94, 97, 99, 102, 106, 109, 111, 114, 118, 121, 123, 126],
	ebm7b5: [3, 6, 9, 13, 15, 18, 21, 25, 27, 30, 33, 37, 39, 42, 45, 49, 51, 54, 57, 61, 63, 66, 69, 73, 75, 78, 81, 85, 87, 90, 93, 97, 99, 102, 105, 109, 111, 114, 117, 121, 123, 126],
	dsm7b5: [3, 6, 9, 13, 15, 18, 21, 25, 27, 30, 33, 37, 39, 42, 45, 49, 51, 54, 57, 61, 63, 66, 69, 73, 75, 78, 81, 85, 87, 90, 93, 97, 99, 102, 105, 109, 111, 114, 117, 121, 123, 126],
	e: [4, 8, 11, 16, 20, 23, 28, 32, 35, 40, 44, 47, 52, 56, 59, 64, 68, 71, 76, 80, 83, 88, 92, 95, 100, 104, 107, 112, 116, 119, 124, 127],
	emaj7: [4, 8, 11, 15, 16, 20, 23, 27, 28, 32, 35, 39, 40, 44, 47, 51, 52, 56, 59, 63, 64, 68, 71, 75, 76, 80, 83, 87, 88, 92, 95, 99, 100, 104, 107, 111, 112, 116, 119, 123, 124, 127],
	e7: [4, 8, 11, 14, 16, 20, 23, 26, 28, 32, 35, 38, 40, 44, 47, 50, 52, 56, 59, 62, 64, 68, 71, 74, 76, 80, 83, 86, 88, 92, 95, 98, 100, 104, 107, 110, 112, 116, 119, 122, 124, 127],
	em: [4, 7, 11, 16, 19, 23, 28, 31, 35, 40, 43, 47, 52, 55, 59, 64, 67, 71, 76, 79, 83, 88, 91, 95, 100, 103, 107, 112, 115, 119, 124, 127],
	em7: [4, 7, 11, 14, 16, 19, 23, 26, 28, 31, 35, 38, 40, 43, 47, 50, 52, 55, 59, 62, 64, 67, 71, 74, 76, 79, 83, 86, 88, 91, 95, 98, 100, 103, 107, 110, 112, 115, 119, 122, 124, 127],
	em7b5: [4, 7, 10, 14, 16, 19, 22, 26, 28, 31, 34, 38, 40, 43, 46, 50, 52, 55, 58, 62, 64, 67, 70, 74, 76, 79, 82, 86, 88, 91, 94, 98, 100, 103, 106, 110, 112, 115, 118, 122, 124, 127],
	f: [5, 9, 12, 17, 21, 24, 29, 33, 36, 41, 45, 48, 53, 57, 60, 65, 69, 72, 77, 81, 84, 89, 93, 96, 101, 105, 108, 113, 117, 120, 125],
	fmaj7: [5, 9, 12, 16, 17, 21, 24, 28, 29, 33, 36, 40, 41, 45, 48, 52, 53, 57, 60, 64, 65, 69, 72, 76, 77, 81, 84, 88, 89, 93, 96, 100, 101, 105, 108, 112, 113, 117, 120, 124],
	f7: [5, 9, 12, 15, 17, 21, 24, 27, 29, 33, 36, 39, 41, 45, 48, 51, 53, 57, 60, 63, 65, 69, 72, 75, 77, 81, 84, 87, 89, 93, 96, 99, 101, 105, 108, 111, 113, 117, 120, 123],
	fm: [5, 8, 12, 17, 20, 24, 29, 32, 36, 41, 44, 48, 53, 56, 60, 65, 68, 72, 77, 80, 84, 89, 92, 96, 101, 104, 108, 113, 116, 120, 125],
	fm7: [5, 8, 12, 15, 17, 20, 24, 27, 29, 32, 36, 39, 41, 44, 48, 51, 53, 56, 60, 63, 65, 68, 72, 75, 77, 80, 84, 87, 89, 92, 96, 99, 101, 104, 108, 111, 113, 116, 120, 123],
	fm7b5: [5, 8, 11, 15, 17, 20, 23, 27, 29, 32, 35, 39, 41, 44, 47, 51, 53, 56, 59, 63, 65, 68, 71, 75, 77, 80, 83, 87, 89, 92, 95, 99, 101, 104, 107, 111, 113, 116, 119, 123],
	gb: [6, 10, 13, 18, 22, 25, 30, 34, 37, 42, 46, 49, 54, 58, 61, 66, 70, 73, 78, 82, 85, 90, 94, 97, 102, 106, 109, 114, 118, 121, 126],
	fs: [6, 10, 13, 18, 22, 25, 30, 34, 37, 42, 46, 49, 54, 58, 61, 66, 70, 73, 78, 82, 85, 90, 94, 97, 102, 106, 109, 114, 118, 121, 126],
	gbmaj7: [6, 10, 13, 17, 18, 22, 25, 29, 30, 34, 37, 41, 42, 46, 49, 53, 54, 58, 61, 65, 66, 70, 73, 77, 78, 82, 85, 89, 90, 94, 97, 101, 102, 106, 109, 113, 114, 118, 121],
	fsmaj7: [6, 10, 13, 17, 18, 22, 25, 29, 30, 34, 37, 41, 42, 46, 49, 53, 54, 58, 61, 65, 66, 70, 73, 77, 78, 82, 85, 89, 90, 94, 97, 101, 102, 106, 109, 113, 114, 118, 121],
	gb7: [6, 10, 13, 16, 18, 22, 25, 28, 30, 34, 37, 40, 42, 46, 49, 52, 54, 58, 61, 64, 66, 70, 73, 76, 78, 82, 85, 88, 90, 94, 97, 100, 102, 106, 109, 112, 114, 118, 121],
	fs7: [6, 10, 13, 16, 18, 22, 25, 28, 30, 34, 37, 40, 42, 46, 49, 52, 54, 58, 61, 64, 66, 70, 73, 76, 78, 82, 85, 88, 90, 94, 97, 100, 102, 106, 109, 112, 114, 118, 121],
	gbm: [6, 9, 13, 18, 21, 25, 30, 33, 37, 42, 45, 49, 54, 57, 61, 66, 69, 73, 78, 81, 85, 90, 93, 97, 102, 105, 109, 114, 117, 121],
	fsm: [6, 9, 13, 18, 21, 25, 30, 33, 37, 42, 45, 49, 54, 57, 61, 66, 69, 73, 78, 81, 85, 90, 93, 97, 102, 105, 109, 114, 117, 121],
	gbm7: [6, 9, 13, 16, 18, 21, 25, 28, 30, 33, 37, 40, 42, 45, 49, 52, 54, 57, 61, 64, 66, 69, 73, 76, 78, 81, 85, 88, 90, 93, 97, 100, 102, 105, 109, 112, 114, 117, 121],
	fsm7: [6, 9, 13, 16, 18, 21, 25, 28, 30, 33, 37, 40, 42, 45, 49, 52, 54, 57, 61, 64, 66, 69, 73, 76, 78, 81, 85, 88, 90, 93, 97, 100, 102, 105, 109, 112, 114, 117, 121],
	gbm7b5: [6, 9, 12, 16, 18, 21, 24, 28, 30, 33, 36, 40, 42, 45, 48, 52, 54, 57, 60, 64, 66, 69, 72, 76, 78, 81, 84, 88, 90, 93, 96, 100, 102, 105, 108, 112, 114, 117, 120],
	fsm7b5: [6, 9, 12, 16, 18, 21, 24, 28, 30, 33, 36, 40, 42, 45, 48, 52, 54, 57, 60, 64, 66, 69, 72, 76, 78, 81, 84, 88, 90, 93, 96, 100, 102, 105, 108, 112, 114, 117, 120],
	g: [7, 11, 14, 19, 23, 26, 31, 35, 38, 43, 47, 50, 55, 59, 62, 67, 71, 74, 79, 83, 86, 91, 95, 98, 103, 107, 110, 115, 119, 122, 127],
	gmaj7: [7, 11, 14, 18, 19, 23, 26, 30, 31, 35, 38, 42, 43, 47, 50, 54, 55, 59, 62, 66, 67, 71, 74, 78, 79, 83, 86, 90, 91, 95, 98, 102, 103, 107, 110, 114, 115, 119, 122],
	g7: [7, 11, 14, 17, 19, 23, 26, 29, 31, 35, 38, 41, 43, 47, 50, 53, 55, 59, 62, 65, 67, 71, 74, 77, 79, 83, 86, 89, 91, 95, 98, 101, 103, 107, 110, 113, 115, 119, 122],
	gm: [7, 10, 14, 19, 22, 26, 31, 34, 38, 43, 46, 50, 55, 58, 62, 67, 70, 74, 79, 82, 86, 91, 94, 98, 103, 106, 110, 115, 118, 122],
	gm7: [7, 10, 14, 17, 19, 22, 26, 29, 31, 34, 38, 41, 43, 46, 50, 53, 55, 58, 62, 65, 67, 70, 74, 77, 79, 82, 86, 89, 91, 94, 98, 101, 103, 106, 110, 113, 115, 118, 122],
	gm7b5: [7, 10, 13, 17, 19, 22, 25, 29, 31, 34, 37, 41, 43, 46, 49, 53, 55, 58, 61, 65, 67, 70, 73, 77, 79, 82, 85, 89, 91, 94, 97, 101, 103, 106, 109, 113, 115, 118, 121],
	ab: [8, 12, 15, 20, 24, 27, 32, 36, 39, 44, 48, 51, 56, 60, 63, 68, 72, 75, 80, 84, 87, 92, 96, 99, 104, 108, 111, 116, 120, 123],
	gs: [8, 12, 15, 20, 24, 27, 32, 36, 39, 44, 48, 51, 56, 60, 63, 68, 72, 75, 80, 84, 87, 92, 96, 99, 104, 108, 111, 116, 120, 123],
	abmaj7: [8, 12, 15, 19, 20, 24, 27, 31, 32, 36, 39, 43, 44, 48, 51, 55, 56, 60, 63, 67, 68, 72, 75, 79, 80, 84, 87, 91, 92, 96, 99, 103, 104, 108, 111, 115, 116, 120, 123],
	gsmaj7: [8, 12, 15, 19, 20, 24, 27, 31, 32, 36, 39, 43, 44, 48, 51, 55, 56, 60, 63, 67, 68, 72, 75, 79, 80, 84, 87, 91, 92, 96, 99, 103, 104, 108, 111, 115, 116, 120, 123],
	ab7: [8, 12, 15, 18, 20, 24, 27, 30, 32, 36, 39, 42, 44, 48, 51, 54, 56, 60, 63, 66, 68, 72, 75, 78, 80, 84, 87, 90, 92, 96, 99, 102, 104, 108, 111, 114, 116, 120, 123],
	gs7: [8, 12, 15, 18, 20, 24, 27, 30, 32, 36, 39, 42, 44, 48, 51, 54, 56, 60, 63, 66, 68, 72, 75, 78, 80, 84, 87, 90, 92, 96, 99, 102, 104, 108, 111, 114, 116, 120, 123],
	abm: [8, 11, 15, 20, 23, 27, 32, 35, 39, 44, 47, 51, 56, 59, 63, 68, 71, 75, 80, 83, 87, 92, 95, 99, 104, 107, 111, 116, 119, 123],
	gsm: [8, 11, 15, 20, 23, 27, 32, 35, 39, 44, 47, 51, 56, 59, 63, 68, 71, 75, 80, 83, 87, 92, 95, 99, 104, 107, 111, 116, 119, 123],
	abm7: [8, 11, 15, 18, 20, 23, 27, 30, 32, 35, 39, 42, 44, 47, 51, 54, 56, 59, 63, 66, 68, 71, 75, 78, 80, 83, 87, 90, 92, 95, 99, 102, 104, 107, 111, 114, 116, 119, 123],
	gsm7: [8, 11, 15, 18, 20, 23, 27, 30, 32, 35, 39, 42, 44, 47, 51, 54, 56, 59, 63, 66, 68, 71, 75, 78, 80, 83, 87, 90, 92, 95, 99, 102, 104, 107, 111, 114, 116, 119, 123],
	abm7b5: [8, 11, 14, 18, 20, 23, 26, 30, 32, 35, 38, 42, 44, 47, 50, 54, 56, 59, 62, 66, 68, 71, 74, 78, 80, 83, 86, 90, 92, 95, 98, 102, 104, 107, 110, 114, 116, 119, 122],
	gsm7b5: [8, 11, 14, 18, 20, 23, 26, 30, 32, 35, 38, 42, 44, 47, 50, 54, 56, 59, 62, 66, 68, 71, 74, 78, 80, 83, 86, 90, 92, 95, 98, 102, 104, 107, 110, 114, 116, 119, 122],
	a: [9, 13, 16, 21, 25, 28, 33, 37, 40, 45, 49, 52, 57, 61, 64, 69, 73, 76, 81, 85, 88, 93, 97, 100, 105, 109, 112, 117, 121, 124],
	amaj7: [9, 13, 16, 20, 21, 25, 28, 32, 33, 37, 40, 44, 45, 49, 52, 56, 57, 61, 64, 68, 69, 73, 76, 80, 81, 85, 88, 92, 93, 97, 100, 104, 105, 109, 112, 116, 117, 121, 124],
	a7: [9, 13, 16, 19, 21, 25, 28, 31, 33, 37, 40, 43, 45, 49, 52, 55, 57, 61, 64, 67, 69, 73, 76, 79, 81, 85, 88, 91, 93, 97, 100, 103, 105, 109, 112, 115, 117, 121, 124],
	am: [9, 12, 16, 21, 24, 28, 33, 36, 40, 45, 48, 52, 57, 60, 64, 69, 72, 76, 81, 84, 88, 93, 96, 100, 105, 108, 112, 117, 120, 124],
	am7: [9, 12, 16, 19, 21, 24, 28, 31, 33, 36, 40, 43, 45, 48, 52, 55, 57, 60, 64, 67, 69, 72, 76, 79, 81, 84, 88, 91, 93, 96, 100, 103, 105, 108, 112, 115, 117, 120, 124],
	am7b5: [9, 12, 15, 19, 21, 24, 27, 31, 33, 36, 39, 43, 45, 48, 51, 55, 57, 60, 63, 67, 69, 72, 75, 79, 81, 84, 87, 91, 93, 96, 99, 103, 105, 108, 111, 115, 117, 120, 123],
	bb: [10, 14, 17, 22, 26, 29, 34, 38, 41, 46, 50, 53, 58, 62, 65, 70, 74, 77, 82, 86, 89, 94, 98, 101, 106, 110, 113, 118, 122, 125],
	as: [10, 14, 17, 22, 26, 29, 34, 38, 41, 46, 50, 53, 58, 62, 65, 70, 74, 77, 82, 86, 89, 94, 98, 101, 106, 110, 113, 118, 122, 125],
	bbmaj7: [10, 14, 17, 21, 22, 26, 29, 33, 34, 38, 41, 45, 46, 50, 53, 57, 58, 62, 65, 69, 70, 74, 77, 81, 82, 86, 89, 93, 94, 98, 101, 105, 106, 110, 113, 117, 118, 122, 125],
	asmaj7: [10, 14, 17, 21, 22, 26, 29, 33, 34, 38, 41, 45, 46, 50, 53, 57, 58, 62, 65, 69, 70, 74, 77, 81, 82, 86, 89, 93, 94, 98, 101, 105, 106, 110, 113, 117, 118, 122, 125],
	bb7: [10, 14, 17, 20, 22, 26, 29, 32, 34, 38, 41, 44, 46, 50, 53, 56, 58, 62, 65, 68, 70, 74, 77, 80, 82, 86, 89, 92, 94, 98, 101, 104, 106, 110, 113, 116, 118, 122, 125],
	as7: [10, 14, 17, 20, 22, 26, 29, 32, 34, 38, 41, 44, 46, 50, 53, 56, 58, 62, 65, 68, 70, 74, 77, 80, 82, 86, 89, 92, 94, 98, 101, 104, 106, 110, 113, 116, 118, 122, 125],
	bbm: [10, 13, 17, 22, 25, 29, 34, 37, 41, 46, 49, 53, 58, 61, 65, 70, 73, 77, 82, 85, 89, 94, 97, 101, 106, 109, 113, 118, 121, 125],
	asm: [10, 13, 17, 22, 25, 29, 34, 37, 41, 46, 49, 53, 58, 61, 65, 70, 73, 77, 82, 85, 89, 94, 97, 101, 106, 109, 113, 118, 121, 125],
	bbm7: [10, 13, 17, 20, 22, 25, 29, 32, 34, 37, 41, 44, 46, 49, 53, 56, 58, 61, 65, 68, 70, 73, 77, 80, 82, 85, 89, 92, 94, 97, 101, 104, 106, 109, 113, 116, 118, 121, 125],
	asm7: [10, 13, 17, 20, 22, 25, 29, 32, 34, 37, 41, 44, 46, 49, 53, 56, 58, 61, 65, 68, 70, 73, 77, 80, 82, 85, 89, 92, 94, 97, 101, 104, 106, 109, 113, 116, 118, 121, 125],
	bbm7b5: [10, 13, 16, 20, 22, 25, 28, 32, 34, 37, 40, 44, 46, 49, 52, 56, 58, 61, 64, 68, 70, 73, 76, 80, 82, 85, 88, 92, 94, 97, 100, 104, 106, 109, 112, 116, 118, 121, 124],
	asm7b5: [10, 13, 16, 20, 22, 25, 28, 32, 34, 37, 40, 44, 46, 49, 52, 56, 58, 61, 64, 68, 70, 73, 76, 80, 82, 85, 88, 92, 94, 97, 100, 104, 106, 109, 112, 116, 118, 121, 124],
	b: [11, 15, 18, 23, 27, 30, 35, 39, 42, 47, 51, 54, 59, 63, 66, 71, 75, 78, 83, 87, 90, 95, 99, 102, 107, 111, 114, 119, 123, 126],
	bmaj7: [11, 15, 18, 22, 23, 27, 30, 34, 35, 39, 42, 46, 47, 51, 54, 58, 59, 63, 66, 70, 71, 75, 78, 82, 83, 87, 90, 94, 95, 99, 102, 106, 107, 111, 114, 118, 119, 123, 126],
	b7: [11, 15, 18, 21, 23, 27, 30, 33, 35, 39, 42, 45, 47, 51, 54, 57, 59, 63, 66, 69, 71, 75, 78, 81, 83, 87, 90, 93, 95, 99, 102, 105, 107, 111, 114, 117, 119, 123, 126],
	bm: [11, 14, 18, 23, 26, 30, 35, 38, 42, 47, 50, 54, 59, 62, 66, 71, 74, 78, 83, 86, 90, 95, 98, 102, 107, 110, 114, 119, 122, 126],
	bm7: [11, 14, 18, 21, 23, 26, 30, 33, 35, 38, 42, 45, 47, 50, 54, 57, 59, 62, 66, 69, 71, 74, 78, 81, 83, 86, 90, 93, 95, 98, 102, 105, 107, 110, 114, 117, 119, 122, 126],
	bm7b5: [11, 14, 17, 21, 23, 26, 29, 33, 35, 38, 41, 45, 47, 50, 53, 57, 59, 62, 65, 69, 71, 74, 77, 81, 83, 86, 89, 93, 95, 98, 101, 105, 107, 110, 113, 117, 119, 122, 125];

);




// diatonic scales (MIDI note number). Used for generating OFF BEAT notes
~chordArraysOff = (


	c: [0, 2, 4, 5, 7, 9, 11, 12, 14, 16, 17, 19, 21, 23, 24, 26, 28, 29, 31, 33, 35, 36, 38, 40, 41, 43, 45, 47, 48, 50, 52, 53, 55, 57, 59, 60, 62, 64, 65, 67, 69, 71, 72, 74, 76, 77, 79, 81, 83, 84, 86, 88, 89, 91, 93, 95, 96, 98, 100, 101, 103, 105, 107, 108, 110, 112, 113, 115, 117, 119, 120, 122, 124, 125, 127],


	g: [7, 9, 11, 12, 14, 16, 18, 19, 21, 23, 24, 26, 28, 30, 31, 33, 35, 36, 38, 40, 42, 43, 45, 47, 48, 50, 52, 54, 55, 57, 59, 60, 62, 64, 66, 67, 69, 71, 72, 74, 76, 78, 79, 81, 83, 84, 86, 88, 90, 91, 93, 95, 96, 98, 100, 102, 103, 105, 107, 108, 110, 112, 114, 115, 117, 119, 120, 122, 124, 126, 127],


	d: [2, 4, 6, 7, 9, 11, 13, 14, 16, 18, 19, 21, 23, 25, 26, 28, 30, 31, 33, 35, 37, 38, 40, 42, 43, 45, 47, 49, 50, 52, 54, 55, 57, 59, 61, 62, 64, 66, 67, 69, 71, 73, 74, 76, 78, 79, 81, 83, 85, 86, 88, 90, 91, 93, 95, 97, 98, 100, 102, 103, 105, 107, 109, 110, 112, 114, 115, 117, 119, 121, 122, 124, 126],


	a: [9, 11, 13, 14, 16, 18, 20, 21, 23, 25, 26, 28, 30, 32, 33, 35, 37, 38, 40, 42, 44, 45, 47, 49, 50, 52, 54, 56, 57, 59, 61, 62, 64, 66, 68, 69, 71, 73, 74, 76, 78, 80, 81, 83, 85, 86, 88, 90, 92, 93, 95, 97, 98, 100, 102, 104, 105, 107, 109, 110, 112, 114, 116, 117, 119, 121, 122, 124, 126],


	e: [4, 6, 8, 9, 11, 13, 15, 16, 18, 20, 21, 23, 25, 27, 28, 30, 32, 33, 35, 37, 39, 40, 42, 44, 45, 47, 49, 51, 52, 54, 56, 57, 59, 61, 63, 64, 66, 68, 69, 71, 73, 75, 76, 78, 80, 81, 83, 85, 87, 88, 90, 92, 93, 95, 97, 99, 100, 102, 104, 105, 107, 109, 111, 112, 114, 116, 117, 119, 121, 123],


	b: [11, 13, 15, 16, 18, 20, 22, 23, 25, 27, 28, 30, 32, 34, 35, 37, 39, 40, 42, 44, 46, 47, 49, 51, 52, 54, 56, 58, 59, 61, 63, 64, 66, 68, 70, 71, 73, 75, 76, 78, 80, 82, 83, 85, 87, 88, 90, 92, 94, 95, 97, 99, 100, 102, 104, 106, 107, 109, 111, 112, 114, 116, 118, 119, 121, 123, 124, 126],


	fs: [6, 8, 10, 11, 13, 15, 17, 18, 20, 22, 23, 25, 27, 29, 30, 32, 34, 35, 37, 39, 41, 42, 44, 46, 47, 49, 51, 53, 54, 56, 58, 59, 61, 63, 65, 66, 68, 70, 71, 73, 75, 77, 78, 80, 82, 83, 85, 87, 89, 90, 92, 94, 95, 97, 99, 101, 102, 104, 106, 107, 109, 111, 113, 114, 116, 118, 119, 121, 123, 125],


	db: [1, 3, 5, 6, 8, 10, 12, 13, 15, 17, 18, 20, 22, 24, 25, 27, 29, 30, 32, 34, 36, 37, 39, 41, 42, 44, 46, 48, 49, 51, 53, 54, 56, 58, 60, 61, 63, 65, 66, 68, 70, 72, 73, 75, 77, 78, 80, 82, 84, 85, 87, 89, 90, 92, 94, 96, 97, 99, 101, 102, 104, 106, 108, 109, 111, 113, 114, 116, 118, 120],


	ab: [8, 10, 12, 13, 15, 17, 19, 20, 22, 24, 25, 27, 29, 31, 32, 34, 36, 37, 39, 41, 43, 44, 46, 48, 49, 51, 53, 55, 56, 58, 60, 61, 63, 65, 67, 68, 70, 72, 73, 75, 77, 79, 80, 82, 84, 85, 87, 89, 91, 92, 94, 96, 97, 99, 101, 103, 104, 106, 108, 109, 111, 113, 115, 116, 118, 120, 121, 123, 125, 127],


	eb: [3, 5, 7, 8, 10, 12, 14, 15, 17, 19, 20, 22, 24, 26, 27, 29, 31, 32, 34, 36, 38, 39, 41, 43, 44, 46, 48, 50, 51, 53, 55, 56, 58, 60, 62, 63, 65, 67, 68, 70, 72, 74, 75, 77, 79, 80, 82, 84, 86, 87, 89, 91, 92, 94, 96, 98, 99, 101, 103, 104, 106, 108, 110, 111, 113, 115, 116, 118, 120, 122],


	bb: [10, 12, 14, 15, 17, 19, 21, 22, 24, 26, 27, 29, 31, 33, 34, 36, 38, 39, 41, 43, 45, 46, 48, 50, 51, 53, 55, 57, 58, 60, 62, 63, 65, 67, 69, 70, 72, 74, 75, 77, 79, 81, 82, 84, 86, 87, 89, 91, 93, 94, 96, 98, 99, 101, 103, 105, 106, 108, 110, 111, 113, 115, 117, 118, 120, 122, 123, 125, 127],


	f: [5, 7, 9, 10, 12, 14, 16, 17, 19, 21, 22, 24, 26, 28, 29, 31, 33, 34, 36, 38, 40, 41, 43, 45, 46, 48, 50, 52, 53, 55, 57, 58, 60, 62, 64, 65, 67, 69, 70, 72, 74, 76, 77, 79, 81, 82, 84, 86, 88, 89, 91, 93, 94, 96, 98, 100, 101, 103, 105, 106, 108, 110, 112, 113, 115, 117, 118, 120, 122, 124],

);




// tonic number (MIDI note number)
~tonicNumber = (
	c: 60,
	g: 67,
	d: 62,
	a: 69,
	e: 64,
	b: 59,
	fs: 66,
	db: 61,
	ab: 68,
	eb: 63,
	bb: 58,
	f: 65,

	cmaj7: 60,
	c7: 60,
	cm: 60,
	cm7: 60,
	cm7b5: 60,
	csmaj7: 61,
	db7: 61,
	cs7: 61,
	dbm: 61,
	csm: 61,
	dbm7: 61,
	csm7: 61,
	dbm7b5: 61,
	csm7b5: 61,
	dmaj7: 62,
	d7: 62,
	dm: 62,
	dm7: 62,
	dm7b5: 62,
	ebmaj7: 63,
	dsmaj7: 63,
	eb7: 63,
	ds7: 63,
	ebm: 63,
	dsm: 63,
	ebm7: 63,
	dsm7: 63,
	ebm7b5: 63,
	dsm7b5: 63,

	emaj7: 64,
	e7: 64,
	em: 64,
	em7: 64,
	em7b5: 64,

	fmaj7: 65,
	f7: 65,
	fm: 65,
	fm7: 65,
	fm7b5: 65,

	gbmaj7: 66,
	fsmaj7: 66,
	gb7: 66,
	fs7: 66,
	gbm: 66,
	fsm: 66,
	gbm7: 66,
	fsm7: 66,
	gbm7b5: 66,
	fsm7b5: 66,

	gmaj7: 67,
	g7: 67,
	gm: 67,
	gm7: 67,
	gm7b5: 67,

	abmaj7: 68,
	gsmaj7: 68,
	ab7: 68,
	gs7: 68,
	abm: 68,
	gsm: 68,
	abm7: 68,
	gsm7: 68,
	abm7b5: 68,
	gsm7b5: 68,

	amaj7: 57,
	a7: 57,
	am:  57,
	am7:  57,
	am7b5: 57,

	bbmaj7: 58,
	asmaj7: 58,
	bb7: 58,
	as7: 58,
	bbm: 58,
	asm: 58,
	bbm7:  58,
	asm7: 58,
	bbm7b5: 58,
	asm7b5: 58,

	bmaj7: 59,
	b7: 59,
	bm: 59,
	bm7: 59,
	bm7b5: 59;

);




/*  UTILITY FUNCTION - CHORD SLICE

INPUT: ~tonicNumber (startIndex), quadriad name (chordName);
OUTPUT: quadriad pitches (as env. variable)

COMMENTS: will be used later, during the actual pitch generation

*/

~getChordSlice = { |startIndex, chordName|
	var chordArray = ~chordArrays[chordName];
	var startingIndexPosition = chordArray.indexOf(startIndex);
	if(startingIndexPosition.isNil) {
		// store nil if the starting index is not in the chord
		~chordSlice = nil;
	} {
		~chordSlice = chordArray[startingIndexPosition..(startingIndexPosition + 3)];
	}
};

//~playingChord = ~getChordSlice.(~tonicNumber.c, 'c7');  // the result will be stored in ~chordSlice










/*----------------- MELODY DURATIONS GENERATION FUNCTIONS -----------------*/


/* Note: from now on, unless specified otherwise, INPUT and OUPUT are intended in form of
enviromental variables inside the function */





/* MARKOV CHAIN DEFINITION AND GENERATION FUNCTIONS

INPUT: states and transition probability matrix
OUTPUT: ~stateArray = [melody bars number, motif bars number], probabilistically generated

DESCRIPTION: passing states represent total melody bars, absorbing states represent total motif bars.
Musical granularity is set to 1/32, which is 0.125 in seconds, therefore 1 bar = 1 second.

In this specific chain, passing state is always "8", absorbing states can be "2" and "4", selected with equal probabilities.

Chain may obviously change in live performance: as example, there's a more complex chain commented after this

*/

~states = ["Start", "8", "2", "4"];

// transition matrix
~matrix = [
    [0, 1, 0, 0],      // start state -> "8"
    [0, 0, 0.5, 0.5],  // passing state "8" -> "2" or "4"
    [0, 0, 1, 0],      // absorbing state "2"
    [0, 0, 0, 1],      // absorbing state "4"
];

// getting the next state
~getNextState = { |currentStateIndex|
    var probabilities = ~matrix[currentStateIndex];
    var randVal = 1.0.rand;

    var sum = 0;
    var nextStateIndex;

    probabilities.size.do { |i|
        sum = sum + probabilities[i];
        if (randVal <= sum && nextStateIndex.isNil) {
            nextStateIndex = i;
        };
    };
    nextStateIndex;
};

// running chain
~runMarkovChain = {
    var currentStateIndex = 0;
    var previousStateIndex;

    // iteration until we reach an absorbing state
    while { [0, 1].includes(currentStateIndex) } {
        previousStateIndex = currentStateIndex;
        currentStateIndex = ~getNextState.(currentStateIndex);
    };

    // store the states in the variables
    ~passingState = ~states[previousStateIndex];
    ~finalState = ~states[currentStateIndex];

    // store and print the values
    ~stateArray = [~passingState, ~finalState];
    //(~passingState + " -> " + ~finalState).postln;
    //^this
};

//~runMarkovChain.();




/* ALTERNATIVE CHAIN

DESCRIPTION: "4" and "8" as passing states; "1","2" and "1","2","4" as absorbing states respectively

CHAIN CAN BE CHANGED IN LIVE PERFORMANCE!

*/


/*
~states = ["Start", "4", "8", "1", "2", "2", "4"];

~matrix = [
    [0, 0.5, 0.5, 0, 0, 0, 0],  // Start state
    [0, 0, 0, 0.5, 0.5, 0, 0],  // Passing state "4"
    [0, 0, 0, 0, 0, 0.5, 0.5],  // Passing state "8"
    [0, 0, 0, 1, 0, 0, 0],      // Absorbing state "1" for State "4"
    [0, 0, 0, 0, 1, 0, 0],      // Absorbing state "2" for State "4"
    [0, 0, 0, 0, 0, 1, 0],      // Absorbing state "2" for State "8"
    [0, 0, 0, 0, 0, 0, 1],      // Absorbing state "4" for State "8"
];

~getNextState = { |currentStateIndex|
    var probabilities = ~matrix[currentStateIndex];
    var randVal = 1.0.rand;

    var sum = 0;
    var nextStateIndex;

    probabilities.size.do { |i|
        sum = sum + probabilities[i];
        if (randVal <= sum && nextStateIndex.isNil) {
            nextStateIndex = i;
        };
    };
    nextStateIndex;
};

~runMarkovChain = {
    var currentStateIndex = 0; // Start state
    var previousStateIndex;

    while { [0, 1, 2].includes(currentStateIndex) } {
        previousStateIndex = currentStateIndex;
        currentStateIndex = ~getNextState.(currentStateIndex);
    };

    ~passingState = ~states[previousStateIndex];
    ~finalState = ~states[currentStateIndex];

    ~stateArray = [~passingState, ~finalState];
    //(~passingState + " -> " + ~finalState).postln;
    //^this
};


//~runMarkovChain.();
*/




/* MELODY CONTOUR ARRAY GENERATION FUNCTION

INPUT: passing state P (melody bars) and absorbing state A (motif bars)
OUTPUT: ~melodicContourArray of P/A cells (melody "segments" equal to motif length) with random values +1, -1 or 0, and
~auxiliaryArray with left out picked values (will be assigned to the next melody)

COMMENTS: Range condition applied. value x cannot be re-picked until y and z aren't randomly picked too after x

*/

// array initialization
~melodicContourArray = [];
~auxiliaryArray = [];

// melody contour generation
~generateMelodicContourArray = {
	// variables initialization
	var currentIndex = 0;
	var shouldContinue = true;

	// all the possible triplets combinations assuming the balancing condition
	~triplets = [[1, -1, 0], [1, 0, -1], [-1, 1, 0], [-1, 0, 1], [0, 1, -1], [0, -1, 1]];
	~nMelodySegments = (~passingState.asInteger)/(~finalState.asInteger);
	~melodicContourArray = Array.fill(~nMelodySegments, { nil });
	~motifIndex = 0;

	// filling from auxiliaryArray and clearing it
	if (~auxiliaryArray.notNil and: { ~auxiliaryArray.size == 2 }) {
	    ~auxiliaryArray.do { |value, i|
	        ~melodicContourArray[i] = value;
	        currentIndex = currentIndex + 1;
	    };
	    ~auxiliaryArray = [];
	};

	if (~auxiliaryArray.notNil and: { ~auxiliaryArray.size == 1 }) {
	    ~auxiliaryArray.do { |value, i|
	        ~melodicContourArray[i] = value;
	        currentIndex = currentIndex + 1;
	    };
	    ~auxiliaryArray = [];
	};

	// generating melodic contour array
	while({ currentIndex < ~melodicContourArray.size && shouldContinue }, {
		var availableSlots = ~melodicContourArray.size - currentIndex;
		var randomTriplet = ~triplets.choose;

		if (availableSlots < 3) {
			~auxiliaryArray = randomTriplet[availableSlots..];
			randomTriplet[0..(availableSlots - 1)].do { |value, i|
				~melodicContourArray[currentIndex + i] = value;
			};
			shouldContinue = false;
		} {
			randomTriplet.do { |value, i|
				~melodicContourArray[currentIndex + i] = value;
			};
			currentIndex = currentIndex + 3;
		}
	});

	// initial motif sign
	~motifSign = ~melodicContourArray[0];

	//"melodicArray".postln;
	//~melodicContourArray.postln;
	//"ausArray".postln;
	//~auxiliaryArray.postln;
	//^this
};

//~runMarkovChain.();
//~nMelodySegments = (~passingState.asInteger)/(~finalState.asInteger);
//~nMelodySegments.postln;
//~generateMelodicContourArray.();




/* TRANSFORMATIONS ARRAY GENERATION FUNCTION

INPUT: melodic contour array ~melodicContourArray
OUTPUT: transformation array ~transformationArray

COMMENTS: for each segment sign,  transformation available sign is evaluated then picked

*/

~generateTransformationArray = {
	~transformationArray = ~melodicContourArray.collect { |value, i|
		if (i == 0) {
			"Contrast"
		} {
			if (value == ~melodicContourArray[~motifIndex.asInteger]) {
				[ "TemporalVariation", "Repetition" ].wchoose([1/2, 1/2])
			} {
				if ((value) * (~melodicContourArray[~motifIndex.asInteger]) == -1) {
					[ "Retrogradation" ].wchoose([1])
				} {
					[ "PitchVariation", "Contrast" ].wchoose([1/2, 1/2])
				}
			}
		}
	};
	//~transformationArray.postln;
	//^this
};

//~generateTransformationArray.();




/* GENERAL SEGMENT DURATION ARRAY GENERATION

INPUT: ~segmentLength (total number of cells of a segment, given by (~finalState * 8)

OUTPUT: ~segmentDurationArray, segment array of length [number of motif's bars (picked final sate)]*8, filled with durations; durations probabilistically assigned based on COUNTERPOINT CONVENTIONALITIES.

DESCRIPTION: for each available spot of the segment array, we evaluate the available spots, and pick a duration based on probabilities. After picking a duration, we keep track of the empty cells of the array by filling with "nils" the ones which are "occupied" by the duration of the picked duration. Also pauses can be picked (0.2), in this case a negative value will be inserted instead.

Example: segment of 1s = 8 cells of 0.125s
[0.125, 0.25, nil, -0.125, -0.5, nil, nil, nil]
This array represents: one note of 1/32, followed by one 1/16, followed by one pause of 1/32, followed by one pause of 1/8.


FURTHER EXPLANATION: the melody is generated as a continuous transformation and reproduction of a motif. So, total melody duration is cut into (P/A) number of segments of duration equal to the motif's duration (by default, the first motif is equal to the first segment, then it may be assigned to other segments). Considering the musical granularity of 1/32 equal to 0.125s assigned to each cell, the actual length each segment array is set as (number of motif's bars = final sate)*8. In this way each cell corresponds to 0.125s and each segment will last a integer multiple of (0.125s*8). The max duration of a whole melody (bunch of segments) is set by default to 8 seconds (then a new melody is generated).

*/

~generateSegmentDurationArray = {

	var currentIndex, availableSlots, eligibleDurations, eligibleProbs, chosenDuration;

	// function to determine index increase
	var indexIncrease = { |duration|
		switch(duration,
			1, { 8 },
			0.5, { 4 },
			0.25, { 2 },
			0.125, { 1 },
			{ 0 }  // default case
		);
	};

	// initializations
	~segmentLength = (~finalState.asInteger) * 8;

	// set probabilities are based on ~finalState

	// probabilities if motif (& segments) is short (1s)
	~probabilities = [0.0, 0.1, 0.4, 0.5];

	// probabilities of motif (& segments) is medium (2s)
	if(~finalState.asInteger == 2) { ~probabilities = [0.0, 0.4, 0.6, 0] };

	// probabilities of motif (& segments) is long (4s)
	if(~finalState.asInteger == 4) { ~probabilities = [0.1, 0.5, 0.4, 0] };

	~durations = [1, 0.5, 0.25, 0.125];

	~segmentDurationArray = Array.newClear(~segmentLength);
	currentIndex = 0;

	// actual ~segmentDurationArray generation
	while { currentIndex < ~segmentLength } {

		// computing available slots
		availableSlots = ~segmentLength - currentIndex;

		// determine which durations are currently eligible based on the available slots.
		eligibleDurations = ~durations.select({ |dur|
			availableSlots >= indexIncrease.(dur);
		});

		// if no eligible durations just continue the loop
		if(eligibleDurations.isEmpty) {
			currentIndex = ~segmentLength;
		} {
			// get the probabilities for the eligible durations
			eligibleProbs = eligibleDurations.collect({ |dur|
				~probabilities[~durations.indexOf(dur)];
			});

			// probabilities normalization
			eligibleProbs = eligibleProbs * (1.0 / eligibleProbs.sum);

			// choose a duration based on the probabilities
			chosenDuration = eligibleDurations.wchoose(eligibleProbs);

			// decide on the sign (positive means note, negative means pause)
			//based on the probability note vs pause 0.8 vs 0.2
			chosenDuration = [1, -1].wchoose([0.8, 0.2]) * chosenDuration;

			// insert the chosen value into the segmentArray
			~segmentDurationArray[currentIndex] = chosenDuration;

			// adjust currentIndex based on chosen value
			currentIndex = currentIndex + indexIncrease.(chosenDuration.abs);
		};
	};


	//~segmentDurationArray.postln;
	//^this
};

//~generateSegmentDurationArray.();




/*RECAP: So far what we've done is run chain, generate melody contour, generate
transformations & segment's notes durations*/

//~runMarkovChain.();
//~generateMelodicContourArray.();
//~generateTransformationArray.();
//~generateSegmentDurationArray.();
//~segmentDurationArray.postln






/*  UTILITY FUNCTION - SHUFFLING TEMPORAL ARRAY FOR Temporal Variation TRANSFORMATION

INPUT: ~totalDurationMotif (equal to ~segmentDurationArray)
OUTPUT: ~rearrangedTotalDurationMotif (env. variable), randomly cut and rearranged ~totalDurationMotif

DESCRIPTION: will be used to shuffle motif's durations and generate a temporal variation

*/

// rearranging temporal array for TimeVariation transformation
~rearrangeArray = {
	var cutIndex = nil;
	var tempArray = ~totalDurationMotif;  // making a copy to work with
	var tempSize = tempArray.size;

	// we identify the index where the first nil is followed by a non-nil value
	tempArray.do { |item, index|
		if(cutIndex.isNil) {
			if(item.isNil) {
				if(index < (tempSize - 1)) {
					if(tempArray[index + 1].notNil) {
						cutIndex = index + 1;
					}
				}
			}
		}
	};

	// if such index exists, rearrange array
	if(cutIndex.notNil) {
		var firstPart = tempArray.copyRange(0, cutIndex - 1);
		var secondPart = tempArray.copyRange(cutIndex, tempSize - 1);
		~rearrangedTotalDurationMotif = secondPart ++ firstPart;
	}
};

// testing
//~rearrangeArray.();






/* WHOLE MELODY NOTES' DURATIONS GENERATION, BASED ON PICKED TRANSFORMATIONS

INPUT: ~segmentDurationArray (notes' durations generated for one segment)
OUTPUT: ~totalDurationMelody (notes' durations of the whole melody)

DESCRIPTION: for each segment, we evaluate the picked transformation and generate its durations accordingly

- in Repetition, Retrogradation, and PitchVariation we just repeat the same duration values of motif
- in Contrast, we just generate new values calling ~generateSegmentDurationArray.()
- in TemporalVariation, we randomly rearrange the motif's durations

At each iteration we update the melody total durations ~totalDurationMelody

*/

~melodyDurationsGeneration = {
	//Generating first motif segment durations
	~totalDurationMotif = ~segmentDurationArray;
	//Initializing the melody starting with motif durations
	~totalDurationMelody = ~segmentDurationArray;

	// we dropping the first cell to run the cycle on the remaining cells of transformationArray
	~transformationDroppedArray = ~transformationArray.drop(1);

	//add the rest of segments durations
	~transformationDroppedArray.do { |item, i|
		if(item == "Repetition" or: {item == "Retrogradation"} or: {item == "PitchVariation"}){
			~totalDurationMelody = ~totalDurationMelody ++ ~totalDurationMotif;
			//~totalDurationMelody.postln;
			//"fine1".postln
		};

		if(item == "Contrast"){
			~generateSegmentDurationArray.();
			~totalDurationMelody = ~totalDurationMelody ++ ~segmentDurationArray;
			//~totalDurationMelody.postln;
			//Updating ~totalDurationMotif to this new contrast durations. New motif!
			~totalDurationMotif = ~segmentDurationArray;
			//Also updating sign of new motif
			~motifSign = ~melodicContourArray[i+1];
			~motifIndex = i+1;
			//~motifSign.postln;
			//"fine2".postln
		};

		if(item == "TemporalVariation"){
			~rearrangeArray.();
			~totalDurationMelody = ~totalDurationMelody ++ ~rearrangedTotalDurationMotif;
			//~totalDurationMelody.postln;
			//"fine1".postln
		};

	};
};

//test
//~melodyDurationsGeneration.();
//~totalDurationMelody.postln;
//~melodyDurationsGeneration.();
//~motifSign.postln
//~motifIndex.postln













/*----------------- MELODY PITCHES GENERATION FUNCTIONS -----------------*/


/* UTILITY FUNCTION - FIND THE CLOSEST PITCH TO LAST PICKED PITCH

INPUT: chordArray, lastPickedPitch
OUTPUT: closest pitch

*/

~findClosestNumber = {
	arg chordArray, lastPickedPitch;
	~closest = chordArray[0];  // inizializza il più vicino
	~smallestDiff = abs(lastPickedPitch - ~closest);  // initialize smallestDiff with the absolute difference between target and closest

	// Loop through the numArray to find the closest number
	chordArray.do { |num|
		~diff = abs(lastPickedPitch - num);  // we calculate the absolute difference between target and num
		if (~diff < ~smallestDiff) {  // if this difference is smaller than smallestDiff
			~closest = num;  // update closest
			~smallestDiff = ~diff;  // update smallestDiff
		}
	};

	~closestNum = ~closest;
};
//~findClosestNumber.value(~chordArray, ~lastPickedPitch);








/* POSITIVE MELODIC CONTOUR (1) CASE: PITCH GENERATION

INPUT: ~chordArray (extended pitch note numbers)
OUTPUT: ~selectedValue (new pitch), selected from ~subChordArray (eligible pitches filtered from ~chordArray according to pitch constraints)

DESCRIPTION: ~chordArray will change accordingly. It will either be the extended chord array notes OR the extended diatonic scale depending on the fact if the respective note's duration is ON BEAT or OFF BEAT. ON BEAT notes are notes happening on the first cell of each bar. OFF BEAT are all the others.
New pitches will be generated with respect to PITCH CONTRAINTS FROM CONVENTIONAL COUNTERPOINT RULES.
Eligible pitches to be picked as ~selectedValue (generated pitch), are selected from ~chordArray and put in ~subChordArray.
Then, A PROBABILITY is assigned to each eligible pitch: in general, the closer to the last pitch, the more probable.
Specifically, probability  weights are calculated as the inverse of the distance to the center point, and then normalized.

The center point is the LOWEST HIGHER note with respect to the previous selected pitch.

*/


~generateSubChordArrayAndPickValue = {
	var subArray, weights, selectedValue, closestHigherValue;

	// generating the sub array based on the conditions
	subArray = ~chordArray.select { |item|
		item >= (~movingAverage.floor-2) and: {
			item <= (~lastPickedPitch + 7) and: {
				item >= (~lastPickedPitch - 7) and: {
					item <= 127 and: {
						item >= 0
					}
				}
			}
		}
	};

	// store the sub array
	~subChordArray = subArray;

	// check if the subArray is empty
	if (~subChordArray.isEmpty) {
		//"subChordArray empty!".postln;
		~subChordArray = ~subChordArrayAus;
		//"subChordArray RIEMPITO!!".postln;
	};

	//"subArray:".postln;
	//subArray.postln;

	// find closest higher value to ~lastPickedPitch
	closestHigherValue = ~chordArray.select { |item| item > ~lastPickedPitch }.minItem;


	// generate weights based on the closest higher value
	weights = ~subChordArray.collect { |item|
		1 / (1 + abs(item - closestHigherValue))
	};


	//"weights before normalization:".postln;
	// weights.postln;

	// weights normalization
	weights = weights / weights.sum;


	//"weights after normalization:".postln;
	//weights.postln;


	//"sum of weights:".postln;
	//weights.sum.postln;

	// VALUE PICKING from ~subChordArray based on the modified distribution
	selectedValue = ~subChordArray.wchoose(weights);
	~selectedValue = selectedValue;
	~lastPickedPitch = ~selectedValue;

	//auxiliary array generated in case of possible errors
	~subChordArrayAus = ~subChordArray;

	//"selectedValue:".postln;
	//selectedValue.postln;

	//^selectedValue;
};

//~generateSubChordArrayAndPickValue.();
//~selectedValue.postln





/* NEGATIVE MELODIC CONTOUR (-1) CASE: PITCH GENERATION

SAME AS BEFORE, EXCEPT OF:
the center point is the HIGHEST LOWER pitch note with respect to the previous selected pitch.

*/

~generateSubChordArrayAndPickValueLower = {
	var subArray, weights, selectedValue, closestLowerValue;

	// sub array based on the minus conditions
	subArray = ~chordArray.select { |item|
		item <= (~movingAverage.ceil+2) and: {
			item <= (~lastPickedPitch + 7) and: {
				item >= (~lastPickedPitch - 7) and: {
					item <= 127 and: {
						item >= 0
					}
				}
			}
		}
	};


	~subChordArray = subArray;

	if (~subChordArray.isEmpty) {
		//"subChordArray empty!".postln;
		~subChordArray = ~subChordArrayAus;
		//"subChordArray RIEMPITO!!".postln;
	};

	//"subArray:".postln;
	//subArray.postln;

	closestLowerValue = ~subChordArray.select { |item| item < ~lastPickedPitch }.maxItem;


	weights = ~subChordArray.collect { |item|
		1 / (1 + abs(item - closestLowerValue))
	};

	//"weights before normalization:".postln;
	//weights.postln;


	weights = weights / weights.sum;


	//"weights after normalization:".postln;
	//weights.postln;


	//"sum of weights:".postln;
	//weights.sum.postln;


	selectedValue = ~subChordArray.wchoose(weights);
	~selectedValue = selectedValue;
	~lastPickedPitch = ~selectedValue;

	~subChordArrayAus = ~subChordArray;

	//"selectedValue:".postln;
	//selectedValue.postln;

	//^selectedValue;
};

//~generateSubChordArrayAndPickValueLower.();







/* LATERAL MELODIC CONTOUR (0) CASE: PITCH GENERATION

SAME AS BEFORE, EXCEPT OF:
now selected value is picked randomly within a fixed upper and lower bound of the SECOND CLOSEST PITCH with respect to last picked pitch. (so for example if chordArray is [1 2 3 4 5 6] and last picked pitch is 4, subChordArray is [2 3 4 5 6].

Probability weights are now based on the MIDDLE VALUE of subChordArray values and we use a square root for making the distribution more linear-ish while keeping it centered on the middle value.

*/

// Laterale

~generateSubChordArrayAndPickValueLateral = {
	var subArray, weights, selectedValue, closestHigherValues, closestLowerValues, middleValue, lastPickedInChordArray;

	// find if ~fixedPitch exists in ~chordArray
	lastPickedInChordArray = ~chordArray.select { |item| item == ~fixedPitch };

	// closest and second closest higher values to ~fixedPitch
	closestHigherValues = ~chordArray.select { |item| item > ~fixedPitch and: {item <= (~fixedPitch + 7)} and: {item > 0} }.sort.keep(2);
	// closest and second closest lower values to ~fixedPitch
	closestLowerValues = ~chordArray.select { |item| item < ~fixedPitch and: {item >= (~fixedPitch - 7)} and: {item < 128} }.sort.reverse.keep(2);


	subArray = lastPickedInChordArray ++ closestHigherValues ++ closestLowerValues;




	// storing the sub array in the environment variable
	~subChordArray = subArray;
	//"subChord array:".postln;
	//~subChordArray.postln;
	// if empty
	if (~subChordArray.isEmpty) {
		//"subChordArray empty!".postln;
		~subChordArray = ~subChordArrayAus;
		//"subChordArray RIEMPITO!!".postln;
	};

	// middle value
	middleValue = ~subChordArray.median;

	// generate weights based on the middle value
	// using square root for making the distribution more linear-ish while keeping it centered on the middle value
	weights = ~subChordArray.collect { |item|
		(1 / (1 + abs(item - middleValue))).sqrt
	};

	// weights normalization
	weights = weights / weights.sum;
	//~subChordArray.postln;
	//weights.postln;

	selectedValue = ~subChordArray.wchoose(weights);
	~selectedValue = selectedValue;
    ~lastPickedPitch = ~selectedValue;
	~subChordArrayAus = ~subChordArray;


	//^selectedValue;
};






/* MELODY PITCH ARRAY GENERATION: MASTER FUNCTION

INPUT: chordName (tonality chord), chordNameTwo (color chord). This second chord can also be a tonality chord of no seventh chord is desired (therefore melody is generated just based on triad tonality chord).
OUTPUT: ~totalMelodyPitches (array containing all the melody pitches according to the input chord)

DESCRIPTION: in this function, all the previous functions are called and put together to generate the complete set of melody pitches with respect to each duration (previously generated).

It consists in a cycle. For each temporal value notNil AND value > 0 in ~totalDurationMelody, assigning a pitch to all the values which meet this condition.

So, after a "dummy" initialization ~totalMelodyPitches = ~totalDurationMelody.copy, made to retrieve the actual slots to be filled, we evaluate for each notNil AND value > 0 its respective transformation through a normalized index (which runs through the transformation array generated before). If the transformation is

1) Contrast or PitchVariation: completely new pitches are generated using all the functions defined above, considering their related melodic contour sign. Note: to ensure the presence of the reference motif, first segment is always Constrast by default and set to motif. Next Contrast segments are set as reference motif interatively as the melody goes on, to inject more originality!

2) Repetition or PitchVariation: copy the pitch values from last Contrast segment (which is, as said before, the reference motif)

3) Retrogradation: retrogradation (by pitches) is carried out my rotating the pitches of the reference motif.

The final result will be a melody made by continuous transformations of the initial reference motif, or new motifs given iteratively by the last Contrast transformation so far.

*/

~generateMelodyPitchArray = { |chordName, chordNameTwo|
	// flag for first note of the melody (~startingTonic). Ran ONCE, when the music STARTS
	~firstReplacementDone = false;
	~chordName = chordName;
	~chordNameTwo = chordNameTwo;
	//~segSign = segSigns;
	~recentValues = Array.new;
	~motifPitchesArray = Array.new;
	~movingAverage = 0;
	~counter=0;

	" ♪♬ -- ♪♬ NEW MELODY ♪♬ -- ♪♬ ＼ʕ •ᴥ•ʔ／ ".postln;
	~runMarkovChain.();
	"STATE ARRAY:".postln;
	~stateArray.postln;

	~generateMelodicContourArray.();
	"MELODIC CONTOUR ARRAY:".postln;
	~melodicContourArray.postln;
	"AUXILIARY CONTOUR ARRAY:".postln;
	~auxiliaryArray.postln;

	~generateTransformationArray.();
	"TRANSFORMATION ARRAY:".postln;
	~transformationArray.postln;

	~generateSegmentDurationArray.();
	//"FIRST SEGMENT (MOTIF) DURATION ARRAY:".postln;
	//~segmentDurationArray.postln;

	~melodyDurationsGeneration.();
	"MELODY DURATION ARRAY:".postln;
	~totalDurationMelody.postln;
	"MELODY DURATION ARRAY (only notes' & pauses' durations):".postln;
	~totalDurationMelody2 = ~totalDurationMelody.select { |val|
		val.notNil
	};
	~totalDurationMelody2.postln;




	// pitch generation for each duration
	//"PITCH GNERATION:".postln;
	~totalMelodyPitches = ~totalDurationMelody.copy;


	// CYCLYING SLOTS
	~totalMelodyPitches.do { |value, index|


		~counter=~counter+1;


		// retrieving normalized index from extended duration array to transformation/contour array
		~motifTotalIndexes = (~finalState.asInteger*8)-1;
		~motifTotalCells = ~motifTotalIndexes+1;
		// normalized index
		~indexNormalized = index.div(~motifTotalCells.asInteger);
		// sign for each generated pitch
		~segSign = ~melodicContourArray[~indexNormalized];
		//~segSign.postln;

		//"MELODY PITCHES SO FAR (FILTERED):".postln;
		//~totalMelodyPitches3 = ~totalMelodyPitches.select { |val|
		//	val.notNil and: { val >= 2 }
		//};
	    //~totalMelodyPitches3.postln;

		// IF TRANSFORMATION IS CONTRAST OR PITCH VARIATION
		if(
			value.notNil
			and: { value > 0 }
			and:{
				~transformationArray[~indexNormalized.asInteger] == "Contrast" or:
				{ ~transformationArray[~indexNormalized.asInteger] == "PitchVariation" }
			}
		) {

			// moving average computation
			if(~firstReplacementDone.not) {

				// retrieving starting tonic, Tonic Number defined above
				~startingTonic = ~tonicNumber[~chordName];

				~totalMelodyPitches[index] = ~startingTonic;
				//"GENERATED TONIC:".postln;
				//~startingTonic.postln;

				~recentValues.add(~startingTonic);

				~lastPickedPitch = ~startingTonic; // initializing picked pitch

				~firstReplacementDone = true;

				// compute the moving average right after adding the first element
				~movingAverage = ~recentValues.sum / ~recentValues.size;
				//~movingAverage.postln;

			} {


				// moving average condition computation and update. Add the current value to recentValues

				// updating and computing the average last 5 elements
				if(~recentValues.size > 5){~recentValues = ~recentValues.drop(1)};

				// filter out possible nil elements due to boundary touch reverse
				~recentValues = ~recentValues.select { |item| item.notNil };
				//"VALORI AVG".postln; ~recentValues.postln;

				~movingAverage = ~recentValues.sum / ~recentValues.size;
				//~movingAverage.postln;


				// very first note of the SEGMENT, closest to last previous segment
				if(index == 0){

					//On beat note !
					~chordArray = ~chordArrays[~chordNameTwo];
					~selectedValue = ~findClosestNumber.value(~chordArray, ~lastPickedPitch);
					~lastPickedPitch = ~selectedValue;
					~totalMelodyPitches[index] = ~selectedValue;
					~recentValues = (~recentValues.add(~selectedValue));


				} {
					// if not first note, then start usual generation

					if(index % 8 == 0 and: { index != 0 }){

						//On beat note!

						~chordArray = ~chordArrays[~chordNameTwo];


						if(~segSign == 1){


							if(~lastPickedPitch>84){

								//"EXCEPTION UPPER GLOBAL RANGE".postln;
								~generateSubChordArrayAndPickValueLower.();
								~totalMelodyPitches[index] = ~selectedValue;
								//"GENERATION DONE!".postln;
								~recentValues = (~recentValues.add(~selectedValue));



							}{

								//"GENERATION STARTS...".postln;
								~generateSubChordArrayAndPickValue.();
								~totalMelodyPitches[index] = ~selectedValue;
								//"GENERATION DONE!".postln;
								~recentValues = (~recentValues.add(~selectedValue));



							};
						};


						if(~segSign == (-1)){

							if(~lastPickedPitch<57){

								//"EXCEPTION LOWER GLOBAL RANGE".postln;
								~generateSubChordArrayAndPickValue.();
								~totalMelodyPitches[index] = ~selectedValue;
								//"GENERATION DONE!".postln;
								~recentValues = (~recentValues.add(~selectedValue));


							}{

								//"GENERATION STARTS...".postln;
								~generateSubChordArrayAndPickValueLower.();
								~totalMelodyPitches[index] = ~selectedValue;
								//"GENERATION DONE!".postln;
								~recentValues = (~recentValues.add(~selectedValue));

							};


						};



						if(~segSign == 0){


							//"GENERATION STARTS...".postln;
							~fixedPitch = ~lastPickedPitch;
							~generateSubChordArrayAndPickValueLateral.();
							~totalMelodyPitches[index] = ~selectedValue;
							//"GENERATION DONE!".postln;
							~recentValues = (~recentValues.add(~selectedValue));


						};



					} {

						//Off beat note !

						~chordArray = ~chordArraysOff[~chordName];

						if(~segSign == 1){


							if(~lastPickedPitch>84){

								//"EXCEPTION UPPER GLOBAL RANGE".postln;
								~generateSubChordArrayAndPickValueLower.();
								~totalMelodyPitches[index] = ~selectedValue;
								//"GENERATION DONE!".postln;
								~recentValues = (~recentValues.add(~selectedValue));


							}{

								//"GENERATION STARTS...".postln;
								~generateSubChordArrayAndPickValue.();
								~totalMelodyPitches[index] = ~selectedValue;
								//"GENERATION DONE!".postln;
								~recentValues = (~recentValues.add(~selectedValue));

							};

						};

						if(~segSign == -1){

							if(~lastPickedPitch<57){
								//"EXCEPTION LOWER GLOBAL RANGE".postln;
								~generateSubChordArrayAndPickValue.();
								~totalMelodyPitches[index] = ~selectedValue;
								//"GENERATION DONE!".postln;
								~recentValues = (~recentValues.add(~selectedValue));


							}{


								//"GENERATION STARTS...".postln;
								~generateSubChordArrayAndPickValueLower.();
								~totalMelodyPitches[index] = ~selectedValue;
								//"GENERATION DONE!".postln;
								~recentValues = (~recentValues.add(~selectedValue));

							};


						};

						if(~segSign == 0){

							//"GENERATION STARTS...".postln;
							~fixedPitch = ~lastPickedPitch;
							~generateSubChordArrayAndPickValueLateral.();
							~totalMelodyPitches[index] = ~selectedValue;
							//"GENERATION DONE!".postln;
							~recentValues = (~recentValues.add(~selectedValue));

						};
					}; //Off beat note close
				}; // close If index == 0

			}; //close If non è la tonica


		}{
			// IF TRANSFORMATION IS REPETITION OR TEMPORAL VARIATION
			if(
				value.notNil
				and: { value > 0 }
				and:{~transformationArray[~indexNormalized.asInteger] == "Repetition" or:
					{ ~transformationArray[~indexNormalized.asInteger] == "TemporalVariation" }
				}
			){

				// prendo il primo pitch del motif filtrato e ruoto di uno orario
				~selectedValue = ~filteredMotifPitchesArray[0];
				//"SELECTED VALUE:".postln;
				//~selectedValue.postln;
				~totalMelodyPitches[index] = ~selectedValue;
				~recentValues = (~recentValues.add(~selectedValue));
				//"FILTERED NORMAL".postln;
				//~filteredMotifPitchesArray.postln;
				~filteredMotifPitchesArray = ~filteredMotifPitchesArray.rotate(-1);
				//"FILTERED ROTATED".postln;
				//~filteredMotifPitchesArray.postln;


			}{
				// IF TRANSFORMATION IS RETROGRADATION
				if(
					value.notNil
					and: { value > 0 }
					and:{~transformationArray[~indexNormalized.asInteger] == "Retrogradation"}
				){

					// ruoto di uno antiorario dal motif filtrato e prendo il primo
					//"FILTERED NORMAL".postln;
					//~filteredMotifPitchesArray.postln;
					~filteredMotifPitchesArray = ~filteredMotifPitchesArray.rotate(1);
					//"FILTERED ROTATED".postln;
					//~filteredMotifPitchesArray.postln;
					~selectedValue = ~filteredMotifPitchesArray[0];
					//"SELECTED VALUE:".postln;
					//~selectedValue.postln;
					~totalMelodyPitches[index] = ~selectedValue;
					~recentValues = (~recentValues.add(~selectedValue));


				};



			};


		};


        // LASTLY, IF CONTRAST, UPGRADE IT TO REFERENCE MOTIF
		if(
			~transformationArray[~indexNormalized.asInteger] == "Contrast"
			and: { (index + 1).mod(~motifTotalCells.asInteger) == 0 }
			and: { index != 0 }
		){

			//"DA QUI, AD INDIETRO SI COPIA IL MOTIF".postln;
			//"TOTAL MELODY PITCHES:".postln;
			//~totalMelodyPitches.postln;
			//Pitch array del motif
			~motifPitchesArray = ~totalMelodyPitches[index-~motifTotalIndexes..index];
			//"MOTIF PITCHES ARRAY".postln;
			//~motifPitchesArray.postln;


			//ONLY PITCHES VALUES, NO NIL OR NEGATIVES
			~filteredMotifPitchesArray = ~motifPitchesArray.select { |val|
				val.notNil
			};
			"MOTIF PITCHES ARRAY (only notes & pauses):".postln;
			~filteredMotifPitchesArray.postln;


		};


	};

	//Prints

	"TOTAL MELODY PITCHES:".postln;
	~totalMelodyPitches.postln;
	~totalMelodyPitches2 = ~totalMelodyPitches.select { |val|
		val.notNil
	};
	"TOTAL MELODY PITCHES (only notes & pauses):".postln;
	~totalMelodyPitches2.postln;

};






/* ------------------------------------------------------------------ */




//Manual Playback


/* MANUAL melody feedback (without OSC messages as input); there isn't the first iteration! so call ~generateMelodyPitchArray.(~chordName,~chordNameTwo) once, and load chords before running ~playMelody.(); */
// load chords manually
//~chordName = \b;
//~chordNameTwo = \b;
// function for first iteration (to be ran once before playMelody.())
//~generateMelodyPitchArray.(~chordName,~chordNameTwo);




/* ------------------------------------------------------------------ */



//Playback through OSC messages


// OCULUS

// OSC responder:

OSCdef(\myResponder, {
	|msg, time, addr, recvPort|

	"Message received".postln;
	msg.postln;

	if (msg[0] == '/unity' and: { msg.size > 1 }) {
		var letters = msg[1].asString.split($,);

		if (letters.size == 2) {
			~stopCurrentRoutine.value;  // Stop the current routine regardless of the message received

			if (letters[0] != "z" or: { letters[1] != "z" }) {
				~chordName = letters[0].asSymbol;
				~chordNameTwo = letters[1].asSymbol;
				~generateMelodyPitchArray.(~chordName,~chordNameTwo);
				~playMelody.value;
			}{ ~lastChordSynth.set(\amp, 0.01);
			};

		};
	};

}, '/unity');






/* ------------------------------------------------------------------ */


//SYNTHS


// melody SynthDef
SynthDef(\melodyPlayer, {
    arg
    // Standard values
    freq = 440, amp = 0.25, att = 0.005, rel = 1, pan = 0, out = 0,
    // These range from 0 to 1
    tone = 0.25, hollowness = 0;

    var hammer, snd, delay, tonefreq, env;

    env = Env.perc(att, rel, amp * 4, -1).ar(doneAction: 2);

    // Delay line times: freq, freq - 4 cents, freq + 3 cents. In the original this was done by converting freq to midi.
    delay = (1 / (freq * [2.pow(-0.04/12), 1, 2.pow(0.03/12)]));
    tonefreq = tone.linlin(0, 1, 1000, 5000);

    hammer = Decay2.ar(
        in: Impulse.ar(0.001),
        attackTime: 0.008,
        decayTime: 0.04,
        mul: LFNoise2.ar(freq: amp.linlin(0, 1, tonefreq, 2 * tonefreq), mul: 0.25)
    ); // Try LFNoise1, LFNoise0, or even LFClipNoise above for a slightly grainier sound.

    snd = CombL.ar(hammer, delay, delay, 50 * amp);
    snd = HPF.ar(snd, hollowness.linlin(0, 1, 50, 1000));
    snd = snd * env;
    snd = Limiter.ar(snd);
    Out.ar(out, Pan2.ar(snd, pan));
},
metadata: (
    credit: "based on something posted 2008-06-17 by jeff, based on an old example by james mcc",
    category: \keyboards,
    tags: [\casio, \piano, \pitched]
)
).add;





// chord SynthDef
SynthDef(\chordPlayer, {
    arg

    out = 0, pan = 0, freqs = #[440, 660, 880, 1100], chordm, amp = 0.16, att = 0.5, dec = 0.5, sus = 0.8, rel = 0.1, gate = 1,

    vibratoRate = 4, vibratoDepth = 0.02, tremoloRate = 4, dur,

    tremoloDepth = 0.25, reverbMix = 0.5, roomSize = 1, damp = 0.7;

    var env, snd, vibrato, tremolo, chordSound, sustainTime;

	freqs[0] = freqs[0] * 0.5;
	freqs[1] = freqs[1] * 0.5;
	freqs[2] = freqs[2] * 0.5;
	freqs[3] = freqs[3] * 0.5;

    // calculate sustain time based on total duration, attack, and release times.
    sustainTime = dur - (att + rel);

    // adjust the envelope to sustain for the required duration
    env = Env.new([0, 1, sus, 0], [att, sustainTime, rel]).kr(gate: gate);
    vibrato = SinOsc.kr(vibratoRate).range(freqs * (1 - vibratoDepth), freqs * (1 + vibratoDepth));
    tremolo = LFNoise2.kr(1).range(0.2, 1) * SinOsc.kr(tremoloRate).range((1 - tremoloDepth), 1);

    chordSound = Mix.ar(freqs.collect { |f|
        SinOsc.ar(freq: f, mul:(env * tremolo * amp)).distort;
    });

    chordSound = FreeVerb.ar(chordSound, reverbMix, roomSize, damp);

    DetectSilence.ar(chordSound, 0.001, 0.1, doneAction: 2);
    Out.ar(out, Pan2.ar(chordSound, pan));
},
metadata:(
    credit: "Mike Hairston (modified further)",
    tags: [\pad, \vibrato, \sustained, \chord]
)
).add;




// compressor SynthDef
SynthDef(\simpleCompressor, { |inBus, outBus, thresh = 0.8, ratio = 0.5, attack = 0.01, release = 0.1|
    var inSig = In.ar(inBus, 2);
    var compressed = Compander.ar(inSig, inSig, thresh, 1, 1/ratio, attack, release);
    Out.ar(outBus, compressed);
}).add;



// limiter SynthDef
SynthDef(\limiter, { |inBus, outBus, threshold = 0.9, releaseTime = 0.1|
    var signal = In.ar(inBus, 2);
    signal = Limiter.ar(signal, threshold, releaseTime);
    Out.ar(outBus, signal);
}).add;



// bus for the mix
~mixBus = Bus.audio(s, 2);

// compressor
~compressor = Synth(\simpleCompressor, [\inBus, ~mixBus.index, \outBus, 0]);

// limiter (after the compressor, but before the final output)
~limiterSynth = Synth(\limiter, [\inBus, 0, \outBus, 0]);



// stop current routine function
~stopCurrentRoutine = {
    if (~currentRoutine.notNil) {
        ~currentRoutine.stop;
        ~currentRoutine = nil;
    };
    // empty the old melodic contour of previous melodies
    ~melodicContourArray = [];
    ~auxiliaryArray = [];
};




~lastChordSynth = nil;

// play melody function: generating continuously new melodies
~playMelody = {
    ~currentRoutine = Routine {
        inf.do {
			var chordNameTwoTemp;
            var totalDuration = ~totalDurationMelody.select{ |d| d.notNil }.collect{ |d| d.abs }.sum;
			~durata = ~totalDurationMelody.select{ |d| d.notNil }.collect{ |d| d.abs }.sum;
            ~playingChord = ~getChordSlice.(~tonicNumber.at(~chordNameTwo), ~chordNameTwo);


			// stop the previous chord if it's still playing, and reset
			if (~lastChordSynth.notNil) {
				~lastChordSynth.set(\amp, 0);
				~lastChordSynth = nil;
			};



            // play the chord for the full duration of the melody
			~frequenze = ~playingChord.collect { |pitch| pitch.midicps };
			if(~frequenze[0] > 328){~frequenze[0] = ~frequenze[0] * 0.5}

			// wider chord, more pleasing
			{
				~frequenze[1] = ~frequenze[1] * 2;
				~frequenze[2] = ~frequenze[2] * 2;
				~frequenze[3] = ~frequenze[3] * 2;
			};

            ~lastChordSynth = Synth(\chordPlayer, [ \freqs, ~frequenze, \chordm, ~playingChord, \dur, ~durata, \outBus, ~mixBus.index ]);

            ~totalMelodyPitches.size.do { |i|
                var pitch, duration;
                pitch = ~totalMelodyPitches[i];
                duration = ~totalDurationMelody[i];

                if (pitch.notNil and: { duration.notNil }) {
                    if (pitch > 0) {
                       ~melodySynth = Synth(\melodyPlayer, [ \freq, pitch.midicps, \dur, duration, \outBus, ~mixBus.index ]);
                    };

                    if (pitch < 0 or: { duration > 0 }) {
                        duration.abs.wait;
                    };
                };
            };

            ~generateMelodyPitchArray.(~chordName,~chordNameTwo);  // generate a new melody after the current finishes
        };
    }.play;
};





/* ------------------------------------------------------------------ */


// for manual playback
// play continuously melody generation
//~playMelody.();
// stop the routine
//~stopCurrentRoutine.();


// free the synths manually
//~melodySynth.free
//~lastChordSynth.free


