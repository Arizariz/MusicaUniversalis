using UnityEngine;
using UnityEngine.Events;

// This script listens for the currently playing chord and invokes the appropriate UnityEvent.
public class CurrentChordListener : MonoBehaviour
{
    public string chord;         // The specific chord that this object is listening for.
    public UnityEvent chordSelected;   // Event to be invoked when the specified chord is detected.
    public UnityEvent chordUnselected; // Event to be invoked when a different chord is detected.

    void currentChord(string current_chord)
    {  
        // If the current chord matches the chord that this object is listening for:
        if(chord == current_chord)
        {
            chordSelected.Invoke();  // Trigger the selected event (activate outline on current planet)
        }
        else
        {
            chordUnselected.Invoke(); // Trigger the unselected event. (deactivate outline on current planet)
        }
    }
}


