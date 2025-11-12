# sorting task
sort the import of the given python file(s)

sorting rules:
    1. group external `from` imports by package (monai, sklearn, torch, etc.)
    2. combine singular `import` statements into one line: `import torch, os, logging`
    3. group internal `from src.` imports together at the end
    4. separate groups with blank lines
    5. within each group, sort alphabetically by module path

example:
```python
from monai.inferers.inferer import SlidingWindowInferer
from monai.losses.adversarial_loss import PatchAdversarialLoss

from sklearn.model_selection import train_test_split

from torch.nn import L1Loss
from torch.optim import lr_scheduler
from torch.utils.data import DataLoader

import os, logging, torch

from src.models.stage_01 import autoencoder
from src.utils.device import get_device
from src.utils.loss_funcs import KL_loss
```