# foveas3-modding-engine

This is the core of a generic modding engine for AS3 projects.

## Documentation

[http://j3k0.github.io/foveas3-modding-engine/](http://j3k0.github.io/foveas3-modding-engine/).

## Contributing

Run tests:
```
make test
```

Generate asdoc:
```
make asdoc
```

Update gh-pages.

1. update asdoc
2. copy asdoc-output to /tmp
3. checkout gh-pages
4. rsync -av /tmp/asdoc-output/ .
5. commit, push
