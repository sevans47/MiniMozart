FROM python:3.8.6-buster


COPY setup.py /setup.py
COPY requirements.txt /requirements.txt
RUN pip install --upgrade pip
RUN pip install --default-timeout=1000 -r requirements.txt

COPY CoolMelodyProject /CoolMelodyProject
COPY raw_data /raw_data
COPY model.h5 /model.h5
COPY api /api


CMD uvicorn api.api:app --host 0.0.0.0 --port $PORT
