# SPIDAL Examples
This repository contains code, data, and scripts to setup and run some of the SPIDAL algorithms such as DA-MDS and DA-PWC in a cluster of nodes.

It could also be used to setup SPIDAL in a cloud environment such on Amazon EC2 or an OpenStack based cloud.

## Prerequisites
1. A set of nodes with password-less SSH access between them.
2. Ubuntu - 16.04 or 14.04 is preferred.

Also, this assumes root privileges to setup some of the libraries assuming the nodes are build from scratch. If this is not desired, plese have the following packages installed prior to setting up these examples.

* unzip
* pdsh
* build-essential

## Installation
1. SSH to the first node of your node allocation.
2. One time setup (~20-25 min).
    * Create a text file listing node IPs. Let's call this `nodes.txt`.
    * Download the `bootstrap.sh`.
    * 
      ```
      wget https://raw.githubusercontent.com/DSC-SPIDAL/examples/master/scripts/bootstrap.sh 
      ```
      
        * Note, if `root` privileges are not available, comment out the following two lines from the `bootstrap.sh`.
            ```
            sudo sed -i "1i 127.0.0.1 $HOSTNAME" /etc/hosts
            sudo bash -c 'echo ssh > /etc/pdsh/rcmd_default'
            ```
    * Execute the following commands.
    
      ```
      chmod +x bootstrap.sh
      ./bootstrap.sh nodes.txt
      source ~/.bashrc
      ```
      
## Running the Examples

### DA-MDS
DA-MDS is a highly optimized Multidimensional Scaling (MDS) algorithm designed to run on large HPC clusters. See following resoruces for more details.

* [DA-MDS](https://github.com/DSC-SPIDAL/damds) project repository.
* [SPIDAL Java](https://www.researchgate.net/publication/291695433_SPIDAL_Java_High_Performance_Data_Analytics_with_Java_and_MPI_on_Large_Multicore_HPC_Clusters) paper on optimizations.

The data used in this example.

* 5000 Nucleotide sequences
    * Distance between sequences were computed using parallel Smith-Waterman
* Grouped into 4 clusters (colors in the output)
    * Used [DA-PWC](https://github.com/DSC-SPIDAL/dapwc) to perform clustering 
* See example results [here](https://spidal-gw.dsc.soic.indiana.edu/public/resultsets/1209626779)


The following command will start the DA-MDS example

```
$HOME/spidal-examples/examples/damds/mmap.run.all.sh nodes.txt 2
```

Argument tot he program pare,
* `nodes.txt` -- the text file containing the node IPs. Note. password-less SSH should be enabled.
* 2 -- The number of nodes in the nodes.txt.

The output will be a .pviz in the `$HOME` directory. Upload the output to SPIDAL's [WebPviz](https://spidal-gw.dsc.soic.indiana.edu/) to see the 3D points.




