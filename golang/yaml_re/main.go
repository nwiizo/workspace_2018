package main

import (
	"fmt"
	"io/ioutil"

	yaml "gopkg.in/yaml.v2"
)

// structたち
type Data struct {
	Servers []Server `yaml:"servers"`
}

type Server struct {
	Name        string     `yaml:"common"`
	ServerInfo  serverinfo `yaml:"server_info"`
	Setting_Dir []string   `yaml:"setting_dir"`
}

type serverinfo struct {
	ServerIp   string `yaml:"server_ip"`
	ServerPort string `yaml:"server_port"`
}

func main() {
	buf, err := ioutil.ReadFile("./server.yaml")
	if err != nil {
		panic(err)
	}
	fmt.Printf("buf: %+v\n", string(buf))

	// structにUnmasrshal
	var d Data
	err = yaml.Unmarshal(buf, &d)
	if err != nil {
		panic(err)
	}
	fmt.Printf("info: %+v", d)

}
