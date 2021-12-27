#!/bin/bash

bundle exec ruby bin/scraper/wikipedia.rb | ifne tee data/wikipedia.csv
bundle exec ruby bin/wikipedia-diff.rb | tee data/wikipedia-diff.csv
