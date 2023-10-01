# Musica Universalis 

## Abstract

Inspired by the "Musica Universalis" or the "music of the spheres", our project seeks to merge the realms of Interactive Art, Music and Philosophy. This ancient belief views the universe as an intricate symphony, governed by harmonious mathematical laws. Since these cosmic tunes are believed to be beyond human hearing, they challenge composers to emulate this celestial dance through their own musical pieces. Within this metaphysical and philosophical concept, our project has evolved significantly from its prototype. Rather than deterministic sequences, music is now generated stochastically using absorbing Markov chains. Visually, we've transformed our portrayal. We've introduced two representations: a captivating 2D visualization and an immersive journey through the universe in Virtual Reality (6DOF), aiming to bring the listener into a trascendent and impactful experience in the realm of musical harmony. Additionally to this artistic purpose, the latter representation explores a new way to learn and practice tonal harmony in an innovative interacting way.

## Framing Musica Universalis within the state-of-the-art literature 

Organizing musical information and developing algorithms for modeling music in general can be a very challenging task from a computational point of view. This is simply because a computer doesn't know what is music. In order to let a machine understand and generate sounds in an organized fashion, we need to teach what do we mean with "music" or "good-sounding" melodic lines. There are many approaches in literature which tackle this problem from different perspectives. One of the main technique used for this purpose, is based on the notion of grammars. Robert M. Keller et al. explain in their research (2007) how probabilistic grammars can be used for the automatic generation of jazz solos and how the learning of such grammars is carried out. In fact, the advantage of a grammar is that it's possible to replicate the style of a particular performer in generating new melodies. First off, an abstraction of the corpus of segments is performed in order to train the model and capture specific peculiarities, such as the _melodic contour_, the _reference scale_ or the _melodic range_. Different note categories are then introduced to support the abstract modelling and a grammar is finally used to instantiate probabilistically these categories to actual melodies. Abstract melodies are encoded in form of _S-expressions_ (which are strings obtained by the combination of different numbers and symbols associated to note categories), and they guarantee a certain degree of freedom when it comes to generating new melodic lines. 
In our opinion, since this approach encodes the role of the note within the melody, it could be considered either very functional or too formal. Another drawback of this approach could be the fact that it expresses leaps in terms of half-tones, while often we tend to use diatonic steps due to our "embedded" notion of diatonic scale (we think in terms of steps, rather than half-tones). For this reason, we decided to opt for the second option in our generative approach. Another major difference lies in the computation of the melodic contour, which is not entirely based on the notion of _slope_ (as performed in the _Impro-Visor_ software* by Keller), rather on the idea of _moving averages_, which lets us perform even more flexible detours during the phase of melody generation. Finally, in order to pick the best fitting scale, mode detection has been implemented which identifies the function of each chord in advance. 
Drawing inspiration from Keller's work, considered as a reference point, we have developed an original rule-based approach based on the stochastic generation of melodies through Markov chains, but implementing the classical harmony and musical counterpoint conventions instead of adhering to Jazz style. As mentioned before, the music will be represented in a spatial Virtual Reality environment, resembling the organization of the _circle of the fifths_.


## Melody Generator
The problem of generating melodic lines that are consistent with a given chord can be tackled from different perspectives. But in general, to generate music, the following parameters have to be defined for each note: _onset time_, _duration_ and _pitch_. We proceed separating the "temporal problem" from the "spatial problem". Since the generation of the pitches varies with respect to their position in time (due to musical constraints about _chords notes_ versus _passing notes_), we decided to first generate the temporal features of each note and then the pitches.
The flowchart in the following picture represents our approach on an high level of abstraction.


As mentioned before, the task of our pattern generator is to analyze a chord given as input and generate a melodic line as output using the best fitting modal scale. 
Let us recall that music, often defined as organized sound*, is characterized by multiple events aimed at stimulating our perception. This process is two-dimensional. In fact, it develops both horizontally (sequentially) and vertically (synchronously). Harmony is the relationship that is established in parallel between several sounds. 
First off, to automatically analyze a chord and generate a good souding melody on top of it, it was necessary to define the input, choosing a set of chords consistent with a reference harmonic syntax (in our case the tonal harmony). Specifically, we decided to use the triads and quadriads obtained from the harmonization of the major scale which are the following: Major, Minor, Major7 (delta), Minor7, Dominant, Half-diminished (the approach could certainly be generalized to any type of chord). 


Once we defined the input chords, the flowchart representing our approach on a lower level of abstraction can be conceptualized as follows:


The Musica_Universalis.scd file describes internally the process whole step by step. Each part of the code is deeply commented, explaining the approach in detail at its own core.

## Virtual Reality Environment and Representation



## To run this project


## Other material

 
