
all:
X:
	git add .
	-git commit -a -m "`date +%s`"
	git push
