# Godot-orbit-camera
 A simple orbit camera rig for an orbiting 3rd person view with zoom functionality and clipping (not going through objects) using the built in SpringArm node.

 A basic kinematic character controller that utilizes the camera rig is also included.
 
## Usage
Add the CameraRig scene to the scene that the object you want to orbit is in, then set the target of the camera rig.
The camera rig will automatically follow the target independantly. The rig itself has it's transform set as top level so it will not be
affected by any parent transforms.

By default, the mouse wheel is used to zoom in and out. This is hard coded at the moment but can also easliy be changed to use input actions.

### Adjusting the camera rig

__Note:__ The camera can only avoid objects that have collision!

For adjusting the camera rig and how it behaves around objects: 
- Adjust the size of the sphere and spring arm margins to tune how the camera clips around objects. Make sure that the objects you want
to clip around are on the same layer as the mask of the SpringArm.
- Adjust the __Zoom Y Step__ and __Cam Y Offset__ to change how much the camera is adjusted up and down when zooming in.

