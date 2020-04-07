git checkout master
git add slides.md
git commit -m 'updated the slides md'

git checkout pandoc-outputs
git merge master
source makethedoc.sh
mv slides.html index.html
git add index.html
git commit -m 'updated the slides md and now the html'
LSTCHSH=$(git rev-parse HEAD)
# git checkout slides-body.tex  # ignore the changes here -- rewind

git checkout gh-pages
git cherry-pick $LSTCHSH  # merge only the last commit
git push

git checkout master
