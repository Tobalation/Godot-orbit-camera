# Godot-orbit-camera
 Orbit camera rig for an orbiting 3rd person view with zoom functionality and clipping (not going through objects) using the built in ClippedCamera node.
 
## Usage
Add the CameraRig scene to the scene that the object you want to orbit is in, then set the target of the camera rig.
The camera rig will automatically follow the target.

By default, the mouse wheel is used to zoom in and out. Make sure to include the OrbitCamera.gd script in your project.

### Note on the ClippedCamera

The camera can only avoid objects that have collision!
