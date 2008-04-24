build:
	pod2man -c mr mr > mr.1

test:
	(echo "[]"; echo "checkout=") > mrconfig.tmp
	./mr -c mrconfig.tmp ed | grep -q "horse"
	rm -f mrconfig.tmp
