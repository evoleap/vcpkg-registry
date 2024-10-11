# vcpkg-registry

This is a registry for evoleap C++ packages using vcpkg

---

To update, copy portfile.cmake and vcpkg.json from the original repository's
vcpkg-overlay-ports folder and update the SHA512 to match the download.

To get the SHA512, use the download URL for the commit to get the file. Go to a browser, 
for example, and download the commit with a URL like this:

https://github.com/evoleap/evoleap.licensing.cpp/archive/5afd26885317ea070f4779125e7c579d4113f0e2.tar.gz

Once you have the file downloaded, compute the SHA512 hash (for example):

```
vcpkg hash evoleap.licensing.cpp-5afd26885317ea070f4779125e7c579d4113f0e2.tar.gz SHA512
```

Then go to the file \ports\evoleap-licensing\portfile.cmake and update the REF to the 
commit hash and the SHA512 to the output of the above command. Also, make sure you
remove any git secret tokens since this is a public repo. GitHub will complain
if you do not do this before you push.

With a new version, you need to also go into vcpkg.json and update the version.

You should update these files in both this repo and the source repo where the
files are also located in the vcpkg-overlay-ports folder. 
ex. evoleap.licensing.cpp/src/vcpkg-overlay-ports

After making all these changes, push all your changes. After pushing, run this
command from the root of this repo:

```
vcpkg --x-builtin-ports-root=./ports --x-builtin-registry-versions-dir=./versions x-add-version --all --verbose
```

If this command succeeds, add all changes and run git push.

More information on this process can be seen here:

https://learn.microsoft.com/en-us/vcpkg/produce/publish-to-a-git-registry

