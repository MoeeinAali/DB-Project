const fastify = require("fastify")();

fastify.register(require("@fastify/postgres"), {
	connectionString: "postgres://postgres:1162m@localhost:5432/db_project"

});

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

		console.log(result.rows[0]);
		res.send(result.rows[0]);
	} catch (err) {
		console.error("Database query error: ", err);
		res.status(500).send("Internal Server Error");
	}
});


fastify.post("/charge", async (req, res) => {
	const userId = req.body?.userId;
	const amount = req.body?.amount;
	if (!(userId && amount)) res.send("Please enter userId and amount ...");
	fastify.pg
		.query("", [userId, amount])
		.then((result) => {
			return res.send(result.rows[0]);
		})
		.catch((err) => {
			res.code(500).send(err);
		});
});
fastify.post("/verify", async (req, res) => {
	const token = req.body?.token;
	if (!token) res.send("Please enter token ...");
	fastify.pg
		.query("", [token])
		.then((result) => {
			return res.send(result.rows[0]);
		})
		.catch((err) => {
			res.code(500).send(err);
		});
});
fastify.get("/history", async (req, res) => {
	const userId = req.query?.userId;
	if (!userId) return res.send("Please Enter userId ...");

	const page = req.query?.page;
	const limit = req.query?.limit;

	if (page && limit) {
		fastify.pg
			.query("", [userId, page, limit])
			.then((result) => {
				return res.send(result.rows[0].transations);
			})
			.catch((err) => {
				res.code(500).send(err);
			});
	} else {
		fastify.pg
			.query("", [userId])
			.then((result) => {
				return res.send(result.rows[0].transations);
			})
			.catch((err) => {
				res.code(500).send(err);
			});
	}
});

fastify.listen({ port: 3000, host: "0.0.0.0" }, (err) => {
	if (err) throw err;
	console.log(`server listening on ${fastify.server.address().port}`);
});
