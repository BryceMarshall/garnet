DIRECTORY="/cas/student/cisc458o/Zdrive/ptsrc/test/phase1"
SCAN="/cas/student/cisc458o/Zdrive/ptsrc/parser/scan.def"
counter=1
> TestResults
for f in $(ls $DIRECTORY)
do
	echo $DIRECTORY/$f
	echo "Test $counter File: $f" >> TestResults 
	echo >> TestResults	
	echo "External Trace:" >> TestResults
	ssltrace "ptc –t1 –o1 -L /cas/student/cisc458o/Zdrive/ptsrc/lib/pt $DIRECTORY/$f" $SCAN -e >> TestResults
	echo "Internal Trace:" >> TestResults
	echo >> TestResults	
	ssltrace "ptc –t1 –o1 -L /cas/student/cisc458o/Zdrive/ptsrc/lib/pt $DIRECTORY/$f" $SCAN -i >> TestResults
	echo >> TestResults	
	echo "*****************" >> TestResults 
	counter=$[counter+1]
done
