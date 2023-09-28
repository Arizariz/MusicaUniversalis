

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





