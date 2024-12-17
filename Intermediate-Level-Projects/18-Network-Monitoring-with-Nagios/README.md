# Network Monitoring with Nagios

## Overview

In this project, you will learn how to set up network monitoring using Nagios. This project is designed for intermediate-level DevOps engineers who want to gain hands-on experience with network monitoring and alerting.

## Prerequisites

- Basic knowledge of Nagios
- Nagios installed on your machine or server
- Access to the network devices you want to monitor

## Project Structure

- `nagios.cfg`: This file contains the main Nagios configuration.
- `objects/`: This directory contains the object configuration files.
- `README.md`: This file provides detailed instructions and explanations for the project.

## Getting Started

1. Clone the repository to your local machine:
   ```bash
   git clone https://github.com/zpratikpathak/Awesome-25-DevOps-Project.git
   cd Awesome-25-DevOps-Project/Intermediate-Level-Projects/18-Network-Monitoring-with-Nagios
   ```

2. Create a `nagios.cfg` file in the project directory and open it in your text editor.

## Example Nagios Configuration

### 1. Basic Nagios Configuration

This configuration sets up basic monitoring for a network device.

```cfg
define host {
    use             linux-server
    host_name       example-host
    alias           Example Host
    address         192.168.1.1
}

define service {
    use                     generic-service
    host_name               example-host
    service_description     PING
    check_command           check_ping!100.0,20%!500.0,60%
}
```

### 2. Advanced Nagios Configuration

This configuration sets up monitoring for multiple services on a network device.

```cfg
define host {
    use             linux-server
    host_name       example-host
    alias           Example Host
    address         192.168.1.1
}

define service {
    use                     generic-service
    host_name               example-host
    service_description     PING
    check_command           check_ping!100.0,20%!500.0,60%
}

define service {
    use                     generic-service
    host_name               example-host
    service_description     HTTP
    check_command           check_http
}

define service {
    use                     generic-service
    host_name               example-host
    service_description     SSH
    check_command           check_ssh
}
```

## Conclusion

By completing this project, you will have gained a solid understanding of how to set up network monitoring using Nagios. Feel free to modify the example configurations and create your own Nagios configurations to further enhance your skills.
