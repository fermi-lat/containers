#!/bin/bash
tag=$1
user=$2

# product_tag=20-10-04-gr02
# user=bvan

package=GlastRelease
maybe_scons=""

if [[ $package == "GlastRelease" ]] || [[ $package == "ScienceTools" ]] ; then 
    maybe_scons="-scons"
fi

CVS_RSH=ssh cvs -d :ext:${user}@centaurusa.slac.stanford.edu:/nfs/slac/g/glast/ground/cvs \
    co -r ${package}-${tag} \
    -d workspace \
    ${package}${maybe_scons}
