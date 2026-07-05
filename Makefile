.PHONY: install audit report rollback test shellcheck ansible docs

install:
	sudo ./install.sh

audit:
	sudo ./audit.sh

report:
	sudo ./report.sh

rollback:
	sudo ./rollback.sh

test:
	bash -n install.sh audit.sh rollback.sh report.sh lib/*.sh modules/*.sh

shellcheck:
	shellcheck install.sh audit.sh rollback.sh report.sh lib/*.sh modules/*.sh || true

ansible:
	cd ansible && ansible-playbook site.yml --check -K

docs:
	./scripts/build-docs.sh
