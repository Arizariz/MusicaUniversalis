using UnityEngine;

// This script arranges the object in a circular path based on given parameters.
public class ObjectCircleArrange : MonoBehaviour
{
    private Transform _transform;
    public float angle = 0;    // Angle in the circular path.
    public float radius = 0;   // Radius of the circular path.
    public float multiplier = 1;  // Multiplier to affect the rate of movement along the path.
    public float offx = 0;     // Offset for x position.
    public float offy = 0;     // Offset for y position.
    public float offz = 0;     // Offset for z position.

    void Start()
    {
		// Getting the current planet GameObject
        _transform = GetComponent<Transform>();
    }

    void Update()
    {
        // Calculate the position on the circular path.
        _transform.position = new Vector3((radius * Mathf.Cos(multiplier * angle)) + offx, offy, (radius * Mathf.Sin(multiplier * angle)) + offz);
    }
}

