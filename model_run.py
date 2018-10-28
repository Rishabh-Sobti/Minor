import caffe

caffe.set_mode_cpu()

import numpy as np
import tempfile
model_root = './model/'
import os
weights = os.path.join(model_root, 'VGG_CNN_S.caffemodel')
assert os.path.exists(weights)
solver = caffe.get_solver(model_root+'solver.prototxt')
solver.net.copy_from(weights)
niter = 200000
solver.step(niter)
weight_dir = tempfile.mkdtemp()
filename = 'weights.mymodel.caffemodel'
dirs = os.path.join(weight_dir, filename)
solver.net.save(dirs)
del solver
