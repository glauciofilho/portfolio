from flask import Blueprint, render_template
import jsonify

main = Blueprint("main", __name__)

@main.route("/")
def home():
    return render_template("index.html")

@main.route("/projects")
def projects():
    return render_template("projects.html")

@main.route('/health')
def health_check():
    """Endpoint for health checks."""

    return jsonify({"status": "ok"}), 200