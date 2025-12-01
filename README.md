# Supportninja's Automox API Guide

This project contains a collection of Bash automation scripts designed to interact with the Automox API. These tools are built specifically to assist technical support frontliners (TSE Ninjas) in validating and troubleshooting customer reports, including:

- Verifying customer claims that specific Automox API endpoints are not working
- Testing API responses using controlled, repeatable Bash functions
- Quickly reproducing issues to determine whether the problem is due to customer configuration, environment, permissions, or API functionality
- Providing consistent validation steps to ensure accurate and efficient support
- Helping identify documentation discrepancies whenever expected API behavior does not match actual results

## Prerequisites

Before cloning and running any script, ensure all requirements and setup steps below are completed.

1. Bash Installed
- These scripts require a Bash environment.
- Compatible with: macOS Terminal, Linux, Windows (Git Bash or WSL)

2. Code Editor

- Any code editor can be used, such as: Notepad++, Visual Studio Code, or any editor of your preference

3. Administrative Access

- Running this scripts may require elevated permissions:
- sudo privileges on macOS/Linux
- Run as Administrator on Windows

## Getting Started

To get started with the app, clone the repository:

Once successfully cloned, in the root folder, add a new `.env` file. Then input the following:
```
token="<token_from_the_console>"
```

If you require assistance where to get the token, reach out to the Dan, for assistance.

Once the token is added, you can test the script by calling the main execution entry in the terminal.


```
./main.sh
```

All files are ensured executable and tested before deploying them in the repository, if you encountered any issues with that. Just run:
```
chmod +x ./main.sh
```

## Usage

You can leverage and improve codebases, along with the new ideas you'll have. The purpose of this project is to elevate our knowledge and use them in troubleshooting with customer inquiry in the future.

## Acknowledgements



