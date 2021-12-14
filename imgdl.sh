#!/bin/bash


# set program variables
program_name="image-downloader"
version=$(cat /var/lib/$program_name/current_version)


# program display funtions
function display_options(){

	options_text="

		Image Downloader - options

		version $version

		-d	save directory, default is current path

		-u	url to download from

		-v 	enables verbose output

		-h 	display options


			
		https://github.com/pinebase/$program_name
	"
	echo "$options_text"
	exit
}

function display_liscence(){

	display_text=$(cat /usr/lib/$program_name/v$version/COPYING)
	echo "$display_text"
	exit
}


# add --help feature
if [ "$1" == '--help' ]
then
	display_options
fi


# gnu compliant show command output
if [ "$1" == 'show' ]
then
	display_liscence
fi


# check for an inout url
if [ "$1" == '' ]
then
	echo "# enter a url"
	exit
fi


# process arguments
while getopts 'd:vh?' c
do
	case $c in 
		d) save_directory=$OPTARG;;
		v) verbose='1';;
		h) display_options;;
		?) display_options;;
	esac
done	


# initiate download
if [ "$save_directory" == '' ]
then
	wget -r -l 1 -A jpg,jpeg,png,gif,bmp -nd -H $1
else
	wget -r -l 1 -A jpg,jpeg,png,gif,bmp -nd -H $1 -P $save_directory
fi


exit
