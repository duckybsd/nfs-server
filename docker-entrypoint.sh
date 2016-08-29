#!/bin/bash
set -e

export_base="/exports/"

### Handle `docker stop` for graceful shutdown
function shutdown {
    echo "- Shutting down nfs-server.."
    service nfs-kernel-server stop
    echo "- Nfs server is down"
    exit 0
}

trap "shutdown" SIGTERM
####

echo "Export points:"
echo "$export_base *(rw,async,insecure,fsid=0,no_subtree_check,no_root_squash)" | tee /etc/exports

echo -e "\n- Initializing nfs server.."
rpcbind
service nfs-kernel-server start

echo "- Nfs server is up and running.."

## Run until signaled to stop...
while :
do
    sleep 1  # Interupt interval time
done
