# TCP-Port-Scanner
TCP Port Scanner is a lightweight and user-friendly tool for scanning TCP ports on multiple IP addresses. It provides a simple yet effective way to identify open, closed, and filtered ports on a network.

![image](https://github.com/vMawk/TCP-Port-Scanner/assets/117638856/e825e368-7083-4f53-a8d2-30a2f45b53bc)


## Key Features: ##

● Easily scan a list of IP addresses and a range of ports ● Quick identification of open, closed, and filtered ports ● Output results to a customizable CSV file for further analysis ● Designed for simplicity and ease of use

![image](https://github.com/vMawk/TCP-Port-Scanner/assets/117638856/e8b0bcd9-b92c-417e-9b71-df95868a1166)

## Interface ##
This port scanner is perfect for network administrators, security analysts, and enthusiasts who need to quickly assess the status of TCP ports on a network. With its intuitive interface and informative output, it streamlines the process of identifying potential vulnerabilities and securing network infrastructure.

![image](https://github.com/vMawk/TCP-Port-Scanner/assets/117638856/a0f9cd00-17fd-47dc-b667-fa5cf9f5d094)


## Beginner Friendly! ##
Open a powershell windows as admin and run it as .\scanner.ps1.
Or import it to your powershell profile to start it with "portscan"

function portscan {
    . "C:\Users\USER\Documents\WindowsPowerShell\Scanner.ps1"
    Scan-TCPPorts
}
