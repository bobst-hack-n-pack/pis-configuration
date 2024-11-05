import socket
import psutil
import time
import subprocess

HOST = "0.0.0.0"  # Listen on all interfaces
PORT = 5001  # Port for communication

def get_status():
    cpu_percent = psutil.cpu_percent()
    mem_percent = psutil.virtual_memory().percent
    return f"CPU: {cpu_percent}%, Memory: {mem_percent}%"

def start_server():
    with socket.socket(socket.AF_INET, socket.SOCK_STREAM) as s:
        s.bind((HOST, PORT))
        s.listen()
        while True:
            conn, addr = s.accept()
            with conn:
                print(f"Connected by {addr}")
                while True:
                    data = conn.recv(1024)
                    if not data:
                        break
                    if data == b"status":
                        status = get_status()
                        conn.sendall(status.encode())

if __name__ == "__main__":
    while True:
        try:
            start_server()
        except Exception as e:
            print(f"Error: {e}")
            time.sleep(5)  # Wait before restarting
