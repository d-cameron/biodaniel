#!/bin/bash

set -e
errors=0

# Run unit tests
python biodaniel/biodaniel_test.py || {
    echo "'python python/biodaniel/biodaniel_test.py' failed"
    let errors+=1
}

# Check program style
pylint -E biodaniel/*.py || {
    echo 'pylint -E biodaniel/*.py failed'
    let errors+=1
}

[ "$errors" -gt 0 ] && {
    echo "There were $errors errors found"
    exit 1
}

echo "Ok : Python specific tests"
