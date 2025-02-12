.PHONY: build

build: index.html articles/*.html

%.html: %.md pandoc.css
	pandoc $< -c pandoc.css -f markdown+east_asian_line_breaks -s -o $@

pandoc.css: pandoc.scss
	sass pandoc.scss pandoc.css
