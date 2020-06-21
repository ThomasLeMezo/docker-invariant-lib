docker build -t thomaslemezo/invariant-lib .
docker run -it thomaslemezo/invariant-lib /bin/bash

/opt/python/cp37-cp37m/bin/python -m pip install twine
/opt/python/cp37-cp37m/bin/python -m twine upload wheelhouse/* -u ThomasLeMezo
