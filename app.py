from flask import Flask, render_template, request

app = Flask(__name__)

# Helper function to calculate vowels and consonants
def count_vowels_and_consonants(word):
    vowels = "aeiou"
    consonants = "bcdfghjklmnpqrstvwxyz"
    
    word = word.lower()
    vowel_count = sum(1 for char in word if char in vowels)
    consonant_count = sum(1 for char in word if char in consonants)
    
    return vowel_count, consonant_count

@app.route("/", methods=["GET", "POST"])
def index():
    result = None
    if request.method == "POST":
        word = request.form.get("word", "").strip()
        if word:
            vowel_count, consonant_count = count_vowels_and_consonants(word)
            result = {
                "word": word,
                "vowel_count": vowel_count,
                "consonant_count": consonant_count,
            }
        else:
            result = {"error": "Please enter a valid word."}
    return render_template("index.html", result=result)

if __name__ == "__main__":
    # Run on a different port (e.g., 5001)
    app.run(host = "0.0.0.0",debug=True, port=5001)


# from flask import Flask

# app = Flask(__name__)

# @app.route('/')
# def hello_world():
#     return 'Hello, World!'

# if __name__ == '__main__':
#     app.run(host="0.0.0.0", port=80, debug=True)