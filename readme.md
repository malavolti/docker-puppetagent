# Puppetagent

Creates a Puppet Agent.

Build

* `docker build -t puppetagent .`
* `docker run -i -t puppetagent`

Note: The `sshkey` and `sshkey.pub` are just for example.  Replace with your own
before using.  These are used to access the SSH daemon on the container.

Note: Add, to the Dockerfile, this line to install packets without questions:

* ENV DEBIAN_FRONTEND noninteractive

Ports

* 22 (ssh)
* 8140 (puppet)
* 8080 (puppetdb)
