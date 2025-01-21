const express = require('express');
const router = express.Router();
const placeController = require('../controllers/placeController');

router.get('/review/:placeName', placeController.placeReciewDisc);
router.post('/review/:placeName', placeController.placeReview);

module.exports = router;
