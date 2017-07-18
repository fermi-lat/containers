#!/bin/bash
product_tag=$1
user=$2

# product_tag=20-10-04-gr02
# user=bvan

product=GlastRelease-scons

CVS_RSH=ssh cvs -d :ext:$USER@centaurusa.slac.stanford.edu:/nfs/slac/g/glast/ground/cvs \
    co -r $product-$product-tag \ 
    -d workspace \
    $product
