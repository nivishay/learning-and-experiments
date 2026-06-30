from fastapi import FastAPI
from pydantic import BaseModel
from transformers import pipeline
import os

app = FastAPI(title="ML Inference Service")

# Loaded once at startup, shared across all requests.
# In K8s, each Pod gets its own copy of this model in memory.
model = pipeline("sentiment-analysis", model="distilbert/distilbert-base-uncased-finetuned-sst-2-english")


class TextInput(BaseModel):
    text: str


@app.get("/healthz")
def health():
    return {"status": "ok"}


@app.post("/predict")
def predict(payload: TextInput):
    result = model(payload.text)
    return {"input": payload.text, "prediction": result[0]}
