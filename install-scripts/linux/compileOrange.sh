## export the latest version
TAG=stable

gcc -v
echo
echo "checking out sources using tag: $TAG"
if [ "$1" == "clean" ]; then
	## force a clean checkout
	## compiling this might take some time
	echo "force complete compile"
	rm -Rf source 
fi
echo

rm -Rf source
cvs -d :pserver:cvso@estelle.fri.uni-lj.si:/CVS checkout -r $TAG -f source

START_WD=`pwd`
rm orange.so statc.so corn.so
cd source 
if ! make; then 
	echo -e "\n\nERROR compiling"
	exit 1
else
	echo -e "\n\nOrange compiled successfully"
fi
cd $START_WD
rm orange.so statc.so corn.so

