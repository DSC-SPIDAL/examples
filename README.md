# SPIDAL Examples
This repository contains code, data, and scripts to setup and run some of the SPIDAL algorithms such as DA-MDS and DA-PWC in a cluster of nodes.

It could also be used to setup SPIDAL in a cloud environment such on Amazon EC2 or an OpenStack based cloud.

## Prerequisites
1. A set of nodes with password-less SSH access between them
2. Ubuntu - 16.04 or 14.04 is preferred

## Installation
1. SSH to the first node of your node allocation
2. One time setup (~20-25 min)
    * Create a text file listing node IPs. Let’s call this nodes.txt
    * Execute the following commands
      
      ```
      wget https://raw.githubusercontent.com/esaliya/xsede-demo-2016/master/scripts/bootstrap.sh 
      
      chmod +x bootstrap.sh
      
      ./bootstrap.sh nodes.txt
      
      source ~/.bashrc
      ```

