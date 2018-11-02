# -------------------------------------------------------------------
# Create the data mean from LMDB
# The file is adapted from BVLC Caffe, and requires Caffe tools
# Author: Sukrit Shankar 
# -------------------------------------------------------------------

# +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
# Please set the appropriate paths
EXAMPLE=C:/Users/hp/Documents/GitHub/Minor       			# Path where the input LMDB is stored
DATA=C:/Users/hp/Documents/GitHub/Minor      			# Path where the output mean file is stored
TOOLS=C:/Users/hp/caffe/build/install/bin/   	    			# Caffe dependency to access the compute_image_mean utility 
# +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+

# ------------------------------
$TOOLS/compute_image_mean $EXAMPLE/data_lmdb \
  $DATA/data.binaryproto

# ------------------------------
echo "Done."
sleep 10s