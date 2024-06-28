from flask import Flask, request, jsonify
import psycopg2

app = Flask(__name__)

DB_HOST = "localhost"
DB_NAME = "db_project"
DB_USER = "postgres"
DB_PASS = "1162m"


def get_user_balance(user_id):
    try:
        connection = psycopg2.connect(
            host=DB_HOST,
            database=DB_NAME,
            user=DB_USER,
            password=DB_PASS
        )
        cursor = connection.cursor()
        cursor.execute(
            "SELECT paid FROM customer WHERE account_id = %s", (user_id,))
        result = cursor.fetchone()

        cursor.close()
        connection.close()

        if result:
            return result[0]
        else:
            return None
    except Exception as e:
        print(e)
        return None


@app.route('/balance', methods=['GET'])
def balance():
    user_id = request.args.get('userId')
    if not user_id:
        return jsonify({"error": "userId parameter is required"}), 400
    balance = get_user_balance(user_id)
    if balance is not None:
        return jsonify({"userId": user_id, "balance": balance})
    else:
        return jsonify({"error": "User not found"}), 404


app.run(debug=True)
