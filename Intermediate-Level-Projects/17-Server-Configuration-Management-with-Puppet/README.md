# Server Configuration Management with Puppet

## Overview

In this project, you will learn how to manage server configurations using Puppet. This project is designed for intermediate-level DevOps engineers who want to gain hands-on experience with configuration management and automation.

## Prerequisites

- Basic knowledge of Puppet
- Puppet installed on your machine
- Access to a server or virtual machine

## Project Structure

- `manifests/`: This directory contains the Puppet manifests.
- `README.md`: This file provides detailed instructions and explanations for the project.

## Getting Started

1. Clone the repository to your local machine:
   ```bash
   git clone https://github.com/zpratikpathak/Awesome-25-DevOps-Project.git
   cd Awesome-25-DevOps-Project/Intermediate-Level-Projects/17-Server-Configuration-Management-with-Puppet
   ```

2. Create a `manifests/` directory in the project directory and open it in your text editor.

## Example Puppet Manifests

### 1. Basic Puppet Manifest

This manifest installs and configures the Nginx web server.

```puppet
node default {
  package { 'nginx':
    ensure => installed,
  }

  service { 'nginx':
    ensure     => running,
    enable     => true,
    require    => Package['nginx'],
  }

  file { '/etc/nginx/nginx.conf':
    ensure  => file,
    content => template('nginx/nginx.conf.erb'),
    require => Package['nginx'],
    notify  => Service['nginx'],
  }
}
```

### 2. User Management Manifest

This manifest creates a user and sets up their home directory.

```puppet
user { 'devops':
  ensure     => present,
  managehome => true,
  home       => '/home/devops',
  shell      => '/bin/bash',
}

file { '/home/devops/.bashrc':
  ensure  => file,
  content => template('users/bashrc.erb'),
  owner   => 'devops',
  group   => 'devops',
  mode    => '0644',
  require => User['devops'],
}
```

## Conclusion

By completing this project, you will have gained a solid understanding of how to manage server configurations using Puppet. Feel free to modify the example manifests and create your own Puppet manifests to further enhance your skills.
