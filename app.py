from fastapi import FastAPI
import platform
import os

app = FastAPI(title="Architecture Aware API")

@app.get("/health")
def health():
    return {"status": "ok"}

@app.get("/arch")
def architecture():
    return {
        "architecture": platform.machine(),
        "processor": platform.processor(),
        "system": platform.system(),
        "python_version": platform.python_version(),
        "container_hostname": os.uname().nodename
    }
