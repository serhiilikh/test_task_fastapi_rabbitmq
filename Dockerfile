FROM python:3.8.3-buster

ENV PYTHONFAULTHANDLER=1 \
  PYTHONUNBUFFERED=1 \
  PYTHONHASHSEED=random \
  PIP_NO_CACHE_DIR=off \
  PIP_DISABLE_PIP_VERSION_CHECK=on \
  PIP_DEFAULT_TIMEOUT=100
WORKDIR /code
COPY requirements.txt /code/

ENV PATH=/home/ubuntu/.virtualenvs/bin:$PATH
RUN pip install -r requirements.txt

# Creating folders, and files for a project:
COPY app/main.py /code/app.py
COPY worker.py /code/worker.py