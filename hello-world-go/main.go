package main

import (
	"fmt"
	"mi_proyecto/internal/pkg/util"
)

func main() {
	message := util.GetHelloMessage("Gopher")
	fmt.Println(message)
}
