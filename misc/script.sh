# Encoding a string
echo -n "Hello, World!" | base64

# Decoding a string
[Text.Encoding]::UTF8.GetString([Convert]::FromBase64String("SGVsbG8sIFdvcmxkIQ=="))

# Encoding a file
base64 input.txt > encoded.txt

# Decoding a file
base64 --decode encoded.txt > decoded.txt

