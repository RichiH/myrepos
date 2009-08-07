build:
	pod2man -c mr mr > mr.1
	pod2man -c webcheckout webcheckout > webcheckout.1

test:
	(echo "[]"; echo "checkout=") > mrconfig.tmp
	./mr --trust-all -c mrconfig.tmp ed | grep -q "horse"
	rm -f mrconfig.tmp
