rm -f log/test.log
target=$1
method=$2
if [ -z $method ]
then
	ruby -Itest test/functional/${target}_controller_test.rb
else
	ruby -Itest test/functional/${target}_controller_test.rb -n $method
fi
