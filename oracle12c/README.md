### **oracle12c** Database on Fedora Docker Image

Software files for Enterprise Edition ``12.1.0.2.0``:

- linuxamd64_12102_database_1of2.zip
- linuxamd64_12102_database_1of2.zip

Download it from: [Oracle](http://www.oracle.com/technetwork/database/enterprise-edition/downloads/index.html)

Goals:

- [x] Software installation.
- [ ] Database creation.
- [ ] Networking and utilities.

All should be accomplished in just **one step** by **one ``Dockerfile``**.

**Test**: ``docker run --privileged=true -i -t fedora/oracle12c /bin/bash``

