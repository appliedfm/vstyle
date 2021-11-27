.PHONY: all clean

INDIR ?= ./src
OUTDIR ?= ./vstyle

$(OUTDIR)/%.html: $(INDIR)/%.md
	alectryon --frontend md --backend webpage $< -o $@

all: $(OUTDIR) \
	$(OUTDIR)/index.html \
	$(OUTDIR)/project_structure.html

$(OUTDIR):
	mkdir -p $(OUTDIR)

clean:
	rm -rf $(OUTDIR)
