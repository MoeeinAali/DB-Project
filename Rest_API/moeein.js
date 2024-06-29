const fastify = require('fastify')({ logger: true });
const fastifyPostgres = require('@fastify/postgres');

// Register PostgreSQL plugin
fastify.register(fastifyPostgres, {
    connectionString: "postgres://postgres:1162m@127.0.0.1:5432/db_project"
});

// Define the /balance route
fastify.get("/balance", async (req, res) => {
    const userId = req.query?.userId;
    if (!userId) {
        return res.send("Please Enter userId ...");
    }

    const query = `
    SELECT user_account.user_id, wallet.credit
    FROM user_account
    JOIN wallet ON wallet.user_id = user_account.account_id
    WHERE user_account.account_id = $1
  `;

    try {
        const result = await fastify.pg.query(query, [userId]);
        if (result.rows.length === 0) {
            return res.send("User not found");
        }
        return res.send(result.rows[0]);
    } catch (err) {
        res.code(500).send(err);
    }
});

// Start the server
const start = async () => {
    try {
        await fastify.listen(3000);
        fastify.log.info(`Server is running at http://localhost:3000`);
    } catch (err) {
        fastify.log.error(err);
        process.exit(1);
    }
};

start();
