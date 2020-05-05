
protoc -I api/ api/server.proto --dart_out=grpc:../download/lib/api/v1
protoc -I api/ api/server.proto --go_out=plugins=grpc:api/v1