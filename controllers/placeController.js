const db = require('../config/db');

// Place Details

exports.placeReciewDisc = (req, res) => {
    const { placeName } = req.params;
    console.log(placeName);
    if (placeName) {
        return res.send({
            "code": 1,
            "message": "sucess response",
            "data": {
                "placeName": placeName // Sending place name as part of the data object
            }
        });
    }

    var response = {
        "code": 0,
        "message": "Invalid Request",
        "data": null
    };
    res.send(response);
};

exports.placeReview = (req, res) => {
    const { disc, first_name, last_name, email } = req.body;

    if (disc && first_name && last_name && email) {
        return res.status(400).send({
            "code": 1,
            "message": "sucess response",
            "data": {
                "placereview": disc, // Sending place name as part of the data object
                "first_name": first_name,
                "last_name": last_name,
                "email": email
            }
        });
    }

    var response = {
        "code": 0,
        "message": "Invalid Request",
        "data": null
    };

    res.send(response);
}