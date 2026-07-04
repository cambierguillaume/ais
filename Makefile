.PHONY: install audit rollback test

install:
	sudo ./install.sh

audit:
	sudo ./audit.sh

rollback:
	sudo ./rollback.sh

test:
	./tests/smoke-test.sh
