package util

import "fmt"

// GetHelloMessage retorna un saludo personalizado.
func GetHelloMessage(name string) string {
	return fmt.Sprintf("Hola, %s!", name)
}
