from flask import Flask, render_template, request
from validacoes.select import validar_select
from validacoes.insert import validar_insert
from database import executar_select

app = Flask(__name__)

@app.route("/", methods=["GET"])
def inicio():
    return render_template("index.html")

@app.route("/primeira_fase", methods=["GET"])
def primeira_fase_get():
    return render_template("primeira_fase.html")

@app.route("/primeira_fase", methods=["POST"])
def primeira_fase_post():
    sql = request.form["sql"].strip().lower()

    if not sql:
        return render_template(
            "primeira_fase.html",
            mensagem="❌ Digite um comando SQL."
        )
    
    if sql.startswith("select"):
        valido, mensagem = validar_select(sql)
        if valido:
            try:
                colunas, dados = executar_select(sql)
                return render_template(
                    "primeira_fase.html",
                    sql=sql,
                    colunas=colunas,
                    dados=dados
                )
            except Exception as erro:
                return render_template(
                    "primeira_fase.html",
                    sql=sql,
                    mensagem=f"❌ Erro no SQL: {erro}"
                )

    if not valido:
        return render_template(
            "primeira_fase.html",
            sql=sql,
            mensagem=mensagem
        )

@app.route("/segunda_fase", methods=["GET"])
def segunda_fase_get():
    return render_template("segunda_fase.html")

app.run(debug=True)