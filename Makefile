book:
	cp README.md lectures/README.md
	jupyter-book build lectures
	if [ ! -d "docs" ]; then mkdir docs; fi
	if [ ! -f ".nojekyll" ]; then touch docs/.nojekyll; fi
	cp -r lectures/_build/html/* docs
