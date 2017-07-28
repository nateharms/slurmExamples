# An example script that simply prints the log file numebr to the combined log file

import sys
import logging
FORMAT = "%(filename)s:%(lineno)d %(funcName)s %(levelname)s %(message)s"
logging.basicConfig(format=FORMAT, level=logging.INFO)

if len(sys.argv)>1:
    i = int(sys.argv[-1])
elif os.getenv('SLURM_ARRAY_TASK_ID'):
    i = int(os.getenv('SLURM_ARRAY_TASK_ID'))
elif os.getenv('LSB_JOBINDEX'):
    i = int(os.getenv('LSB_JOBINDEX'))
else:
    #raise Exception("Specify a TS number!")
    logging.warning("Number not specified as script argument or via environment variable, so using default")
    i = 1
logging.info("RUNNING WITH JOB NUMBER i = {}".format(i))

logging.info("This is the {}th log file".format(i))
