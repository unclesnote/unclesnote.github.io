export GEM_HOME="$HOME/gems"
export PATH="$HOME/.rbenv/bin:$HOME/.rbenv/versions/3.0.6/bin:$HOME/gems/bin:$PATH"
export RUBYOPT="-EUTF-8"
rbenv global 3.0.6
eval "$(rbenv init -)"

bash tools/init
if [ $? -ne 0 ]; then
    echo "failure - tools/init"
    exit 1
fi

bundle
if [ $? -ne 0 ]; then
    echo "failure - bundle"
    exit 2
fi

JEKYLL_ENV=production bundle exec jekyll b
if [ $? -eq 0 ]; then
    touch ./_site/.nojekyll
else
    echo "failure - JEKYLL_ENV=bundle exec jekyll b"
    exit 3
fi

exit 0
