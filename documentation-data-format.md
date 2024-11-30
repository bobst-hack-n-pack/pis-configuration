:wave: **Hey everyone, here’s an example of the data format to send to Azure IoT Hub!**

### **Mandatory Data:**

- **Telemetry Data**:
    - `timestamp`: (e.g., current UTC time)
    - `datasource`: Put the IP of your RPi and port 80 (e.g., `"172.17.2.1:80"`)
    - `machineid`: `"jadevmachina"`
    - `totaloutputunitcount`: (e.g., `140`)
    - `machinespeed`: (e.g., `5`)
    - `machinestate`: (e.g., `1`)

- **machinestate** (to track the state of the machine)
    - Only acceptable states are:
        - `PowerOn = 0`
        - `Running = 2`
        - `Producing = 3`
        - `PowerOff = 4`

### **Optional other Data:**

Example of machineEvent:
```json
{
	"datasource": "172.17.6.1:85",
	"equipmentId": "jadevmachine",
	"jobId": "3700",
	"timestamp": "2024-11-30T16:17:43.0000000Z",
	"totalRunningTime": 44520589,
	"totalMachineTime": 44520589,
	"type": "startRunning"
}
```

### **Code Example**:

```python
def send_telemetry():
    telemetry_data = {
        "telemetry": {
            "timestamp": datetime.datetime.utcnow().isoformat() + "Z",
            "datasource": "172.17.2.1:80",
            "machineid": "jadevmachina",
            "totaloutputunitcount": 140,
            "machineSpeed": 5,
        }
    }
    telemetry_json = json.dumps(telemetry_data)
    message = Message(telemetry_json)
    message.content_type = "application/json"
    message.content_encoding = "utf-8"
    message.custom_properties["messageType"] = "Telemetry"
    # Sending logic omitted for brevity

async def send_machine_event(self, event_type, job_id, total_output_unit_count, machine_speed):
    message = {
        "type": event_type,
        "equipmentId": self.machine_id,
        "jobId": job_id,
        "totalOutputUnitCount": total_output_unit_count,
        "machineSpeed": machine_speed,
        "timestamp": datetime.datetime.utcnow().strftime("%Y-%m-%dT%H:%M:%S.%fZ"),
    }
    await self.__send_message([message], "MachineEvent")
```

:rocket: **Let's keep the data consistent so everything flows smoothly into the IoT Hub!** If you need help or have questions about the format, just reach out! :blush:
