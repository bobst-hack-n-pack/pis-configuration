import json
import datetime
import time
import random
from azure.iot.device import IoTHubDeviceClient, Message

# Replace with your IoT Hub device connection string
CONNECTION_STRING = "CONNECTIONSTRING-HERE"

def send_telemetry():
    # Create an instance of the IoTHubDeviceClient
    client = IoTHubDeviceClient.create_from_connection_string(CONNECTION_STRING)
    
    total_output_unit_count = 140
    total_working_energy = 0.0  # Simulate total energy consumption

    try:
        while True:
            # Simulate machine speed (1 to 5 boxes per 10 seconds)
            # machine_speed = random.randint(1, 5)
            machine_speed = 5
            
            # Simulate machine speed change every 30 boxes
            if total_output_unit_count % 30 == 0:
                machine_speed = random.randint(1, 5)
            
            total_output_unit_count += machine_speed
            energy_used = machine_speed * 0.05  # Example: 0.05 kWh per box
            total_working_energy += energy_used

            # Create telemetry data with the current UTC timestamp
            telemetry_data = {
                "telemetry": {
                    "timestamp": datetime.datetime.now(datetime.timezone.utc).isoformat(),
                    "datasource": "172.17.2.1:80",
                    "machineid": "lauzhack-pi12",
                    "machinespeed": machine_speed,
                    "totaloutputunitcount": total_output_unit_count,
                    "totalworkingenergy": total_working_energy
                }
            }

            # Convert the telemetry data to JSON format
            telemetry_json = json.dumps(telemetry_data)

            # Create an IoT Hub Message from the JSON telemetry data
            message = Message(telemetry_json)
            message.content_type = "application/json"
            message.content_encoding = "utf-8"
            message.custom_properties["messageType"] = "Telemetry"

            # Send the message to Azure IoT Hub
            print("Sending message: {}".format(telemetry_json))
            client.send_message(message)
            print("Message successfully sent!")

            # Wait for 10 seconds before sending the next message
            time.sleep(1)
    except Exception as e:
        print("Error sending message: {}".format(e))
    finally:
        # Ensure to close the client after sending
        client.shutdown()

if __name__ == "__main__":
    send_telemetry()
