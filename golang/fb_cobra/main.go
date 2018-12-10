package main

import (
	"fmt"
	"github.com/spf13/cobra"
	"strconv"
	"strings"
)

func fizzbuzz(max int) {
	for i := 0; i <= max; i++ {
		fizz := i%3 == 0
		buzz := i%5 == 0
		switch {
		case fizz && buzz:
			fmt.Println("fizzbuzz")
		case fizz && !buzz:
			fmt.Println("fizz")
		case !fizz && buzz:
			fmt.Println("buzz")
		default:
			fmt.Println(i)
		}
	}
}

func main() {
	var echoTimes int

	var cmdPrint = &cobra.Command{
		Use:   "print [string to print]",
		Short: "Print anything to the screen",
		Long: `print is for printing anything back to the screen.
For many years people have printed back to the screen.`,
		Args: cobra.MinimumNArgs(1),
		Run: func(cmd *cobra.Command, args []string) {
			fmt.Println("Print: " + strings.Join(args, " "))
		},
	}

	var cmdEcho = &cobra.Command{
		Use:   "echo [string to echo]",
		Short: "Echo anything to the screen",
		Long: `echo is for echoing anything back.
Echo works a lot like print, except it has a child command.`,
		Args: cobra.MinimumNArgs(1),
		Run: func(cmd *cobra.Command, args []string) {
			fmt.Println("Print: " + strings.Join(args, " "))
		},
	}

	var cmdTimes = &cobra.Command{
		Use:   "times [# times] [string to echo]",
		Short: "Echo anything to the screen more times",
		Long: `echo things multiple times back to the user by providing
a count and a string.`,
		Args: cobra.MinimumNArgs(1),
		Run: func(cmd *cobra.Command, args []string) {
			for i := 0; i < echoTimes; i++ {
				fmt.Println("Echo: " + strings.Join(args, " "))
			}
		},
	}

	var cmdFizbuzz = &cobra.Command{
		Use:   "fizzbuzz [int]",
		Short: "return Fizzbuzz",
		Long: `echo things multiple times back to the user by providing
a count and a string.`,
		Args: cobra.MinimumNArgs(1),
		Run: func(cmd *cobra.Command, args []string) {
			var m int
			m, _ = strconv.Atoi(args[0])
			fizzbuzz(m)
		},
	}

	cmdTimes.Flags().IntVarP(&echoTimes, "times", "t", 1, "times to echo the input")

	var rootCmd = &cobra.Command{Use: "app"}
	rootCmd.AddCommand(cmdPrint, cmdEcho, cmdFizbuzz)
	cmdEcho.AddCommand(cmdTimes)
	rootCmd.Execute()
}
