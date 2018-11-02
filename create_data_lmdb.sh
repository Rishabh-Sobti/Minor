# -------------------------------------------------------------------
# Create the LMDB for the data instances
# Both train and validation lmdbs can be created using this 
# The file is adapted from BVLC Caffe, and requires Caffe tools
# -------------------------------------------------------------------

# +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
# Please set the appropriate paths
EXAMPLE= C:/Users/hp/Documents/GitHub/Minor/      			# Path where the output LMDB is stored
DATA=C:/Users/hp/Documents/GitHub/Minor/       			# Path where the data.txt file is present 
TOOLS=C:/Users/hp/caffe/build/install/bin/   			# Caffe dependency to access the convert_imageset utility 
DATA_ROOT=C:/Users/hp/Documents/GitHub/Minor/		# Path prefix for each entry in data.txt
# +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+

# ----------------------------
# Checks for DATA_ROOT Path
if [ ! -d "$DATA_ROOT" ]; then
  echo "Error: DATA_ROOT is not a path to a directory: $DATA_ROOT"
  echo "Set the DATA_ROOT variable to the path where the data instances are stored."
  sleep 10s
  exit 1
fi

# ------------------------------
# Creating LMDB
 echo "Creating data lmdb..."
 GLOG_logtostderr=1 $TOOLS/convert_imageset \
    $DATA_ROOT \
    $DATA/data.txt \
    $EXAMPLE/data_lmdb
sleep 10s
# ------------------------------
echo "Done."


sleep 10s
