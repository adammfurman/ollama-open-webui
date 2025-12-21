# Startup Script for Ollama + Open WebUI

This is a startup script to launch an instance of Ollama and Open WebUI in a single command.

I've included PGP signatures of the script files.

## How it Works

1. Start Docker Desktop
2. Start Ollama
3. Start Open WebUI in a Docker Container
4. Open Open WebUI local URL in a browser

## How to Verify the PGP Signature

You can verify the script file(s) with my PGP public key to ensure authenticity and integrity.

> [!NOTE]
> All my commits are also signed with my PGP signing subkey. You can see the green 'verified' label in the commit history.

1. Download my PGP public key from my website, my GitHub, or a keyserver such as keys.openpgp.org.
2. Clone the GitHub repo or download the script AND the signature file (ending in `.asc`).
3. In terminal, enter `gpg --verify start-local-ai.sh.asc start-local-ai.sh`
   - This verifies the integrity and the authenticity of the script file with the provided signature file and my PGP public key
   - Note: signature file goes first, then the script file
4. You should get "Good signature from Adam Furman hello@adamfurman.me"
   - If you do not get a valid signature, you should not trust the script file, unless you are able to manually analyze it yourself
   - It may be likely I pushed a change and did not update the signature
