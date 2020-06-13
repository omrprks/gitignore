.PHONY: all

SCRIPT=bin/gitignore
SRC=$(abspath ${SCRIPT})
OUT=$(notdir ${SCRIPT})
SPELLS_DIR=${HOME}/spells

all:
	@echo Nothing to see here

link.prepare:
	@mkdir -p ${SPELLS_DIR}

link: link.prepare
	@ln -s ${SRC} ${SPELLS_DIR}/${OUT}
	@chmod +x ${SPELLS_DIR}/${OUT}
