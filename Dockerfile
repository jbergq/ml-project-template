FROM gcr.io/deeplearning-platform-release/pytorch-gpu.1-11

COPY . /workspace
WORKDIR /workspace

ENTRYPOINT ["python", "-m", "train.py"]
