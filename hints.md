🔥 **HINT 1** - 20:30 - Rotary encoder details

🔥 **HINT 2:** - 21:15 - Send data
**Equipment dashboard **will allow you to validate that you are sending the 2 minimal data properly to the Cloud: `machinespeed`, `totaloutputunitcount` 

**Energy Consumption **will allow you to validate that you are sending one of the optionnal energy related value: `totalworkingenergy` 

**Performance Live **will allow you to validate that you are sending some of the optionnal machine related event: `startProducing`, `stopProducing`, `newJob`, `stopJob`

🔥 **HINT 3:** - 21:15 - Energy Sensor INA219: https://miliohm.com/how-to-use-ina219-current-sensor-with-arduino-and-make-diy-wattmeter-with-it/

🔥 **HINT 4 MachineEvent extra specifications:** - 22:15
You should respect the API specification for the format in those images.
![Job event](https://github.com/user-attachments/assets/a48a45c2-026f-4985-b6ee-d55a8ee6931a)
![Production event](https://github.com/user-attachments/assets/65dcc8e2-09b4-453d-af77-ec9ce4e56127)

:construction: Also any production that is less than 3 minutes will be considered a `micro-stop` and therefore not visible in the Live Performance page. :eyes: 


---

**Other stuff to do**
Lots of teams choose to do an HMI or Mobile App, keep in mind that the main value of it would be to be able to control the machine and maybe have some extra dashboard that we don't have in the cloud.

Also, remember, that the best order of achievement is:
- Build machine
- Collect at least machinespeed, totaloutputunitcount, and totalworkingenergy
- Send those to the Azure IoT Hub of Bobst Connect
- Send machineEvent that are coherent
- Create an HMI / or anything alike that allow you to control the machine and maybe get extra insight for an operator of the machine like a notification in case of failure, sound in your computer?, ... think outside of what we provided...
- Create coherent scenario of production? A job can last x minutes or hours or days and have different sequence of production
- ....
