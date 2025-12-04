import requests
import json

# ยิงคำถามไปที่ Ollama (ที่รันอยู่ใน Docker)
url = "http://localhost:11434/api/generate"
payload = {
    "model": "llama3",
    "prompt": "Explain Quantum Physics in 1 sentence.",
    "stream": False
}

response = requests.post(url, json=payload)
print(response.json()['response'])

# docker start ollama in wsl Terminal
# docker container ls
# run file นี้ได้เลยย