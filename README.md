# vcpkg-registry

This is a registry for evoleap C++ packages using vcpkg

---

To reference files in this registry, add the registry to your vcpkg-configuration.json:

```
    {
      "kind": "git",
      "baseline": "<LATEST COMMIT HASH GOES HERE>",
      "repository": "https://github.com/evoleap/vcpkg-registry",
      "packages": [
        "evoleap-licensing"
      ]
    }
```

Then in vcpkg.json, add something like this:

```
  "dependencies": [
    "stduuid",
    "jsoncpp",
    "evoleap-licensing"
  ],
  "overrides": [
    {
      "name": "evoleap-licensing",
      "version": "<DESIRED VERSION, ex 0.5.1>"
    }
  ]
```

You may remove the baseline from vcpkg-configuration.json and if so, also add this to vcpkg.json:

```
  "builtin-baseline": "9558037875497b9db8cf38fcd7db68ec661bffe7",
```

You can update the baseline with the command at the developer command prompt:

```
vcpkg x-update-baseline  
```

---

To update this project, copy portfile.cmake and vcpkg.json from the original repository's
vcpkg-overlay-ports folder and update the SHA512 to match the download. Actually,
you will comment everything in the portfile.cmake and create one similar to
ports\evoleap-licensing\portfile.cmake if it is a private repo and you only want the 
binary files and header files released. I don't have a good reference for this because
Bing co-pilot actually described loosely how to do this and I had to figure out how
to make it work based on that.

Go to the project, say evoleap.licensing.cpp, and build the package from the port to create the binary port:

```
.\vcpkg.exe install evoleap-licensing --overlay-ports=C:\source\evoleap.licensing.cpp\src\vcpkg-overlay-ports
```

There should be more detailed instructions in the evoleap.licensing.cpp readme file.

Once you successfully build evoleap-licensing there, you will go to .\vcpkg\packages and
you'll see the project's vcpkg files. Take that folder (ex.
.\vcpkg\packages\evoleap.licensing_x64-windows) and zip it into a file
(evoleap.licensing_x64-windows.zip).

The evoleap.licensing port makefile will automatically create the .zip file,
.\vcpkg\packages\evoleap.licensing_x64-windows\evoleap.licensing_x64-windows.zip.

Use vcpkg to get a SHA512 hash from that file:

```
.\vcpkg hash .\packages\evoleap-licensing_x64-windows.zip SHA512
```

Save it. You'll need it later.

Next, upload that file to Azure storage in an appropriate blob storage container the root as package_triplet_version-YYYY-MM-DD-HH-MM-SS.zip (ex. evoleap-licensing_x64-windows-2024-10-14-12-18-48.zip) evoleap will use our Azure storage container for builds (evoleapbuilds). Make sure the container files can be read anonymously.

Go to port\evoleap-licensing\portfile.cmake and update the file with the new download URL
from Azure storage and the SHA512 as generated earlier.

With a new version, you need to also go into vcpkg.json and update the version to a
higher version.

You should update vcpkg.json in both this repo and the source repo where the
files are also located in the vcpkg-overlay-ports folder. 
ex. evoleap.licensing.cpp/src/vcpkg-overlay-ports

You do not need to update the vcpkg-overlay-ports folder in the project for the
portfile.cmake because they will be distinct.

After making all these changes, `git push` all your changes. Use a comment saying this is
a temporary commit for version x.y.z.

After pushing, run this command from the root of this repo:

```
vcpkg --x-builtin-ports-root=./ports --x-builtin-registry-versions-dir=./versions x-add-version --all --verbose
```

If this command succeeds, add all changes and run git push.

At this point the new registry has been published. If you want to reference the new version,
the referencing project will need both the version number and registry baseline hash updated
(as discussed above in the section on referencing).

More information on this process can be seen here:

https://learn.microsoft.com/en-us/vcpkg/produce/publish-to-a-git-registry
