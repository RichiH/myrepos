PREFIX:=/usr/local

build:
	pod2man -c mr mr > mr.1
	pod2man -c webcheckout webcheckout > webcheckout.1

test:
	(echo "[.]"; echo "checkout=") > mrconfig.tmp
	./mr --trust-all -c mrconfig.tmp ed | grep -q "horse"
	rm -f mrconfig.tmp

install: build
	install -Dm0755 mr ${DESTDIR}${PREFIX}/bin/mr
	install -Dm0755 webcheckout ${DESTDIR}${PREFIX}/bin/webcheckout

	install -Dm0644 mr.1 ${DESTDIR}${PREFIX}/share/man/man1/mr.1
	install -Dm0644 webcheckout.1 ${DESTDIR}${PREFIX}/share/man/man1/webcheckout.1
