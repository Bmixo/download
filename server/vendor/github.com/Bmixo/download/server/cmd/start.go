package cmd

import (
	"fmt"
	"log"
	"net"

	pb "github.com/Bmixo/download/server/api/v1"
	"github.com/Bmixo/download/server/plugin/download"
	"google.golang.org/grpc"
	"google.golang.org/grpc/reflection"
)

const (
	port = ":50051"
)

func Start() {
	lis, err := net.Listen("tcp", port)
	if err != nil {
		log.Fatalf("failed to listen: %v", err)
	}
	s := grpc.NewServer()
	api := download.NewAPI()
	pb.RegisterDownloadProviderServer(s, api)
	// Register reflection service on gRPC server.
	reflection.Register(s)
	fmt.Println("server start")
	if err := s.Serve(lis); err != nil {
		log.Fatalf("failed to serve: %v", err)
	}
}
