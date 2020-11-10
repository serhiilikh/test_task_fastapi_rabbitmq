from fastapi import FastAPI
from pydantic import BaseModel
from typing import Optional, Dict

from worker import print_message

app = FastAPI()


class Message(BaseModel):
    taskid: str
    title: str
    params: Optional[Dict[str, str]]


@app.post("/")
async def add_task(message: Message):
    print_message.delay(message)
    return message
