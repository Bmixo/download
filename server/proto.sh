
#pub global activate protoc_plugin
protoc -I api/ api/server.proto --dart_out=grpc:../client/lib/api/v1/
protoc -I api/ api/server.proto --go_out=plugins=grpc:api/v1
go env -w GOSUMDB=off