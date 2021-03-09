#!/usr/bin/python3
import brownie

import json
testdata = {}
with open('./tests/data/safety-checker.test.json') as f:
    testdata = json.load(f)['tests']

def test_all(accounts, entry):
    for name, test in testdata.items():
        print(name)
        run_test(accounts, entry, test['in'])

def run_test(accounts, entry, bytecode):
    entry.cmp(bytecode, {'from': accounts[0]})
