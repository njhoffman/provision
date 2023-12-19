
# Dockerfile
cat > Dockerfile <<EOF
FROM alpine
  RUN apk update && apk add strace
  CMD ["strace", "-p", "1"]
EOF
# Build image
docker build -t strace .
