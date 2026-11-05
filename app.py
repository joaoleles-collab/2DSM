# pip install flask
from flask import Flask, render_template, request
from validacoes import validar_cadastro

app = Flask(__name__)

@app.route("/")
def inicio():
    return render_template("index.html")

@app.route("/aventureiro")
def reg_aventureiro():
    return render_template(
        "form_aventureiro.html")

@app.route("/cadastrar", methods=["POST"])
def cadastrar_aventureiro():
    sql = request.form["sql"]
    valido, mensagem = validar_cadastro(sql)
    print(valido)
    print(mensagem)
    if valido == False:
        return render_template(
            "form_aventureiro.html", msg = mensagem
        )
    else:
        return render_template(
            "form_aventureiro.html", msg = mensagem
        )

app.run()