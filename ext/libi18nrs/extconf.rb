src = File.expand_path(File.dirname(__FILE__))
installdest = RbConfig::CONFIG['sitelibdir']
File.write("Makefile", <<-END
.PHONY: all
SRC=#{src}
DEST=$(shell pwd)

all: $(wildcard $(SRC)/*.rs)
\t cd $(SRC) && cargo build --release && ([ ! -e "$(DEST)/target" ] && ln -s $(SRC)/target $(DEST)/target || true)
\t [ -e target/release/libi18nrs.dylib ] && mv target/release/libi18nrs.dylib libi18nrs.bundle || mv target/release/libi18nrs.* .

install:
\tinstall libi18nrs.* #{installdest}
END
)
