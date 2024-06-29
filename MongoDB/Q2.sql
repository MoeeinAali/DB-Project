db.phone_call_trip.aggregate([
    {
        $group: {
            _id: "$company_id",
            ticketCount: { $sum: 1 }
        }
    },
    {
        $sort: { ticketCount: -1 }
    }
]);
