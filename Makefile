all: example.html

example.html: example.qmd _extensions/twitter/twitter.lua
	quarto render example.qmd

clean:
	-rm example.html
	-rm -r example_files
