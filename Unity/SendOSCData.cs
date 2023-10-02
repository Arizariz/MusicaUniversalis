using UnityEngine;

// This script is responsible for sending Open Sound Control (OSC) messages with tonic color data.
public class SendOSCData : MonoBehaviour
{
    public OSC osc;  // OSC communication handler.
    public string oscAddress = "";   // OSC address to send the message to.

    // Sends the chord information as an OSC message.
    public void sendChord(string tonicColor)
    {
        BroadcastMessage("currentChord", tonicColor);  // Notify other planets of the current chord.
        Debug.Log(tonicColor);  // For debugging purposes.

        //Prepare OSC message
		OscMessage message = new OscMessage();
        message.address = oscAddress;
        message.values.Add(tonicColor);
        osc.Send(message);  // Send the OSC message to supercollider server with the tonic color data.
    }
}

