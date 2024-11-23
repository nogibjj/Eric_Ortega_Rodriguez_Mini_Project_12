[![CI](https://github.com/nogibjj/Eric_Ortega_Rodriguez_Mini_Project_6/actions/workflows/cicd.yml/badge.svg)](https://github.com/nogibjj/Eric_Ortega_Rodriguez_Mini_Project_6/actions/workflows/cicd.yml)
# Mini Project #12 
# Vowel and Consonant Counter Application
## Eric Ortega Rodriguez

## Overview

This is a simple Python web application built using the Flask framework. The application provides functionality to count the number of vowels and consonants in a word submitted through a web form. 

Additionally, the application is containerized using Docker to ensure portability and ease of deployment. The goal is to demonstrate running the application both locally within a Docker container and as part of a CI/CD pipeline that builds and pushes the Docker image to Docker Hub.

## Features

- **Web-based UI**:
  - Submit a word through a form on the web page.
  - View the counts of vowels and consonants in the word.

- **Containerized Application**:
  - Easily deployable using Docker.
  - Includes a `Dockerfile` to package the application and its dependencies.

- **CI/CD Integration**:
  - Automatically builds and tests the application as part of a CI/CD pipeline.
  - Publishes the Docker image to Docker Hub.

## How It Works

1. The application provides a simple web interface where users can input a word.
2. The backend processes the word to calculate the number of vowels and consonants.
3. The results are displayed on the same page.

### Example Workflow:

- Input: `Flask`
- Output:
  - Vowels: 1
  - Consonants: 4

## Usage

### Running Locally

#### Prerequisites:
- Python 3.9 or higher
- Flask (specified in `requirements.txt`)

1. Install dependencies:
   ```bash
   pip install -r requirements.txt
