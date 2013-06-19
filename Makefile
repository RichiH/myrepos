PREFIX:=/usr/local

build:
	pod2man -c mr mr > mr.1
	pod2man -c webcheckout webcheckout > webcheckout.1

test:
	(echo "[.]"; echo "checkout=") > mrconfig.tmp
	./mr --trust-all -c mrconfig.tmp ed | grep -q "horse"
	rm -f mrconfig.tmp

install: build
	install -d ${DESTDIR}${PREFIX}/bin
	install -d ${DESTDIR}${PREFIX}/share/man/man1
	install -d ${DESTDIR}${PREFIX}/share/mr

	install -m0755 mr ${DESTDIR}${PREFIX}/bin/
	install -m0755 webcheckout ${DESTDIR}${PREFIX}/bin/

	install -m0644 mr.1 ${DESTDIR}${PREFIX}/share/man/man1/
	install -m0644 webcheckout.1 ${DESTDIR}${PREFIX}/share/man/man1/

	install -m0644 lib/* ${DESTDIR}${PREFIX}/share/mr/
