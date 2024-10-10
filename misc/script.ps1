# Encoding a string
[Convert]::ToBase64String([Text.Encoding]::UTF8.GetBytes("Hello, World!"))

# Decoding a string
[Text.Encoding]::UTF8.GetString([Convert]::FromBase64String("SGVsbG8sIFdvcmxkIQ=="))

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