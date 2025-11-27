install Robot Framework on mamba
```
mamba create -n robot-24-11 python=3.10
conda activate robot-24-11
mamba install -c conda-forge robotframework robotframework-seleniumlibrary
```

หรือจะ pip ก็ได้แค่
```
pip install robotframework
pip install robotframework-seleniumlibrary
```

ไว้จัด format robot framework
```commandline
mamba install -c conda-forge robotframework-tidy
robotidy sck-practice.robot
```

ต้องลง driver browser ด้วยเพื่อให้รันได้


้how to run robot
```
robot file.robot
```
