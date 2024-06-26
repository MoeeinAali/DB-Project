db.trip_ticket.insertMany
([
    { trip_reservation_id: 1, company_id: 1, user_id: 2, examiner_id: 8, message: 'Ticket issued for seat upgrade.', type: 'text' },
    { trip_reservation_id: 2, company_id: 2, user_id: 10, examiner_id: 8, message: 'Ticket issued for meal preference.', type: 'text' },
    { trip_reservation_id: 3, company_id: 3, user_id: 3, examiner_id: 8, message: 'Ticket issued for luggage issue.', type: 'not satisfied' },
    { trip_reservation_id: 4, company_id: 4, user_id: 5, examiner_id: 8, message: 'Ticket issued for seat preference.', type: 'text' },
    { trip_reservation_id: 5, company_id: 1, user_id: 6, examiner_id: 8, message: 'Ticket issued for late arrival.', type: 'not satisfied' },
    { trip_reservation_id: 6, company_id: 1, user_id: 7, examiner_id: 8, message: 'Ticket issued for special assistance.', type: 'text' },
    { trip_reservation_id: 7, company_id: 3, user_id: 9, examiner_id: 8, message: 'Ticket issued for travel insurance.', type: 'not satisfied' }
]);


db.hotel_ticket.insertMany
([
    { hotel_reservation_id: 1, user_id: 2, examiner_id: 8, message: 'Ticket issued for room upgrade.', type: 'text' },
    { hotel_reservation_id: 2, user_id: 3, examiner_id: 8, message: 'Ticket issued for late check-out.', type: 'cancel' },
    { hotel_reservation_id: 3, user_id: 5, examiner_id: 8, message: 'Ticket issued for additional services.', type: 'text' },
    { hotel_reservation_id: 4, user_id: 6, examiner_id: 8, message: 'Ticket issued for room service complaint.', type: 'cancel' },
    { hotel_reservation_id: 5, user_id: 7, examiner_id: 8, message: 'Ticket issued for maintenance issue.', type: 'text' },
    { hotel_reservation_id: 6, user_id: 9, examiner_id: 8, message: 'Ticket issued for reservation modification.', type: 'cancel' },
    { hotel_reservation_id: 7, user_id: 10, examiner_id: 8, message: 'Ticket issued for early check-in.', type: 'text' }
]);

db.ticket_type_priority.insertMany
([
    { type: 'text', priority: 1 },
    { type: 'cancel', priority: 3 },
    { type: 'not satisfied', priority: 2 }
]);

db.phone_call_trip.insertMany([
    { caller_id: 8, callee_id: 2, ticket_id: 1, duration: "00:05:30", date: new Date("2024-06-01"), time: "08:30:00", content: "Discussed seat upgrade options." },
    { caller_id: 8, callee_id: 3, ticket_id: 2, duration: "00:12:00", date: new Date("2024-06-02"), time: "09:15:00", content: "Meal preference was updated." },
    { caller_id: 8, callee_id: 5, ticket_id: 3, duration: "00:07:45", date: new Date("2024-06-03"), time: "10:45:00", content: "Resolved luggage issue." },
    { caller_id: 8, callee_id: 6, ticket_id: 4, duration: "00:03:30", date: new Date("2024-06-04"), time: "11:00:00", content: "Confirmed seat preference." },
    { caller_id: 8, callee_id: 7, ticket_id: 1, duration: "00:15:00", date: new Date("2024-06-05"), time: "12:30:00", content: "Late arrival arrangements made." },
    { caller_id: 8, callee_id: 7, ticket_id: 5, duration: "00:10:00", date: new Date("2024-06-06"), time: "13:45:00", content: "Special assistance details confirmed." },
    { caller_id: 8, callee_id: 7, ticket_id: 3, duration: "00:04:15", date: new Date("2024-06-07"), time: "14:20:00", content: "Insurance information discussed." },
    { caller_id: 8, callee_id: 2, ticket_id: 5, duration: "00:08:30", date: new Date("2024-06-08"), time: "15:10:00", content: "Travel insurance clarified." },
    { caller_id: 8, callee_id: 3, ticket_id: 2, duration: "00:06:00", date: new Date("2024-06-09"), time: "16:30:00", content: "Additional meal preferences updated." },
    { caller_id: 8, callee_id: 5, ticket_id: 2, duration: "00:09:00", date: new Date("2024-06-10"), time: "17:45:00", content: "Reviewed multiple ticket details." }
]);


db.phone_call_hotel.insertMany([
    { caller_id: 1, callee_id: 2, ticket_id: 1, duration: "00:05:23", date: new Date("2024-06-20"), time: "14:23:45", content: "Room upgrade options discussed." },
    { caller_id: 1, callee_id: 3, ticket_id: 3, duration: "00:02:45", date: new Date("2024-06-21"), time: "09:15:32", content: "Additional services explained." },
    { caller_id: 1, callee_id: 3, ticket_id: 4, duration: "00:07:12", date: new Date("2024-06-22"), time: "11:47:56", content: "Room service complaint resolved." },
    { caller_id: 1, callee_id: 9, ticket_id: 2, duration: "00:03:34", date: new Date("2024-06-23"), time: "13:05:12", content: "Late check-out arranged." },
    { caller_id: 1, callee_id: 10, ticket_id: 1, duration: "00:04:18", date: new Date("2024-06-24"), time: "15:22:19", content: "Early check-in details confirmed." }
]);