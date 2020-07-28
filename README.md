docker build -t thomaslemezo/invariant-lib .
docker run -it thomaslemezo/invariant-lib /bin/bash

docker run --net=host --env="DISPLAY" --volume="$HOME/.Xauthority:/root/.Xauthority:rw" --cap-add=SYS_PTRACE --security-opt seccomp=unconfined -it thomaslemezo/invariant-lib:debug /bin/bash 


/opt/python/cp37-cp37m/bin/python -m pip install twine
/opt/python/cp37-cp37m/bin/python -m twine upload wheelhouse/* -u ThomasLeMezo

git clone https://github.com/ThomasLeMezo/invariant-lib.git /io
cd /io
git submodule update --init


# Debug

```
alias python="/opt/python/cp36-cp36m/bin/python"
bash scripts/docker/debug.sh
export PYTHONPATH="/usr/share/gdb/python/"
gdb -ex r --args /opt/python/cp36-cp36m/bin/python p/io/test.py
```
Dans gdb, option :
```
bt
```

# Debug GUI
/opt/python/cp36-cp36m/bin/python -m pip install --user pipx
/opt/python/cp36-cp36m/bin/python -m userpath append ~/.local/bin
source ~/.bashrc
pipx install gdbgui


# test.py


```
from pyinvariant import *

space = IntervalVector([[-3, 3],[-3,3]])
f = Function("x[2]", "(x[0],x[1])")
print(f.eval_vector(space))
dyn = DynamicsFunction(f, FWD, False)
print(dyn.eval(space))
```

#############

yum install -y centos-release-scl
yum install -y devtoolset-7
scl enable devtoolset-7 bash