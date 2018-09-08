#!/bin/sh

rm -f ./"${1%.*}".sb
sbconf=$(mktemp ./"${1%.*}".sb)

/bin/cat > ${sbconf} <<EOF
(version 1) 
(deny default)

(allow network*)

(allow file-read-data file-read-metadata
  (regex "^/Applications/${1}")
  (regex "^/dev/autofs.*")
  (regex "^/dev/urandom")
  (regex "^/System/Library")
  (regex "^/Library")
  (regex "^/Users/$(id -un)")
  (regex "^/usr/lib")
  (regex "^/usr/share")
  (regex "^/var")
  (regex "^/"))

(allow file-read-data file-read-metadata
  (regex "^/Library"))

(allow file-ioctl
       (literal "/dev/dtracehelper"))

(allow mach* sysctl-read)

(allow file-write* file-read-data file-read-metadata
  (regex "^/Applications/${1}")
  (regex "^(/private)?/tmp/")
  (regex "^/Users/$(id -un)")
  (regex "^/dev"))

;; Can only spin up child processes
(allow process-exec 
  (regex "^/Applications/${1}"))

(allow ipc-posix* 
	(ipc-posix-name-regex "com.apple.*")
	(ipc-posix-name-regex "apple.*"))

(allow iokit-open 
	(iokit-user-client-class "RootDomainUserClient"))
EOF

sandbox-exec -f "${sbconf}" /Applications/"${1}"/Contents/MacOS/"${1%.*}"

rm "$sbconf"