db.createCollection("trip_ticket", {
    validator: {
        $jsonSchema: {
            bsonType: "object",
            required: ["trip_reservation_id", "user_id", "examiner_id", "message", "type"],
            properties: {
                trip_reservation_id: {
                    bsonType: "int"
                },
                company_id: {
                    bsonType: "int"
                },
                user_id: {
                    bsonType: "int"
                },
                examiner_id: {
                    bsonType: "int"
                },
                message: {
                    bsonType: "string"
                },
                type: {
                    enum: ["text", "not satisfied"]
                }
            }
        }
    }
});


db.createCollection("hotel_ticket", {
    validator: {
        $jsonSchema: {
            bsonType: "object",
            required: ["hotel_reservation_id", "user_id", "examiner_id", "message", "type"],
            properties: {
                hotel_reservation_id: {
                    bsonType: "int"
                },
                user_id: {
                    bsonType: "int"
                },
                examiner_id: {
                    bsonType: "int"
                },
                message: {
                    bsonType: "string"
                },
                type: {
                    enum: ["text", "cancel"]
                }
            }
        }
    }
});

db.createCollection("ticket_type_priority", {
    validator: {
        $jsonSchema: {
            bsonType: "object",
            required: ["type", "priority"],
            properties: {
                type: {
                    bsonType: "string"
                },
                priority: {
                    bsonType: "int"
                }
            }
        }
    }
});

db.createCollection("phone_call_trip", {
    validator: {
        $jsonSchema: {
            bsonType: "object",
            required: ["caller_id", "callee_id", "ticket_id", "duration", "date", "time"],
            properties: {
                caller_id: {
                    bsonType: "int"
                },
                callee_id: {
                    bsonType: "int"
                },
                ticket_id: {
                    bsonType: "int"
                },
                duration: {
                    bsonType: "string"
                },
                date: {
                    bsonType: "date"
                },
                time: {
                    bsonType: "string"
                },
                content: {
                    bsonType: "string"
                }
            }
        }
    }
});

db.createCollection("phone_call_hotel", {
    validator: {
        $jsonSchema: {
            bsonType: "object",
            required: ["caller_id", "callee_id", "ticket_id", "duration", "date", "time"],
            properties: {
                caller_id: {
                    bsonType: "int"
                },
                callee_id: {
                    bsonType: "int"
                },
                ticket_id: {
                    bsonType: "int"
                },
                duration: {
                    bsonType: "string"
                },
                date: {
                    bsonType: "date"
                },
                time: {
                    bsonType: "string"
                },
                content: {
                    bsonType: "string"
                }
            }
        }
    }
});