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

# Remote Desktop (CTRL+ALT+DEL)

```bash
FN + CTRL + ATL (Option) + DEL
```

# Grep -oP

```bash
perl -nle 'print $& while m{<version>(.*)</version>}g' pom.xml
```