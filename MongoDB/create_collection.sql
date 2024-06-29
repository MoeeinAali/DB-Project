db.createCollection("trip_ticket", {
    validator: {
        $jsonSchema: {
            bsonType: "object",
            required: ["trip_reservation_id", "user_id", "examiner_id", "message", "type"],
            properties: {
                trip_reservation_id: {
                    bsonType: "int",
                    description: "must be an integer and is required"
                },
                company_id: {
                    bsonType: "int",
                    description: "must be an integer and is required"
                },
                user_id: {
                    bsonType: "int",
                    description: "must be an integer and is required"
                },
                examiner_id: {
                    bsonType: "int",
                    description: "must be an integer and is required"
                },
                message: {
                    bsonType: "string",
                    description: "must be a string and is required"
                },
                type: {
                    enum: ["text", "not satisfied"],
                    description: "can only be 'text' or 'not satisfied' and is required"
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
                    bsonType: "int",
                    description: "must be an integer and is required"
                },
                user_id: {
                    bsonType: "int",
                    description: "must be an integer and is required"
                },
                examiner_id: {
                    bsonType: "int",
                    description: "must be an integer and is required"
                },
                message: {
                    bsonType: "string",
                    description: "must be a string and is required"
                },
                type: {
                    enum: ["text", "cancel"],
                    description: "can only be 'text' or 'cancel' and is required"
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
                    bsonType: "string",
                    description: "must be a string and is required"
                },
                priority: {
                    bsonType: "int",
                    description: "must be an integer and is required"
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
                    bsonType: "int",
                    description: "must be an integer and is required"
                },
                callee_id: {
                    bsonType: "int",
                    description: "must be an integer and is required"
                },
                ticket_id: {
                    bsonType: "int",
                    description: "must be an integer and is required"
                },
                duration: {
                    bsonType: "string",
                    description: "must be a string and is required"
                },
                date: {
                    bsonType: "date",
                    description: "must be a date and is required"
                },
                time: {
                    bsonType: "string",
                    description: "must be a string and is required"
                },
                content: {
                    bsonType: "string",
                    description: "must be a string and is required"
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
                    bsonType: "int",
                    description: "must be an integer and is required"
                },
                callee_id: {
                    bsonType: "int",
                    description: "must be an integer and is required"
                },
                ticket_id: {
                    bsonType: "int",
                    description: "must be an integer and is required"
                },
                duration: {
                    bsonType: "string",
                    description: "must be a string and is required"
                },
                date: {
                    bsonType: "date",
                    description: "must be a date and is required"
                },
                time: {
                    bsonType: "string",
                    description: "must be a string and is required"
                },
                content: {
                    bsonType: "string",
                    description: "must be a string and is required"
                }
            }
        }
    }
});