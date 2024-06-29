const fastify = require("fastify")();

fastify.register(require("@fastify/postgres"), {
	connectionString: "postgres://postgres:1162m@localhost:5432/db_project"

});

// Example:
// http://localhost:3000/balance?userId=1
fastify.get("/balance", async (req, res) => {
	const userId = req.query?.userId;

	if (!userId) {
		return res.status(400).send("Please Enter userId ...");
	}

	const query = `
        SELECT user_id, credit
        FROM user_account
        JOIN wallet ON wallet.user_id = user_account.account_id
        WHERE user_account.account_id = $1
    `;

	try {
		const result = await fastify.pg.query(query, [userId]);

		if (result.rowCount === 0) {
			return res.status(404).send("User not found");
		}

		res.send(result.rows[0]);
	} catch (err) {
		console.error("Database query error: ", err);
		res.status(500).send("Internal Server Error");
	}
});

// Example:
// localhost:3000/charge
//	{
//		"userId": 1,
//		"amount": 1000
//	}
fastify.post("/charge", async (req, res) => {
	const userId = req.body?.userId;
	const amount = req.body?.amount;

	const query = `
	SELECT ACCOUNT_NUMBER
 	FROM bank_user
 	WHERE user_id = $1;
	`
	const query2 = `
	INSERT INTO wallet_account_tr (token, bank_account_number, user_id, date, amount, type, state)
	VALUES ('6527924beb4743c59bab8dxxxxxxxxxx', $1, $2, '2024-06-01', $3, 'Deposit', 'Pending');
	`
	if (!(userId && amount)) res.send("Please enter userId and amount ...");
	try {
		let result = await fastify.pg.query(query, [userId])
		const accountNumber = result.rows[0].account_number
		result = await fastify.pg.query(query2, [accountNumber, userId, amount])
		res.send({ "url": "https://sep.shaparak.ir/OnlinePG", "token": "6527924beb4743c59bab8dxxxxxxxxxx" });
	} catch (error) {
		console.error("Database query error: ", err);
		res.status(500).send("Internal Server Error");
	}

});

// Example:
// localhost:3000/verify
//	{
//		"userId": 1,
//		"token":"6527924beb4743c59bab8dxxxxxxxxxx",
// 		"amount":"1000"
//	}
fastify.post("/verify", async (req, res) => {
	const userId = req.body?.userId;
	const token = req.body?.token;
	const amount = req.body?.amount;
	if (!token) res.send("Please enter token ...");
	const query = `
	UPDATE wallet_account_tr
	SET state = 'Completed'
	WHERE token = $1 and user_id = $2;
	`

	const query2 = `
	SELECT credit
	from wallet
	where user_id = $1
	`

	const query3 = `
	UPDATE wallet
	SET credit = $2
	WHERE user_id = $1;
	`
	try {
		let result = await fastify.pg.query(query, [token, userId])
		let credit_old = await fastify.pg.query(query2, [userId])
		result = await fastify.pg.query(query3, [userId, credit_old.rows[0].credit + amount])
		res.send({ "status": "verified" }); credit
	} catch (error) {
		console.error("Database query error: ", err);
		res.status(500).send("Internal Server Error");
	}
});


// Example:
// http://localhost:3000/history?userId=1
// http://localhost:3000/history?userId=1&page=1&limit=1
fastify.get("/history", async (req, res) => {
	const userId = req.query?.userId;
	if (!userId) return res.send("Please Enter userId ...");

	const page = req.query?.page;
	const limit = req.query?.limit;
	const offset = (page - 1) * limit;

	const query_offset = `
	SELECT date, amount, type, state
	FROM wallet_account_tr
	WHERE user_id = $1
	AND state = 'Completed'
	ORDER BY date
	LIMIT $2 OFFSET $3
    `;

	const query = `
	SELECT date, amount, type, state
	FROM wallet_account_tr
	WHERE user_id = $1
	AND state = 'Completed'
	order by date
    `;

	if (page && limit) {
		try {
			const result = await fastify.pg.query(query_offset, [userId, limit, offset]);
			res.send(result.rows);
		} catch (err) {
			console.error("Database query error: ", err);
			res.status(500).send("Internal Server Error");
		}

	} else {
		try {
			const result = await fastify.pg.query(query, [userId]);
			res.send(result.rows);
		} catch (err) {
			console.error("Database query error: ", err);
			res.status(500).send("Internal Server Error");
		}
	}
});


fastify.listen({ port: 3000, host: "0.0.0.0" }, (err) => {
	if (err) throw err;
	console.log(`server listening on ${fastify.server.address().port}`);
});
