import os

todofile = os.path.expanduser("~/notes/")

with open(todofile+"todo.txt") as f:
    print(f.read())
