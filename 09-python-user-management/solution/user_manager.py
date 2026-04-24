import os
import subprocess
import sys

def create_user(username):
    try:
        # Check if user already exists
        subprocess.run(['id', username], check=True, stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL)
        print(f"User {username} already exists.")
    except subprocess.CalledProcessError:
        # Create user
        subprocess.run(['sudo', 'useradd', '-m', username], check=True)
        print(f"User {username} created successfully.")

def main():
    if not os.path.exists('users.txt'):
        print("Error: users.txt not found.")
        sys.exit(1)
        
    with open('users.txt', 'r') as f:
        users = [line.strip() for line in f if line.strip()]
        
    for user in users:
        create_user(user)

if __name__ == "__main__":
    main()
