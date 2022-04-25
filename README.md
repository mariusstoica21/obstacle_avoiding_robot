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

📁 Arduino_files : program in Arduino that reads data from the Firebase database and controls the robot according to the information stored in database.
    
📄 [calculator.asm](https://github.com/mariusstoica21/calculator_asmx86/blob/master/calculator.asm)
: assembly_x86 file.

## Additional resources

➕ NodeMCU

➕ Servomotor

➕ Ultrasonic sensor

➕ HBridge

➕ Rotary encoder

➕ Encoder motor

➕ Wheels

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


<p align="center">
  <img 
    src="https://i.postimg.cc/XvRcC0m6/3.jpg"
  >
</p>

<p align="center">
  <img 
    src="https://i.postimg.cc/TPN27dGB/4.jpg"
  >
</p>

<p align="center">
  <img 
    src="https://i.postimg.cc/WzKtz05N/1.png"
  >
</p>

<p align="center">
  <img 
    src="https://i.postimg.cc/MZjhcyPh/5.jpg"
  >
</p>

<p align="center">
  <img 
    src="https://i.postimg.cc/W1FjshFn/Component-47-1.png"
  >
</p>

<p align="center">
  <img 
    src="https://i.postimg.cc/X7mNGT54/Component-48-1.png"
  >
</p>




