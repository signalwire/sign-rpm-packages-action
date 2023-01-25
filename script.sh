#!/bin/bash

cat > /root/.rpmmacros <<EOF
%_signature gpg
%_gpg_name $INPUT_GPG_NAME
EOF


cp *.rpm .
cat /root/.rpmmacros 
ls -l
pwd
gpg --import $INPUT_GPG_FILE


echo stuff in incoming
find .

# Sign rpm files
for i in `ls -1 *rpm`; do echo $i; rpm --resign $i; done
mkdir -p $INPUT_TARGET_PATH/$INPUT_TARGET_FOLDER
cp *.rpm $INPUT_TARGET_PATH/$INPUT_TARGET_FOLDER.

cd $INPUT_TARGET_PATH
createrepo $INPUT_TARGET_FOLDER

cd $INPUT_TARGET_FOLDER
rm -f repodata/repomd.xml.asc
gpg --batch --detach-sign --armor repodata/repomd.xml
