#!/usr/bin/python3

import pytest

@pytest.fixture(scope="module")
def entry(Entry, accounts):
    return Entry.deploy({'from': accounts[0]})
