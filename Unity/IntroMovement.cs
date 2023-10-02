using System.Collections;
using UnityEngine;

// This script is responsible for the initial movement of the camera and canvas when the user starts the VR experience.
public class IntroMovement : MonoBehaviour
{
    public GameObject cam;          // The main camera or VR headset camera.
    public GameObject canvas;       // Canvas for UI or introductory screen (MUSICA UNIVERSALIS intro text)
    public AudioSource clipSelected;  // Audio for when an item or planet is selected.
    public AudioSource clipSpaceship; // Spaceship audio, probably for ambient spaceship sounds.
    public AudioSource clipBackground; // Background music or ambient sound.

    // This function is called when the scene starts.
    void Start()
    {
        clipBackground.Play();  // Start playing the background sound.
    }

    // This function is called every frame.
    void Update()
    {
    }

    // This function is invoked when the "Play" button or similar action is pressed.
    public void onPlayPressed()
    {
        clipSelected.Play();   // Play the selected sound.
        clipSpaceship.Play();  // Play the spaceship sound.

        // Move and rotate the camera to a specified position using LeanTween for smooth transition.
        LeanTween.move(cam, new Vector3(0, 0, 0), 15).setEaseInOutCubic();
        LeanTween.rotate(cam, new Vector3(0, 95, 0), 4).setEaseInOutCubic();

        // Scale down the canvas to 0 (essentially hiding it) over a duration of 15 seconds.
        LeanTween.scale(canvas, new Vector3(0, 0, 0), 15).setEaseInOutCubic();
    }
}

