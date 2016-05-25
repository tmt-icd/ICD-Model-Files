#!/bin/sh

# Ingests all releases of all subsystems into the database using the icd-db tool,
# which must be in your shell path


if ! hash icd-db 2>/dev/null; then
    echo "Please make sure the icd bin directory is in your shell path"
    exit 1
fi
if ! hash git 2>/dev/null; then
    echo "Please install git"
    exit 1
fi

echo "Starting with a clean database..."
icd-db --drop db

workdir=/tmp/icd-$USER
test -d $workdir || mkdir $workdir
cd $workdir
#git clone --recursive https://github.com/tmtsoftware/ICD-Model-Files.git
cd ICD-Model-Files
submodules=`git submodule status | cut -d ' ' -f 3`
for submodule in $submodules ; do (
    cd $submodule
    releases=`git tag -l`
    for release in $releases ; do (
	echo check out $submodule $release
	git checkout tags/$release
	subsystem=`egrep '^subsystem ' subsystem-model.conf | cut -d ' ' -f 3`
	version=`echo $release | tr -d v`
	icd-db --ingest .
	icd-db --subsystem $subsystem:$version --comment "Imported $release from GitHub" --publish
    ) done
) done

