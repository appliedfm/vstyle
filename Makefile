.PHONY: all clean

INDIR ?= ./src
OUTDIR ?= ./vguide

$(OUTDIR)/%.html: $(INDIR)/%.md
	alectryon --frontend md --backend webpage $< -o $@

all: $(OUTDIR) \
	$(OUTDIR)/index.html \
	$(OUTDIR)/02-project_structure.html

$(OUTDIR):
	mkdir -p $(OUTDIR)

clean:
	rm -rf $(OUTDIR)
