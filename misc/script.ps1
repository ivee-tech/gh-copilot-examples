# Encoding a string
[Convert]::ToBase64String([Text.Encoding]::UTF8.GetBytes("Hello, World!"))

# Decoding a string
[Text.Encoding]::UTF8.GetString([Convert]::FromBase64String("SGVsbG8sIFdvcmxkIQ=="))

$text = "The price is 123 dollars. The date is 12/25/2021. My credit card number is 1234-5678-1234-5678."
$pattern = '\b\d+\b|\b\d{1,2}/\d{1,2}/\d{2,4}\b|\b\d{4}[- ]?\d{4}[- ]?\d{4}[- ]?\d{4}\b'
$matches = [regex]::Matches($text, $pattern) | ForEach-Object { $_.Value }
$matches

# tests in .NET

dotnet new mvc -n MyWeather

cd MyWeather2
dotnet restore
dotnet build
dotnet run

dotnet add package xunit
dotnet add package xunit.runner.visualstudio
dotnet add package Microsoft.NET.Test.Sdk
dotnet add package Moq

dotnet restore
dotnet test

# Add XUnit and Moq packages
dotnet add package xunit
dotnet add package moq
dotnet add package xunit.runner.visualstudio
# Add Newtonsoft.Json package
dotnet add package Newtonsoft.Json
dotnet add package Microsoft.TestPlatform.CommunicationUtilities

# Restore the project dependencies
dotnet restore

# Run the tests
dotnet test