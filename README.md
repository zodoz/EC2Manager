# EC2Manager

This project is to create an EC2 instance manager for AWS. The intended use case is for a work environment where mutliple teams of developers share a common pool of EC2 instances. The core features of this project are:

1. Determine which EC2 instances are not reserved by anyone or any group
2. Reassign that EC2 to your group
3. Specify which EC2 instances you require to be available for you
4. Specify the start and stop time for when you work
5. EC2 instances will automatically start and stop depending on who wants to use it and when he/she wishes it to be available.

# Warning!!!

This project is intended **not** designed for security. It is intended to be hosted within a VPN, Firewall, or on a personal computer where it should be safe from any nefarious users since all 3rd party credentials are stored in an unencrypted form! You have been warned!!!

# Usage

This is currently a development version and is not intended for production use.

## Installation

### Prereqs

* Node
* Npm
* Bower
* Coffeescript
* MongoDB

To setup the environment, first create config.coffee from config.example.coffee and apply any modifcations necessary, then run the following commands

    npm install
    bower install
    grunt dist main

To start the server and develop, simply run

    grunt

This will start the server on the port configured in config.coffee. Livereload is used and will run when changing any client facing code (styles, scripts, and jade). To apply server side changes, use the "rs" command in the terminal running grunt.

# License

MIT
