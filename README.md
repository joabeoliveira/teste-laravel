# Teste Laravel para EasyPanel

Instruções rápidas:

- Conecte este repositório ao EasyPanel (deploy via GitHub).
- O Dockerfile usa multi-stage: cria o projeto Laravel com Composer e expõe um servidor PHP embutido em `:8000`.

Build local (exemplo):

```bash
docker build -t laravel-easypanel .
docker run --rm -p 8000:8000 laravel-easypanel
```

No EasyPanel, aponte para a branch `main` e deixe o build usar o Dockerfile do repositório.
