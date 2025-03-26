📂 Os arquivos PDF utilizados nos scripts estão na pasta `data/uploads/`.

⚠️ Para funcionar corretamente com `LOAD_FILE`, é necessário copiá-los manualmente para o diretório configurado no MySQL (`secure_file_priv`).
```
SHOW VARIABLES LIKE 'secure_file_priv';
```
