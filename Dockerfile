# ── Stage 1: dependency builder ─────────────────────────────────────────────
FROM python:3.11-slim AS builder

WORKDIR /app

COPY requirements.txt .
RUN pip install --no-cache-dir --prefix=/install -r requirements.txt


# ── Stage 2: model downloader ────────────────────────────────────────────────
# Separate stage so the download is cached independently from code changes.
FROM python:3.11-slim AS model-downloader

COPY --from=builder /install /usr/local

ENV HF_HOME=/model-cache

RUN python -c "\
from transformers import pipeline; \
pipeline('sentiment-analysis', model='distilbert/distilbert-base-uncased-finetuned-sst-2-english')"


# ── Stage 3: runtime image ───────────────────────────────────────────────────
FROM python:3.11-slim

WORKDIR /app

COPY --from=builder /install /usr/local

# Bake the pre-downloaded model into the image.
# Pods start instantly — no HuggingFace network call at runtime.
COPY --from=model-downloader /model-cache /model-cache
ENV HF_HOME=/model-cache

COPY main.py .

RUN useradd --create-home appuser && \
    chown -R appuser:appuser /app /model-cache
USER appuser

EXPOSE 8000

CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]
