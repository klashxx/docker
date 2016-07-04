### **oracle 12c** Database on Fedora [![][license-svg]][license-url]

Software files for Enterprise Edition ``12.1.0.2.0``:

- linuxamd64_12102_database_1of2.zip
- linuxamd64_12102_database_1of2.zip

Download it from: [Oracle](http://www.oracle.com/technetwork/database/enterprise-edition/downloads/index.html)

Goals:

- [x] Software installation.
- [ ] Database creation.
- [ ] Networking and utilities.

~~All~~ ~~should~~ ~~be~~ ~~accomplished~~ ~~in~~ ~~just~~ ~~one~~ ~~step~~ ~~by~~ ~~one~~ ~~Dockerfile~~

After hitting **issue** ``docker/docker#1916`` :disappointed: :disappointed: ... this will need to be a
*2 steps* workflow as ``mount`` requires ``privileged`` access to the ``container``.

**Test**: ``docker run --privileged=true -i -t fedora/ora12c_sw /bin/bash``

[license-url]: https://github.com/klashxx/docker/tree/master/oracle12c/blob/master/LICENSE.txt
[license-svg]: https://img.shields.io/badge/license-MIT-red.svg