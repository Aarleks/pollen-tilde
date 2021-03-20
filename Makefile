.POSIX:
.PHONY: render clean

# Locations
INPUT = website
OUTPUT = public

default: render index.html publish

render:
	raco pollen render -r $(INPUT)

publish:
	raco pollen publish $(INPUT) $(OUTPUT)
	find $(OUTPUT) -name template.html -type f -delete

clean:
	raco pollen reset

view:
	cd $(INPUT)
	raco pollen start -l

index.html: $(INPUT)/index.html.pm
	raco pollen render -f $(INPUT)/index.html.pm
