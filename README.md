# vcpkg-registry

This is a registry for evoleap C++ packages using vcpkg

---

To update, copy portfile.cmake and vcpkg.json from the original repository's
vcpkg-overlay-ports folder and update the SHA512 to match the download.

-- ALL OF THIS IS WRONG FOR THE PORTFILE. SEE ACTUAL PROCESS BELOW. --

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

-- THE ACTUAL WAY TO CREATE A PORTFILE --

Go to the project, say evoleap.licensing.cpp, and build the package from the port to create the binary port:

```
.\vcpkg.exe install evoleap-licensing --overlay-ports=C:\source\evoleap.licensing.cpp\src\vcpkg-overlay-ports
```

There should be more detailed instructions in the evoleap.licensing.cpp readme file.

Once you successfully build evoleap-licensing there, you will go to .\vcpkg\packages and you'll see the 
project's vcpkg files. Take that folder (ex. .\vcpkg\packages\evoleap.licensing_x64-windows) and zip it into a file (evoleap.licensing_x64-windows.zip).

Use vcpkg to get a SHA512 hash from that file:

```
.\vcpkg hash .\packages\evoleap-licensing_x64-windows.zip SHA512
```

Save it. You'll need it later.

Next, upload that file to this repo at the root as package_triplet_version.zip (ex. evoleap-licensing_x64-windows-0.5.0.zip)

Go to port\evoleap-licensing\portfile.cmake and update the file with the new download URL from this repo's raw
URL for the file and the SHA512 has generated earlier.

With a new version, you need to also go into vcpkg.json and update the version.

You should update vcpkg.json in both this repo and the source repo where the
files are also located in the vcpkg-overlay-ports folder. 
ex. evoleap.licensing.cpp/src/vcpkg-overlay-ports

You do not need to update the vcpkg-overlay-ports folder in the project for the portfile.cmake because they
will be distinct.

After making all these changes, push all your changes. After pushing, run this
command from the root of this repo:

```
vcpkg --x-builtin-ports-root=./ports --x-builtin-registry-versions-dir=./versions x-add-version --all --verbose
```

If this command succeeds, add all changes and run git push.

More information on this process can be seen here:

https://learn.microsoft.com/en-us/vcpkg/produce/publish-to-a-git-registry

