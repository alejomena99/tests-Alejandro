package main

import (
	"fmt"
	"hello-world-go/internal/pkg/util"
)

func main() {
	message := util.GetHelloMessage("Gopher")
	fmt.Println(message)
}
