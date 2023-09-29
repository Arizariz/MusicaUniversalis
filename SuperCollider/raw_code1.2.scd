//////// CODICE PROVVISORIO ////////////
///////////////////////////////////////
//////////////////////////////////////




~chordArrays = (


	// Extended Chords
	c: [0, 4, 7, 12, 16, 19, 24, 28, 31, 36, 40, 43, 48, 52, 55, 60, 64, 67, 72, 76, 79, 84, 88, 91, 96, 100, 103, 108, 112, 115, 120, 124, 127],
	cmaj7: [0, 4, 7, 11, 12, 16, 19, 23, 24, 28, 31, 35, 36, 40, 43, 47, 48, 52, 55, 59, 60, 64, 67, 71, 72, 76, 79, 83, 84, 88, 91, 95, 96, 100, 103, 107, 108, 112, 115, 119, 120, 124, 127],
	c7: [0, 4, 7, 10, 12, 16, 19, 22, 24, 28, 31, 34, 36, 40, 43, 46, 48, 52, 55, 58, 60, 64, 67, 70, 72, 76, 79, 82, 84, 88, 91, 94, 96, 100, 103, 106, 108, 112, 115, 118, 120, 124, 127],
	cm: [0, 3, 7, 12, 15, 19, 24, 27, 31, 36, 39, 43, 48, 51, 55, 60, 63, 67, 72, 75, 79, 84, 87, 91, 96, 99, 103, 108, 111, 115, 120, 123, 127],
	cm7: [0, 3, 7, 10, 12, 15, 19, 22, 24, 27, 31, 34, 36, 39, 43, 46, 48, 51, 55, 58, 60, 63, 67, 70, 72, 75, 79, 82, 84, 87, 91, 94, 96, 99, 103, 106, 108, 111, 115, 118, 120, 123, 127],
	cm7b5: [0, 3, 6, 10, 12, 15, 18, 22, 24, 27, 30, 34, 36, 39, 42, 46, 48, 51, 54, 58, 60, 63, 66, 70, 72, 75, 78, 82, 84, 87, 90, 94, 96, 99, 102, 106, 108, 111, 114, 118, 120, 123, 126],
	db: [1, 5, 8, 13, 17, 20, 25, 29, 32, 37, 41, 44, 49, 53, 56, 61, 65, 68, 73, 77, 80, 85, 89, 92, 97, 101, 104, 109, 113, 116],
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


~chordArraysOff = (

	//Diatonic scales

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






~tonicNumber = (
	c: 60,
	g: 67,
	d: 62,
	a: 69,
	e: 64,
	b: 71,
	fs: 66,
	db: 61,
	ab: 68,
	eb: 63,
	bb: 70,
	f: 65;
);




~getChordSlice = { |startIndex, chordName|
	var chordArray = ~chordArrays[chordName];
	var startingIndexPosition = chordArray.indexOf(startIndex);
	if(startingIndexPosition.isNil) {
		~chordSlice = nil;
	} {
		~chordSlice = chordArray[startingIndexPosition..(startingIndexPosition + 3)];
	}
};

//~playingChord = ~getChordSlice.(~tonicNumber.c, 'cmaj7');































































// Piece duration computation and motif duration computation


~states = ["Start", "8", "2", "4"];

// Transition matrix
~matrix = [
    [0, 1, 0, 0],      // Start state -> "8"
    [0, 0, 0.5, 0.5],  // Passing state "8" -> "2" or "4"
    [0, 0, 1, 0],      // Absorbing state "2"
    [0, 0, 0, 1],      // Absorbing state "4"
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
    var currentStateIndex = 0;
    var previousStateIndex;

    // Iterate until we reach an absorbing state
    while { [0, 1].includes(currentStateIndex) } {
        previousStateIndex = currentStateIndex;
        currentStateIndex = ~getNextState.(currentStateIndex);
    };


    ~passingState = ~states[previousStateIndex];
    ~finalState = ~states[currentStateIndex];

    // Store and Print the values
    ~stateArray = [~passingState, ~finalState];
    //(~passingState + " -> " + ~finalState).postln;
    //^this
};

//~runMarkovChain.();










/*
~states = ["Start", "4", "8", "1", "2", "2", "4"];

// Transition matrix
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

    // Iterate until we reach an absorbing state
    while { [0, 1, 2].includes(currentStateIndex) } {
        previousStateIndex = currentStateIndex;
        currentStateIndex = ~getNextState.(currentStateIndex);
    };

    // Store the states in the variables
    ~passingState = ~states[previousStateIndex];
    ~finalState = ~states[currentStateIndex];

    // Print the values
    ~stateArray = [~passingState, ~finalState];
    //(~passingState + " -> " + ~finalState).postln;
    //^this
};


//~runMarkovChain.();
*/








/*

//Initializing arrays, empty them from previous melodies contours
~melodicContourArray = [];
~auxiliaryArray = [];

~generateMelodicContourArray = {
	// Initialization for the function itself
	var currentIndex = 0;
	var shouldContinue = true;

	// Other initialization
	~triplets = [[1, -1, 0], [1, 0, -1], [-1, 1, 0], [-1, 0, 1], [0, 1, -1], [0, -1, 1]];
	~nMelodySegments = (~passingState.asInteger)/(~finalState.asInteger);
	~melodicContourArray = Array.fill(~nMelodySegments, { nil });
	~motifIndex = 0;


	if (~auxiliaryArray.notNil and: { ~auxiliaryArray.size == 2 }) {
		~auxiliaryArray.do { |value, i|
			~melodicContourArray[i] = value;
			currentIndex = currentIndex + 1;
		}
	};

	if (~auxiliaryArray.notNil and: { ~auxiliaryArray.size == 1 }) {
		~auxiliaryArray.do { |value, i|
			~melodicContourArray[i] = value;
			currentIndex = currentIndex + 1;
			~auxiliaryArray = [];
		}
	};


	//Generating melodic contour array
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

	//This is the initial motif sign
	~motifSign = ~melodicContourArray[0];
	//Print
	"melodicArray".postln;
	~melodicContourArray.postln;
	"ausArray".postln;
	~auxiliaryArray.postln;
	//^this
};

~generateMelodicContourArray.(); */








~melodicContourArray = [];
~auxiliaryArray = [];

~generateMelodicContourArray = {
	// Initialization for the function itself
	var currentIndex = 0;
	var shouldContinue = true;


	~triplets = [[1, -1, 0], [1, 0, -1], [-1, 1, 0], [-1, 0, 1], [0, 1, -1], [0, -1, 1]];
	~nMelodySegments = (~passingState.asInteger)/(~finalState.asInteger);
	~melodicContourArray = Array.fill(~nMelodySegments, { nil });
	~motifIndex = 0;


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

	//This is the initial motif sign
	~motifSign = ~melodicContourArray[0];
	//Print
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




































// Creating the transformation array

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










//General segment durations generation

~generateSegmentDurationArray = {

	var currentIndex, availableSlots, eligibleDurations, eligibleProbs, chosenDuration;


	var indexIncrease = { |duration|
		switch(duration,
			1, { 8 },
			0.5, { 4 },
			0.25, { 2 },
			0.125, { 1 },
			{ 0 }
		);
	};


	~segmentLength = (~finalState.asInteger) * 8;


	~probabilities = [0.0, 0.1, 0.4, 0.5];
	if(~finalState.asInteger == 2) { ~probabilities = [0.0, 0.4, 0.5, 0.1] };
	if(~finalState.asInteger == 4) { ~probabilities = [0.1, 0.5, 0.3, 0.1] };

	~durations = [1, 0.5, 0.25, 0.125];

	~segmentDurationArray = Array.newClear(~segmentLength);
	currentIndex = 0;

	while { currentIndex < ~segmentLength } {
		availableSlots = ~segmentLength - currentIndex;
		eligibleDurations = ~durations.select({ |dur|
			availableSlots >= indexIncrease.(dur);
		});
		if(eligibleDurations.isEmpty) {
			currentIndex = ~segmentLength;
		} {

			eligibleProbs = eligibleDurations.collect({ |dur|
				~probabilities[~durations.indexOf(dur)];
			});
			eligibleProbs = eligibleProbs * (1.0 / eligibleProbs.sum);
			chosenDuration = eligibleDurations.wchoose(eligibleProbs);
			chosenDuration = [1, -1].wchoose([0.8, 0.2]) * chosenDuration;
			~segmentDurationArray[currentIndex] = chosenDuration;
			currentIndex = currentIndex + indexIncrease.(chosenDuration.abs);
		};
	};


	//~segmentDurationArray.postln;
	//^this
};

























//Run chain, generate melody contour, generate transformations

//~runMarkovChain.();
//~generateMelodicContourArray.();
//~generateTransformationArray.();
//~generateSegmentDurationArray.();
//~segmentDurationArray.postln







//Rearrange temporal array for TimeVariation transformation
~rearrangeArray = {
	var cutIndex = nil;
	var tempArray = ~totalDurationMotif;
	var tempSize = tempArray.size;


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

	// If such an index exists then rearrange the array!!
	if(cutIndex.notNil) {
		var firstPart = tempArray.copyRange(0, cutIndex - 1);
		var secondPart = tempArray.copyRange(cutIndex, tempSize - 1);
		~rearrangedTotalDurationMotif = secondPart ++ firstPart;
	}
};


//~rearrangeArray.();











//Melody durations generation
~melodyDurationsGeneration = {
	//Generating first motif segment durations
	~totalDurationMotif = ~segmentDurationArray;
	//Initializing the melody starting with motif durations
	~totalDurationMelody = ~segmentDurationArray;

	//Dropping the first cell to run the cycle on the remaining cells of transformationArray
	~transformationDroppedArray = ~transformationArray.drop(1);

	//Adding the rest of segments durations
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



//~melodyDurationsGeneration.();
//~totalDurationMelody.postln;
//~melodyDurationsGeneration.();
//~motifSign.postln
//~motifIndex.postln



//generation segment Pitch Array






// funzione di utility: find closest number for optimal tonic melody concatenation with previous note
~findClosestNumber = {
	arg chordArray, lastPickedPitch;
	~closest = chordArray[0];  // inizializza il più vicino
	~smallestDiff = abs(lastPickedPitch - ~closest);  // initialize smallestDiff with the absolute difference between target and closest

	// find the closest number
	chordArray.do { |num|
		~diff = abs(lastPickedPitch - num);  // absolute difference between target and num
		if (~diff < ~smallestDiff) {  // if this difference is smaller than smallestDiff
			~closest = num;  // update closest
			~smallestDiff = ~diff;  // update smallestDiff
		}
	};

	~closestNum = ~closest;
};
//~findClosestNumber.value(~chordArray, ~lastPickedPitch);

















// Segment Sign (+1) generation function

//calculate the weights as the inverse of the distance to the center point, and then normalize them.

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

	// checkif the subArray is empty
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
	~lastPickedPitch = ~selectedValue; //////////////////

	~subChordArrayAus = ~subChordArray; //if error eccours we use this aux array

	//"selectedValue:".postln;
	//selectedValue.postln;

	//^selectedValue;
};

//~generateSubChordArrayAndPickValue.();
//~selectedValue.postln






















// Segment Sign (-1) generation function


// generate a sub array with modified conditions and apply the same bell-shaped weight calculations
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
		// Here put the function
		//"subChordArray empty!".postln;
		~subChordArray = ~subChordArrayAus;
		//"subChordArray RIEMPITO!!".postln;
	};

	//"subArray:".postln;
	//subArray.postln;


	closestLowerValue = ~subChordArray.select { |item| item < ~lastPickedPitch }.maxItem;



	//"bbbbbbbbbbbbb".postln;
	weights = ~subChordArray.collect { |item|
		1 / (1 + abs(item - closestLowerValue))
	};
	//"ccccccccccccc".postln;

	//"weights before normalization:".postln;
	//weights.postln;


	weights = weights / weights.sum;


	//"weights after normalization:".postln;
	//weights.postln;


	//"sum of weights:".postln;
	//weights.sum.postln;


	selectedValue = ~subChordArray.wchoose(weights);
	~selectedValue = selectedValue;
	~lastPickedPitch = ~selectedValue; //////////////////////////

	~subChordArrayAus = ~subChordArray;

	//"selectedValue:".postln;
	//selectedValue.postln;

	//^selectedValue;
};

//~generateSubChordArrayAndPickValueLower.();







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




//Important! Removing quotes from OSC message
//~removeQuotes = { |inputString|
//    inputString.replace("'", "");
//};


//Process Generation Segment Pitch Array

//INPUT: ~generateMelodyPitchArray.value("chord1", "chord2", segment sign, "segment transformation");
//input chords eg. [c, cmaj7, 1, Contrast], always two, first tonality, second color. For notes on beat will be used extension of second, ~chordArrays,
//while for notes off beat will be used diatonic scale of first ~chordArraysOff. If trad alone, second will be filled eg. [c, c].





~generateMelodyPitchArray = { |chordName, chordNameTwo|
	//Flag for first note of the FIRST MELODY(~startingTonic). Ran ONCE, when the music STARTS
	~firstReplacementDone = false;
	~chordName = chordName;
	//Fix quotes quando messaggi esterni (se lanci la f manualmente senza unity commenta qui)
	//~chordName = ~removeQuotes.value(~chordName);
	~chordNameTwo = chordNameTwo;
	//Fix quotes quando messaggi esterni (se lanci la f manualmente senza unity commenta qui)
	//~chordNameTwo = ~removeQuotes.value(~chordNameTwo);
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
	////"FIRST SEGMENT (MOTIF) DURATION ARRAY:".postln;
	////~segmentDurationArray.postln;

	~melodyDurationsGeneration.();
	"MELODY DURATION ARRAY:".postln;
	~totalDurationMelody.postln;




	//Pitch generation for each duration

	////"PITCH GNERATION:".postln;
	~totalMelodyPitches = ~totalDurationMelody.copy;


	~totalMelodyPitches.do { |value, index|


		//"INDEX:".postln;
		//index.postln;
		~counter=~counter+1;
		//~counter.postln;

		//Retrieving normalized index from extended duration array to transformation/contour array
		~motifTotalIndexes = (~finalState.asInteger*8)-1;
		~motifTotalCells = ~motifTotalIndexes+1;
		////"motif total index:".postln;~motifTotalIndexes.postln;

		~indexNormalized = index.div(~motifTotalCells.asInteger);

		//"COUNTER:".postln; ~counter.postln;
		//"TRASFORMAZIONE:".postln;
		//~transformationArray[~indexNormalized].postln;
		//"Index normalized:".postln
		//~indexNormalized.postln;

		//Segno per ogni pitch generato
		~segSign = ~melodicContourArray[~indexNormalized];
		//~segSign.postln;


		/*

		if(
		~transformationArray[~indexNormalized.asInteger] == "Contrast"
		and: { index.mod(~motifTotalIndexes.asInteger) == 0 }
		and: { index != 0 }
		){


		"DA QUI, AD INDIETRO motifCells SI COPIA IL MOTIF".postln;
		//MOTIF PITCHES ARRAY
		~totalMelodyPitches.postln;
		//Pitch array del motif
		~motifPitchesArray = ~totalMelodyPitches[index-~motifTotalIndexes..index];
		"MOTIF PITCHES ARRAY".postln;
		~motifPitchesArray.postln;


		//ONLY PITCHES VALUES, NO NIL OR NEGATIVES
		~filteredMotifPitchesArray = ~motifPitchesArray.select { |val|
		val.notNil and: { val >= 0 }
		};


		}; */


		if(
			value.notNil
			and: { value > 0 }
			and:{
				~transformationArray[~indexNormalized.asInteger] == "Contrast" or:
				{ ~transformationArray[~indexNormalized.asInteger] == "PitchVariation" }
			}
		) {




			//69 if(value.notNil and: { value > 0 } ) {



			//"INDEX:".postln;
			//index.postln;



			//Moving average computation

			//First EVER note(tonic) of the 1st MELODY.Run ONCE,when music STARTS.Avoids moving average condition,just inserted
			if(~firstReplacementDone.not) {
				~startingTonic = ~tonicNumber[~chordName]; //Retrieving starting tonic, Tonic Number defined above
				~totalMelodyPitches[index] = ~startingTonic;
				//"GENERATED TONIC:".postln;
				//~startingTonic.postln;
				~recentValues.add(~startingTonic);
				~lastPickedPitch = ~startingTonic; //Initializing picked pitch
				~firstReplacementDone = true;
				// Compute the moving average right after adding the first element
				~movingAverage = ~recentValues.sum / ~recentValues.size;
				//"a".postln;~recentValues.postln;
				//~movingAverage.postln;

			} {





				//"MELODY SO FAR:".postln;
				//~totalMelodyPitches.postln;

				// Moving average condition computation and update. Add the current value to recentValues

				//Updating and computing the average last 3 elements
				//"b".postln;~recentValues.postln;
				if(~recentValues.size > 5){~recentValues = ~recentValues.drop(1)};
				// Filter out possible nil elements due to boundary touch reverse
				~recentValues = ~recentValues.select { |item| item.notNil };
				//"VALORI AVG".postln; ~recentValues.postln;
				~movingAverage = ~recentValues.sum / ~recentValues.size;
				//"fino a qui ok".postln;
				//~movingAverage.postln;


				//Very first note of the SEGMENT, closest to last previous segment
				if(index == 0){
					//On beat note
					~chordArray = ~chordArrays[~chordNameTwo];
					~selectedValue = ~findClosestNumber.value(~chordArray, ~lastPickedPitch);
					~lastPickedPitch = ~selectedValue;
					~totalMelodyPitches[index] = ~selectedValue;
					~recentValues = (~recentValues.add(~selectedValue));


				} {
					if(index % 8 == 0 and: { index != 0 }){

						//On beat note
						//"on beat".postln;
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

								////"moving average:".postln;
								////~movingAverage.postln;
								////"sub chord array:".postln;
								////~subChordArray.postln;
								////"generated value:".postln;
								////~selectedValue.postln;


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

								////"moving average:".postln;
								////~movingAverage.postln;
								////"sub chord array:".postln;
								////~subChordArray.postln;

								////"generated value:".postln;
								////~selectedValue.postln;


								//"GENERATION DONE!".postln;
								~recentValues = (~recentValues.add(~selectedValue));

							};


						};



						if(~segSign == 0){


							//"GENERATION STARTS...".postln;
							~fixedPitch = ~lastPickedPitch;
							~generateSubChordArrayAndPickValueLateral.();
							~totalMelodyPitches[index] = ~selectedValue;

							////"median:".postln;
							////~subChordArray.median.postln;
							//"sub chord array:".postln;
							//~subChordArray.postln;

							////"generated value:".postln;
							////~selectedValue.postln;


							//"GENERATION DONE!".postln;
							~recentValues = (~recentValues.add(~selectedValue));



						};



					} {

						//Off beat note
						//"off beat".postln;

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

								////"moving average:".postln;
								////~movingAverage.postln;
								////"sub chord array:".postln;
								////~subChordArray.postln;
								////"generated value:".postln;
								////~selectedValue.postln;


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

								////"moving average:".postln;
								////~movingAverage.postln;
								////"sub chord array:".postln;
								////~subChordArray.postln;
								////"generated value:".postln;
								////~selectedValue.postln;


								//"GENERATION DONE!".postln;
								~recentValues = (~recentValues.add(~selectedValue));

							};


						};

						if(~segSign == 0){

							//"GENERATION STARTS...".postln;
							~fixedPitch = ~lastPickedPitch;
							~generateSubChordArrayAndPickValueLateral.();
							~totalMelodyPitches[index] = ~selectedValue;

							////"median:".postln;
							////~subChordArray.median.postln;
							//"sub chord array:".postln;
							//~subChordArray.postln;

							////"generated value:".postln;
							////~selectedValue.postln;


							//"GENERATION DONE!".postln;
							~recentValues = (~recentValues.add(~selectedValue));

						};
					}; //Off beat note close
				}; // close If index == 0

			}; //close If non è la tonica


			////////69 if value>0 etc };





		}{

			if(
				value.notNil
				and: { value > 0 }
				and:{~transformationArray[~indexNormalized.asInteger] == "Repetition" or:
					{ ~transformationArray[~indexNormalized.asInteger] == "TemporalVariation" }
				}
			){

				//"RT not nil".postln;
				//~selectedValue = ~motifPitchesArray[~counter.mod(~motifTotalCells.asInteger)];
				//~totalMelodyPitches[index] = ~selectedValue;
				//~recentValues = (~recentValues.add(~selectedValue));
				//(index).mod(~motifTotalIndexes.asInteger + 1); //indice da 0 a n motif inclusi nil!
				//~indicemotifPitchesArrayDaPrintare = (index).mod(~motifTotalIndexes.asInteger + 1);
				//"posti da printare da motif in melody:".postln;
				//~indicemotifPitchesArrayDaPrintare.postln;
				//"motif pitches array:".postln;
				//~motifPitchesArray.postln;



				//Prendo il primo pitch del motif filtrato e ruoto di uno orario
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
				if(
					value.notNil
					and: { value > 0 }
					and:{~transformationArray[~indexNormalized.asInteger] == "Retrogradation"}
				){

					//Ruoto di uno antiorario dal motif filtrato e prendo il primo
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
				val.notNil and: { val >= 0 }
			};
			//"FILTERED MOTIF PITCHES ARRAY".postln;
			//~filteredMotifPitchesArray.postln;


		};



	};

 "TOTAL MELODY PITCHES".postln;
 ~totalMelodyPitches.postln;

};
