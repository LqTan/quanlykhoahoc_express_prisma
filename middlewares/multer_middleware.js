const multer = require('multer');
const path = require("path");

const storage = multer.diskStorage({
    destination: (req, file, cb) => {
        cb(null, path.join(__dirname, '../public/images'));
    },
    filename: (req, file, cb) => {
        const {username} = req.body;
        const filename = `${username}_avatar${path.extname(file.originalname)}`;
        cb(null, filename);
    },
});

const upload = multer({storage});

module.exports = {upload};