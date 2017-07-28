#!/bin/sh
#set a job name
#SBATCH --job-name=modelSubmitScript

#a file for job output, you can check job progress
#SBATCH --output=modelSubmitScript.%a.slurm.log

# a file for errors from the job
#SBATCH --error=modelSubmitScript.%a.slurm.log

#time you think you need; default is one day
# d-hh:mm:ss
#SBATCH --time=0

#number of tasks you are requesting
#SBATCH -N 1
#SBATCH -n 10
##SBATCH --ntasks-per-node=2
##SBATCH --exclusive

#partition to use.
#SBATCH --partition=west

#number of nodes to distribute n tasks across
#SBATCH -N 1

#an array for the job. 
#SBATCH --array=1-5


#####################################################

# the "stdbuf -o0 -e0"  and the "-u" are to disable buffering,
# so that you see output from the script in the log files immediately.

# the 2>&1 creates a comined log file that contains the output log file and the error log file.

stdbuf -o0 -e0 python -u yourScript.py > modelSubmitScript.$SLURM_ARRAY_TASK_ID.combined.log 2>&1