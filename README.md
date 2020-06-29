docker build -t thomaslemezo/invariant-lib .
docker run -it thomaslemezo/invariant-lib /bin/bash

/opt/python/cp37-cp37m/bin/python -m pip install twine
/opt/python/cp37-cp37m/bin/python -m twine upload wheelhouse/* -u ThomasLeMezo

git clone https://github.com/ThomasLeMezo/invariant-lib.git /io
cd /io
git submodule update --init


# Debug

/opt/python/cp36-cp36m/bin/python -m pip uninstall pyinvariant -y
bash scripts/docker/build_pybinding.sh

gdb /opt/python/cp36-cp36m/bin/python

# test.py




import os
import signal

PID = os.getpid()

def do_nothing(*args):
    pass
    
def foo():
    from pyinvariant import *
	space = IntervalVector([[-3, 3],[-3,3]])
	f = Function("x[2]", "(x[0],x[1])")
	print(f.eval(space))
	dyn = DynamicsFunction(f, FWD)
	print(dyn.eval(space))

signal.signal(signal.SIGUSR1, do_nothing)

foo()