# Find Process using Port

```bash
sudo lsof -nP -iTCP -sTCP:LISTEN
sudo lsof -nP -iTCP:$PORT | grep LISTEN
sudo kill -9 <PID>
```

# Packet Trace

```bash
sudo tcpdump -i en0 -w trace.pcap
```