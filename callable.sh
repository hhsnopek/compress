#!/bin/bash

Compress__callable_main() {
	if ! hash svgo 2>/dev/null; then
		echo "Missing dependency: svgo"
		return 1
	elif ! hash pngquant 2>/dev/null; then
		echo "Missing dependency: pngquant"
		return 1
	elif ! hash jpegoptim 2>/dev/null; then
		echo "Missing dependency: jpegoptim"
		return 1
	fi

	if [[ $@ == "" ]]; then
		blob="./"
	else
		blob="$@"
	fi

	for param in $blob; do
		if [[ $param == *".svg"* ]]; then
			if [[ $param == *"*"* || -d $param ]]; then # wildcard/directory
				command svgo --disable removeViewBox -f $param
			elif [[ -f $param ]]; then
				command svgo --disable removeViewBox $param # file
			fi
		elif [[ $param == *".png" ]]; then 
			if [[ $param == *"*"* || -d $param ]]; then # wildcard/dir
				command find $param -name '*.png' ! -path $param -exec pngquant --force --ext=.png '{}' +;
			else
				command pngquant --force --ext=.png $param #file
			fi
		elif [[ $param == *"*.jpg" || $param == *"*.jpeg"* ]]; then # wildcard/dir/file
			command jpegoptim --max=70 $param
		elif [[ $param == *"*"* || -d $param ]]; then
			command svgo --disable removeViewBox -f $param;
			command find $param -name '*.png' ! -path $param -exec pngquant --force --ext=.png '{}' +;
			command jpegoptim --max=70 $param
		else
			command svgo --disable removeViewBox -f ./;
			command find ./ -name '*.png' ! -path ./ -exec pngquant --force --ext=.png '{}' +;
			command jpegoptim --max=70 ./
		fi
	done
}

Compress__callable_help(){
    more "$Ash__ACTIVE_MODULE_DIRECTORY/HELP.txt"
}
