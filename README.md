# Large-Language Model (LLM) Orchestrator

## Basic Setup

Instal `Docker` by running the following commands:

```sh
sudo chmod a+x scripts/install-docker.sh
./scripts/install-docker.sh
```

Reboot your VM.

Start the `Ansible` docker container:

```sh
make ansible
```

> Note: From this point onwards, run all the following commands from within this container unless otherwise specified.

## LLM Provider

Install `Ollama` LLM provider:

```sh
make setup-ollama-provider
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

## LLM Server

Install `AnythingLLM` as following:

```sh
make start-anythingllm-server
```

`AnythingLLM` server is setup as a `docker` container, so no installation is needed. 
It pulls the ready-to-use docker container provided by `MintPlex Labs` and gets the server running.

## Stopping the Services

To uninstall `Ollama` (with all its models) and stop `AnythingLLM` docker, do the following:

```sh
make uninstall-ollama-provider
make stop-anythingllm-server
```
