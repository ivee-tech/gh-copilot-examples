import requests
import json

def get_response(prompt):
    url = "http://localhost:11434/api/generate"
    payload = {
        "model": "llama3.2:latest",
        "prompt": prompt,
        "stream": False,
    }
    headers = {
        "Content-Type": "application/json"
    }

    response = requests.post(url, json=payload, headers=headers)
    
    if response.status_code == 200:
        return response.json()
    else:
        return {"error": f"Request failed with status code {response.status_code}"}

if __name__ == "__main__":
    prompt = "What is water made of?"
    response = get_response(prompt)
    print(response)