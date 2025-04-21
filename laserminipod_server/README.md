# Prerequists

Install docker compose and dart


# First start

Compile C++ code in /lib/src/native as dynamic library. For Linux, output must be /lib/src/nativeLaserControll/x64/Debug/LaserControll.so (for Windows LaserControll.dll, for mac LaserControll.dylib)

Start Postgres DB and Redis in docker container 
    docker compose up --build --detach

Run start script
    ./start.sh

Server should now be running

# Start Server afterwards

Start Postgres DB and Redis in docker container 
    docker compose up --build --detach

Then you can start the Serverpod server.
    dart bin/main.dart --apply-migrations

When you are finished, you can shut down Serverpod with `Ctrl-C`, then stop Postgres and Redis.
    docker compose stop
