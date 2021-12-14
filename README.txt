

  _                     _ _ 
 (_)                   | | |
  _ _ __ ___   __ _  __| | |
 | | '_ ` _ \ / _` |/ _` | |
 | | | | | | | (_| | (_| | |
 |_|_| |_| |_|\__, |\__,_|_|
               __/ |        
              |___/         



Image Downloader



# Contact: https://www.linkedin.com/in/steadfastpine/

# Release Date: 2019-06-08
# Version: .4



Description

	Download images which are displayed on a webpage.
	Enter a url to download the images to the local machine.



Prerequisites

	Bash Shell

	Operating Systems

		Linux

			Centos
			Redhat
			Fedora

	Wget	



Installation

	Download and unzip the program files, then change working directory to them:
	
		# cd image-downloader


	Next, run the installation script:

		# ./install.sh


	This will install the following files and folders:

		write protected library files, version specific
			/usr/lib/image-downloader/v$version	

		storage for lists of generated words
			/var/lib/image-downloader

		man page for wg				
			/usr/local/share/man/man1/imgdl.1		



Options

	-d	save directory, default is current path

	-u	url to download from

	-v 	enables verbose output

	-h 	display options


Usage
	
	Download images from a url to the current directory 

	# wid http://website_url.com


	Download images from a url to "/home/images/"

	# wid -u http://website_url.com -d /home/images/




License 

	This program is licensed under the GPL License, view the LICENSE.md file for more information.














