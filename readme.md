# Compress
> Image compression for svg, png, jpg & jpeg

## Dependencies
- [svgo]
- [pngquant]
- [jpegoptim]

## Installation
```
# git
ash apm:install git@github.com:hhsnopek/compress.git

# https
ash apm:install https://github.com/hhsnopek/compress.git
```

## Usage
> apm compress:[help]
```
compress(1)

NAME
        compress - Image compression for svg, png, jpg & jpeg

SYNOPSIS
        compress                           compress all files in pwd (default)
        compress img/                      compress all files in dir: img
        compress image.[svg|png|jpg|jpeg]  compress file
        compress *.[svg|png|jpg|jpeg]      compress wildcard

```

## License
[MIT] © [Henry Snopek]

[svgo]: //github.com/svg/svgo
[pngquant]: //github.com/pornel/pngquant
[jpegoptim]: //github.com/tjko/jpegoptim
[help]: HELP.txt
[MIT]: license.md
[Henry Snopek]: //hhsnopek.com
