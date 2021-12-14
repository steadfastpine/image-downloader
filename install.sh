#!/bin/bash


# set program name
program_name="image-downloader"
program_executable="imgdl"


# get current version
version=$(cat ./version)


# load installation header
header="
  _                     _ _ 
 (_)                   | | |
  _ _ __ ___   __ _  __| | |
 | |  _   _ \ / _  |/ _  | |
 | | | | | | | (_| | (_| | |
 |_|_| |_| |_|\__  |\__ _|_|
               __/ |        
              |___/         

"
echo "$header"
echo ""
echo "Image Downloader"
echo "version $version"
echo "https://github.com/pinebase/$program_name"
echo ""

# install writable /var directory 
if [ ! -d /var/lib/$program_name/ ]
then
	mkdir /var/lib/$program_name/
	echo "# created folder: /var/lib/$program_name/"
fi


# install write protected program folder
if [ ! -d /usr/lib/$program_name/ ]
then
	mkdir /usr/lib/$program_name/
	echo "# created folder: /usr/lib/$program_name/"
fi


# install current version log
if [ ! -f /var/lib/$program_name/current_version ]
then
	touch /var/lib/$program_name/current_version
	echo "# created file: /var/lib/$program_name/current_version"
fi


# update current version file
echo $version > /var/lib/$program_name/current_version
echo "# current version updated"


# install version specific files
if [ ! -d /usr/lib/$program_name/v$version/ ]
then
	mkdir /usr/lib/$program_name/v$version/
	echo "# created folder: /usr/lib/$program_name/v$version/"
fi


# copy program files to /var/lib
cp `pwd`/* -r /usr/lib/$program_name/v$version/
echo "# copied files to: /usr/lib/$program_name/v$version/"


# update permissions for executables
chmod 755 /usr/lib/$program_name/v$version/$program_executable*.sh
echo "# updated permissions: 755 /usr/lib/$program_name/v$version/$program_executable*.sh"


if [ -f ./manual/$program_executable.1 ]
then
	if [ -d /usr/local/share/man/man1/ ]
	then
		# copy manual file
		cp ./manual/$program_executable.1 /usr/local/share/man/man1/

		# refresh system man pages
		mandb -q
		echo "# man page updated for $program_executable"
	fi
fi


# create soft links in /usr/bin
unlink /usr/bin/$program_executable 2>/dev/nul
ln -s /usr/lib/$program_name/v$version/$program_executable.sh /usr/bin/$program_executable
echo "# soft link created: /usr/bin/$program_executable"


echo "# installation complete"
echo ""

exit
