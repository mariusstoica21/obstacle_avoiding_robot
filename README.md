<p align="left">
  <img 
    src="https://i.postimg.cc/ZYNSV6Ym/Component-45-1.png"
  >
</p>

# Robot - Arduino C, Flutter and Firebase

The obstacle avoiding robot controlled by a mobile app represents an IoT system. The purpose of the project is to move the robot to a given target,
to avoid difficult types of obstacles and calculate the distance to the nearest object.

The robot can be moved forward, backward, left, right. The mobile app is used to control the movement of the robot. It also displays the distance to the 
nearest object. The mobile app allows to set the angle of the servomotor on top of which the ultrasonic sensor is set. The app also allows to set the speed
of the robot, using different gears, from one to five.

The mobile app is implemented using Flutter. The moves (up, down, left, right), the angle and the speed are send from the app to the Firebase database. Data
from the Firebase database is read by the Arduino C app. Using the data read from the Firebase database, the robot is moved in the given direction, the angle of 
the servomotor is set, and the speed of the motors is also set. The Arduino C program sends, once a second, the distance to the Firebase database. The mobile app
reads the distance from the Firebase database and it displays on the GUI of the mobile app.
