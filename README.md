# Large-Language Model (LLM) Orchestrator

## Setup

Instal `Docker` by running the following commands:

```sh
sudo chmod a+x scripts/install-docker.sh
./scripts/install-docker.sh
```

Start the `Ansible` docker container:

```sh
make ansible
```

> Note: From this point onwards, run all the following commands from within this container unless otherwise specified.

Install `Ollama` LLM provider:

```sh
make install-ollama-provider
```

In a separate (non-Ansible) terminal, try running `ollama`. 
If it shows help, installation was successful.
Now in this same (non-Ansible) terminal, run the following commands to install LLMs:

```sh
ollama run llama3.2
ollama run gemma
ollama run deepseek-r1
```

See full list of available models [here](https://ollama.com/library).

