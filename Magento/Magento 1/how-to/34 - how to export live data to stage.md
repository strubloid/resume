# How to export live data and import on stage?

## Magerun strip options for this
```bash
    n98-magerun.phar db:dump --strip="@stripped @sales @customers @emails @newsletter @trade @idx"
```

## Compressed version of it
```bash
    n98-magerun.phar db:dump --strip="@stripped @sales @customers @emails @newsletter @trade @idx" --no-single-transaction --compression="gzip"
```