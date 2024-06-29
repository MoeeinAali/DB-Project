const fastify = require("fastify")();

fastify.register(require("@fastify/postgres"), {
	connectionString: "postgres://postgres@localhost/postgres",
});

fastify.get("/balance", async (req, res) => {
	const userId = req.query?.userId;
	if (!userId) return res.send("Please Enter userId ...");
	fastify.pg
		.query("", [])
		.then((result) => {
			return res.send(result.rows[0]);
		})
		.catch((err) => {
			res.code(500).send(err);
		});
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
