
# By default, rubyzip will not overwrite files if they already exist inside of the extracted path. 
# To change this behavior, you may specify a configuration option like so:
Zip.on_exists_proc = true


# Additionally, if you want to configure rubyzip to overwrite existing files while creating a .zip file, you can do so with the following:
Zip.continue_on_exists_proc = true


# If you want to store non-english names and want to open them on Windows(pre 7) you need to set this option:
Zip.unicode_names = true