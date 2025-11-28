metadata
title: TDS LLM Analysis Quiz
emoji: 🧠
colorFrom: indigo
colorTo: purple
sdk: docker
app_file: Dockerfile
pinned: false
TDS LLM Analysis Quiz – Project 2
This repository implements an automated quiz-solving API endpoint for the
LLM Analysis Quiz as specified in the IIT Madras TDS Project 2 guidelines.

The application accepts quiz tasks via HTTP POST, dynamically visits
JavaScript-rendered quiz pages, performs required data sourcing, analysis,
and visualization, submits answers within time limits, and handles
multi-step quiz flows.

✅ Features
FastAPI-based HTTP endpoint
Secure request validation using secret key
JavaScript DOM execution using Playwright (Chromium)
Handles chained quiz URLs automatically
Supports data extraction from HTML, APIs, PDFs
Submits answers in required JSON formats
Designed to meet 3-minute evaluation constraint
🔌 API Endpoint
Method
POST /

Request Body (JSON)
{
  "email": "your_registered_email",
  "secret": "your_secret_string",
  "url": "https://example.com/quiz"
}


email: Email used while submitting the Google Form

secret: Secret string (validated server-side)

url: Quiz URL to solve

Responses

HTTP 200 → Quiz processed successfully

HTTP 403 → Invalid secret

HTTP 400 → Invalid request payload

🧠 Quiz Handling Logic

Validate request payload and secret

Launch headless Chromium via Playwright

Render and parse quiz page (JS-executed DOM)

Perform required data operations

Submit computed answer to given submit URL

Handle follow-up quiz URLs recursively until completion

Only the last submission within 3 minutes is considered.

🐳 Deployment (Hugging Face Spaces)

This project uses Docker SDK because Playwright requires system-level
dependencies (Chromium).

Docker does not need to be installed locally.

Required Files

Dockerfile

requirements.txt

main.py (or app.py)

.env (runtime secrets, not committed)

Hugging Face will automatically:

Build the Docker image

Install Chromium + dependencies

Launch the FastAPI app on port 7860

📁 Environment Variables

Create a .env file locally:

EMAIL=your_registered_email
SECRET=your_secret_string
APIPIPE_TOKEN=optional_if_used


Do not commit .env to the repository.

🧪 Local Testing

Use Postman or curl:

POST http://localhost:8000/

{
  "email": "...",
  "secret": "...",
  "url": "https://tds-llm-analysis.s-anand.net/demo"
}


Expected behavior:

Follows demo → demo2 → finish sequence automatically

📦 Tech Stack

Python 3.11

FastAPI

Playwright (Chromium)

Requests / Pandas / NumPy (as needed)

Docker (deployment)

🧑‍🏫 Viva Preparation

Design choices covered in viva:

Why Playwright instead of requests

How secrets are validated

Handling JS-rendered content

Timeout and retry strategy

Why Docker is required on Hugging Face

📜 License

MIT License


---

### Final truth
If your **README + Dockerfile + endpoint** match this,  
you are **deployment-correct** and **evaluation-compatible**.

Next thing that can break: **Dockerfile dependency order** or **Playwright args**.  
If you want, say **“Dockerfile audit”** and I’ll harden it.
