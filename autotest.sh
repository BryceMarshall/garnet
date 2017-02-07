#!/bin/bash

PTSRC="/cas/student/cisc458o/Zdrive/ptsrc"
SCAN_DEF="${PTSRC}/parser/scandef"
TEST_DIR="${PTSRC}/test/phase1"
OUTFILE=phase1tests.txt

counter=1
> ${OUTFILE}
for f in $(ls ${TEST_DIR})
do
	echo ${TEST_DIR}/${f}
	echo "Test $counter File: ${f}" >> ${OUTFILE}
	echo >> ${OUTFILE}
	echo "External Trace:" >> ${OUTFILE}
	ssltrace "ptc –t1 –o1 -L $PTSRC/lib/pt ${TEST_DIR}/${f}" ${SCAN_DEF} -e >> ${OUTFILE}
	echo "Internal Trace:" >> ${OUTFILE}
	echo >> ${OUTFILE}
	ssltrace "ptc –t1 –o1 -L $PTSRC/lib/pt ${TEST_DIR}/${f}" ${SCAN_DEF} -i >> ${OUTFILE}
	echo >> ${OUTFILE}
	echo "*****************" >> ${OUTFILE}
	counter=$[counter+1]
done
