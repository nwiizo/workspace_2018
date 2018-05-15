package main

import (
	pb "../hello"
	"google.golang.org/grpc"
	"log"
	"net"
)

const (
	port = ":8088"
)

func main() {
	s := grpc.NewServer()
	server := &Greeter{}
	pb.RegisterGreeterServer(s, server)
	lis, err := net.Listen("tcp", port)
	if err != nil {
		log.Fatalf("failed to listen: %v", err)
	}
	s.Serve(lis)
}
