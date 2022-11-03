#!/bin/bash
#*Author: Cromega
#?A bash script to add shortcuts to executable files

usage() {
	echo "Usage: $0 [-n <programm_name>] [-e <executable_path>] [-i <icon_path>] [-t <true|false>]"
	echo ""
	echo "	-n	Name of the program, for multiple words need to start and end with \"\" (ex. \"some thing\")"
	echo "		(Avoid the use of special characters as *, / or others similar)"
	echo ""
	echo "	-e	Path to the .AppImage, .bin or executable file gonna be used for execution"
	echo "		(If only name is provided, the current dir gonna be used as parent)"
	echo ""
	echo "	-i	Path to the .ico, .png or other image file that gonna be used for icon"
	echo "		(If only name is provided, the current dir gonna be used as parent)"
	echo ""
	echo "	-t	Declare if the terminal it's gonna be showed when executing the program"
	echo "		(Only \"true\" or \"false\" arguments are accepted)"

	exit 1
}

fileError() {
	printf "\nError: \"$1\" doesn't exist\n\n"
}

current=$(pwd)

while getopts "n:e:i:t:" args
	do case $args in
	n)
		name=${OPTARG}
		[[ $name =~ [^a-zA-Z0-9[:space:]] ]] && printf "\nError: Invalid name \"$name\"\n\n" && usage
		;;
	e)
		[[  ${OPTARG} == /* ]] && executable=${OPTARG} || executable="$current/${OPTARG}"
		[[ ! -f $executable ]] && fileError $executable && usage
		;;
	i)
		[[ ${OPTARG} == /* ]] && icon=${OPTARG} || icon="$current/${OPTARG}"
		[[ ! -f $icon ]] && fileError $icon && usage
		;;
	t)
		terminal=${OPTARG}
		[[ ! $terminal == "true" && ! $terminal == "false" ]] && printf "Error: \"$terminal\" isn't a valid argument for -t\n\n" && usage
		;;
	*)	usage
	esac
done

namelower=${name,,}
nameclear=${namelower//[ ]/_}
filename="$nameclear.desktop"

cd ~/.local/share/applications

printf "\nCreating \"$name\" as \"$filename\"\n"

if [[ -f $filename ]]
	then
		read -p "\"$filename\" already exists among the shortcuts, do you want to overwrite file? [y/n]: " accept
		if [[ $accept == "y" || $accept == "Y" ]]
			then rm -rf $filename
			else
				printf "\nStoping process\n"
				exit 0
		fi
fi

touch "$filename"
echo "[Desktop Entry]" >> $filename
echo "Name=$name" >> $filename
echo "Comment=$name" >> $filename
echo "Exec=$executable" >> $filename
echo "Icon=$icon" >> $filename
echo "Terminal=$terminal" >> $filename
echo "Type=Application" >> $filename
echo "Categories=Development" >> $filename
echo "MimeType=x-scheme-handler/$nameclear;text/html;" >> $filename

echo "\"$name\" was created as \"$filename\""