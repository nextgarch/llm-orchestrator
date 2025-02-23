import aisuite as ai


def main():
    # Set the API URL to remote NGA2 server
    client = ai.Client(
        provider_configs={
            "ollama": {
                "api_url": "http://10.168.0.177:11434",
                "timeout": 300,
            }
        }
    )
    messages = [
        {
            "role": "system", 
            "content": "Be verbose"
        },
        {
            "role": "user", 
            "content": "Tell me something about Purdue's CS department. How old is it?"
        },
    ]

    ollama_llama3 = "ollama:llama3:latest"
    ollama_gemma = "ollama:gemma:latest"
    ollama_deepseek_32B = "ollama:deepseek-r1:32b"
    ollama_deepseek_70B = "ollama:deepseek-r1:70b"

    response = client.chat.completions.create(
        model=ollama_gemma, 
        messages=messages, 
        temperature=0.75,
    )
    print(response.choices[0].message.content)


if __name__ == "__main__":
    main()