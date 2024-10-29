const multer = require('multer');
const path = require("path");

// Danh sách các thư mục hợp lệ trong public
const validDirectories = ['images', 'uploads', 'thumbnails']; // Thêm các thư mục khác nếu cần

const storage = (directory) => {
    if (!validDirectories.includes(directory)) {
        throw new Error(`Invalid directory: ${directory}. Valid options are: ${validDirectories.join(', ')}`);
    }

    return multer.diskStorage({
        destination: (req, file, cb) => {
            const destination = path.join(__dirname, `../public/${directory}`);
            cb(null, destination);
        },
        filename: (req, file, cb) => {
            const { username } = req.body;
            const filename = `${username}_avatar${path.extname(file.originalname)}`;
            cb(null, filename);
        },
    });
};

// Tạo upload function nhận vào tên thư mục
const upload = (directory) => multer({ storage: storage(directory) });

module.exports = { upload };
