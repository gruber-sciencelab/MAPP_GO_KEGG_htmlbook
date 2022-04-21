#!/bin/sh

set -e

[ -z "${GITHUB_PAT}" ] && exit 0
[ "${TRAVIS_BRANCH}" != "master" ] && exit 0

git config --global user.email "ian.kouzel@gmail.com"
git config --global user.name "Ian Kouzel"

git clone -b gh-pages https://github.com/gruber-sciencelab/MAPP_GO_KEGG_htmlbook.git book-output
cd book-output
cp -r ../_book/* ./
git add --all *
git commit -m "Update the book" || true
git push -q origin gh-pages


