#!/bin/bash
yum update -q -e 0 -y 2&> /dev/null && \
   yum install -q -e 0 -y  --setopt=tsflags='' epel-release centos-release-scl-rh python-setuptools 1>&2  && \
   yum install -q -e 0 -y  --setopt=tsflags='' $@ 1>&2
easy_install jinja2 1>&2

cat >> env.py <<EOF
import os, subprocess as sp, json, sys
from jinja2 import Template
args = ' '.join(sys.argv[1:])
source = 'source scl_source enable ' + args
dump = '/usr/bin/python -c "import os, json;print(json.dumps(dict(os.environ)))"'
pipe = sp.Popen(['/bin/bash', '-c', '%s && %s' %(source,dump)], stdout=sp.PIPE)
env = json.loads(pipe.stdout.read())
loaded_env = {}
for key, var in env.items():
    for product in sys.argv[1:]:
        if product in var:
            loaded_env[key] = var
template_data = open("Dockerfile.template", "r").read()
template = Template(template_data)
print(template.render(env=loaded_env, deps=sys.argv[1:]))
EOF

python env.py $@
rm env.py
