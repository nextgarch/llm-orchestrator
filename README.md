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

Check the list of installed models using `ollama list`.
See the full list of available models [here](https://ollama.com/library).

## LLM Server

Install `AnythingLLM` as following:

```sh
make start-anythingllm-server
```

`AnythingLLM` server is setup as a `docker` container, so no installation is needed. 
It pulls the ready-to-use docker container provided by `MintPlex Labs` and gets the server running.

## Port-Forwarding

At this point, we have an LLM provider and server setup for us on our remove VM but we need a way to access it from other machines in the cluster.
For this, we will setup port forwarding via reverse SSH. 
From inside the VM, we will launch `autossh` with `-R` flag (reverse port-forward) to the host machine on which the VM is running.
If successful, this should allow us to access both the provider and the server using the host machine's IP and ports from any other machine/VM on the cluster.

### Setting Up the Host Machine

Login to the host machine (e.g., NGA3) and modify the `/etc/ssh/sshd_config` file as following:

```sh
vim /etc/ssh/sshd_config
```

and modify only the following variables as shown:

```sh
# Change to yes to enable challenge-response passwords (beware issues with
# some PAM modules and threads)
KbdInteractiveAuthentication no
ChallengeResponseAuthentication no

AllowTcpForwarding yes
GatewayPorts yes
X11Forwarding yes
X11UseLocalhost yes
```

Now restart the ssh service on the host machine using the following command:

```sh
service sshd restart
```

This should allow the host to expose its ports to other machines.

Next, go back to the Ansible terminal running inside the VM and run the following command:

```sh
make setup-port-forwarding-scripts
```

In a non-Ansible terminal, run the following command:

```sh
make setup-port-forwarding
```

With this, port-forwarding setup should be complete.
To test, open a browser and access `<host-ip>:11434` and you should see `Ollama is running`.

### Create SSH Key for Host Machine

Run the following:

```sh
ssh-keygen 
# when prompted, use the following key name: lmserver_key_for_host
```

> Note: Create a key with the exact name `lmserver_key_for_host` because this is expected in the ssh_config file we use for the host machine.

## Stopping the Services

To uninstall `Ollama` (with all its models) and stop `AnythingLLM` server container, do the following:

```sh
make stop-anythingllm-server
make uninstall-ollama-provider
```

Exit the `Ansible` docker container itself (`Ctrl+d`).
Finally, in a non-Ansible terminal, run the following:

```sh
make teardown-port-forwarding
```
