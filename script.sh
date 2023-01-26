#!/bin/bash

cat > ~/.rpmmacros <<EOF
%_signature gpg
%_gpg_name $INPUT_GPG_NAME
EOF


cp *.rpm .
cat /root/.rpmmacros 
ls -l
pwd
gpg --batch --import $INPUT_GPG_FILE


echo stuff in incoming
find .

# Sign rpm files
for i in `ls -1 *rpm`; do echo $i; expect /data/passphrase.expect $i; done
mkdir -p $INPUT_TARGET_PATH/$INPUT_TARGET_FOLDER
cp *.rpm $INPUT_TARGET_PATH/$INPUT_TARGET_FOLDER

createrepo 

rm -f $INPUT_TARGET_PATH/$INPUT_TARGET_FOLDER/repodata/repomd.xml.asc
gpg --batch --detach-sign --armor $INPUT_TARGET_PATH/$INPUT_TARGET_FOLDER/repodata/repomd.xml


tar -czvf rpms.tar.gz $INPUT_TARGET_PATH/$INPUT_TARGET_FOLDER

