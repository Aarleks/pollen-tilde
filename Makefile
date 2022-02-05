.POSIX:
.PHONY: render clean

# Locations
INPUT = website
OUTPUT = public

default: render index.html publish

render:
	raco pollen render -r $(INPUT)

test:
	echo `pwd`
	cd public; echo `pwd`

publish:
	raco pollen publish $(INPUT) $(OUTPUT)
	find $(OUTPUT) -name template.html -type f -delete
	cd website; racket feed.rkt

clean:
	raco pollen reset

view:
	raco pollen start -l $(INPUT)

index.html: $(INPUT)/index.html.pm
	raco pollen render -f $(INPUT)/index.html.pm
