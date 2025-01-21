const db = require('../config/db');

// Signup
exports.signup = (req, res) => {

    const { first_name, last_name, email, password } = req.body;

    if (email && password && first_name && last_name) {
        return res.send({
            "code": 1,
            "message": "sucess response",
            "data": [email,
                first_name,
                last_name,
                email,
                password
            ]
        });
    }
    else {
        return res.send({
            "code": 0,
            "message": "Invalid Request",
            "data": null
        });
    }
};

// Login
exports.login = (req, res) => {
    const { email, password } = req.body;

    if (!email && password) {
        return res.send({
            "code": 0,
            "message": "Invalid Request",
            "data": null
        });
    }
    else {
        return res.send({
            "code": 1,
            "message": "sucess response",
            "data": [email,
                password
            ]
        });
    }

};

