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

## Summary
✅ G.U.I. 

❌ Ease of installation

✅ Additional hardware needed

✅ Video available

❌ Documentation

## Project description

### Folder structure

📁 Flutter_files : contains the Flutter project (it can be imported).

- 📄 [UPrincP.pas](https://github.com/mariusstoica21/calculator_asmx86/blob/master/Delphi_files/UPrincP.pas): main form of the app.

📁 Arduino_files : contains the Arduino project.
    
📄 [Robot.ino](https://github.com/mariusstoica21/obstacle_avoiding_robot/blob/main/Arduino_files/Robot.ino) : 
program in Arduino that reads data from the Firebase database and controls the robot according to the information stored in database.

## Additional resources

➕ NodeMCU

➕ Servomotor

➕ Ultrasonic sensor

➕ HBridge

➕ Rotary encoder

➕ Encoder motor

## Installation

- Install the App Bundle Installer.
- Download the bundle file .aab.
- Install the mobile app using App Bundle Installer by following the steps described in the app.
- Run Robot.ino program in Arduino IDE on the NodeMCU board.
  - Select board.
  - Select PORT.
  - Connect NodeMCU board to the corresponding PORT using the cable.
- Use the mobile app to move the robot, to set the angle of the servomotor and the speed of the motors.

## Tutorial

### Project flow



In order to display the distance in the mobile app, the Arduino app send the value read using the ultrasonic sensor, once a second. The value is send to Firebase,
and then again send to the mobile app, where it will be showed.

<p align="center">
  <img 
    src="https://i.postimg.cc/XvRcC0m6/3.jpg"
  >
</p>

In order to set the direction of movement, the user will press on one of the buttons of the controller in the mobile app. After the button is pressed, the value
of the movement direction, as a string, will be send from the mobile app to the Firebase. The Arduino app reads once a second the direction from Firebase, and acts
the motors accordingly.

<p align="center">
  <img 
    src="https://i.postimg.cc/TPN27dGB/4.jpg"
  >
</p>

### Firebase database

The information in the database can be read and written, depending on the rules set.

The database is updated by two entities:
- the mobile app sends the angle of the servomotor, the speed of the motor and the direction.
- the Arduino app send the distance to the nearest object.


<p align="center">
  <img 
    src="https://i.postimg.cc/SNJT1PvX/10.png"
  >
</p>

### Serial Monitor Arduino

The serial monitor prints the fact that the NodeMCU board is connected on the Internet Network ("Connected: 192.168.1.7"). It also prints the direction read from
the database, ("Direction: stop"), the value of the servomotor angle ("Servo value : 79"), the speed gear of the motors ("Speed value : 5"). It also displays the
distance measured by the ultrasonic sensor till the nearest object, in centimeters ("Distance: 38").

<p align="center">
  <img 
    src="https://i.postimg.cc/WzKtz05N/1.png"
  >
</p>

<!-- <p align="center">
  <img 
    src="https://i.postimg.cc/MZjhcyPh/5.jpg"
  >
</p> -->

### Obstacle avoiding robot

The robot contains a plastic board on top of which the components are set. The board contains the following components:
- NodeMCU board.
- HBridge.
- Encoder motors.
- Sonar sensor.
- Servomotor.
- Breadboard.
- 9V Battery.

<p align="center">
  <img 
    src="https://i.postimg.cc/W1FjshFn/Component-47-1.png"
  >
</p>

### Mobile app

In the left image, the app is run on the Nexus 6 Emulator using Android Studio. In the right image, the mobile app was installed on the mobile phone, using the 
steps described at the Installation topic above.

<p align="center">
  <img 
    src="https://i.postimg.cc/vZ8Rmhqb/Component-49-1.png"
  >
</p>







