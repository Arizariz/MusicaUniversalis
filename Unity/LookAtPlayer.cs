using UnityEngine;

// This script makes the object constantly face the player with some offset values.
public class LookAtPlayer : MonoBehaviour
{
    public GameObject player;   // Reference to the player or VR headset.
    public float offx = 0.0f;   // Offset value for x rotation.
    public float offy = 0.0f;   // Offset value for y rotation.
    public float offz = 0.0f;   // Offset value for z rotation.

    void Update()
    {
        // Calculate the rotation needed to look at the player.
        Quaternion q = Quaternion.LookRotation(transform.position - player.transform.position);

        // Apply the offset values.
        q.x += offx;
        q.y += offy;
        q.z += offz;
        
        transform.rotation = q;  // Set the rotation of the object.
    }
}

