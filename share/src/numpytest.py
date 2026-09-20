# Suggestion taken from <https://numpy.org/devdocs/numpy_2_0_migration_guide.html>

import numpy as np

myfloat = np.float32(3) + 3.

print("Numpy version:", np.version.version, "myfloat value:", myfloat, "myfloat type:", type(myfloat))
