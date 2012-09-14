#! /bin/sh

# stuff we need
config_cc="CC=gcc"
config_cflags="CFLAGS=-Wall -g"
config_file_pattern="ex*.c"
config_clean_pattern="*.o ex*[0-9]"

# trash the old Makefile
if [ -f Makefile ]
  then
    echo "Already configured. Run clean to start fresh."
fi

# grab the files and make a list
files_list=''
targets_list=''
for f in $config_file_pattern;
do
  files_list+=' '$f
  targets_list+=' '${f%'.c'}
done

# construct new makefile with what we've got
echo $config_cc >> Makefile
echo $config_cflags"\n" >> Makefile
echo "all: "$targets_list"\n"  >> Makefile
echo "clean: " >> Makefile
echo "\t rm -f Makefile "$config_clean_pattern >> Makefile
