from fastapi import FastAPI

app = FastAPI(title="Mercearia do João")


@app.get("/")
def raiz():
    return {"mensagem": "API no ar"}