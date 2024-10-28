require('dotenv').config();
const express = require('express');
const router = express.Router();
const {PrismaClient} = require('@prisma/client');
const {authenticateJWT} = require('../middlewares/jwt_middleware');
const {upload} = require('../middlewares/multer_middleware');
const prisma = new PrismaClient();

router.post('/', upload.single('course_thumbnail'), authenticateJWT, async (req, res) => {
    const {
        id_course,
        title,
        opening_day,
        original_fee,
        current_fee,
        id_curriculum,
    } = req.body;

    // Chuyển đổi original_fee và current_fee thành float
    const originalFeeValue = parseFloat(original_fee);
    const currentFeeValue = parseFloat(current_fee);
    const course_thumbnail = req.file ? `${req.protocol}://${req.get('host')}/images/${req.file.filename}` : null;

    if (title === await prisma.course.findFirst( { where: { title: title } })) {
        return res.status(401).json({ error: 'Course title already exists' });
    }

    try {
        const course = await prisma.course.create({
            data: {
                id_course,
                title,
                opening_day,
                original_fee: originalFeeValue,
                current_fee: currentFeeValue,
                course_thumbnail: course_thumbnail,
                id_curriculum,
            },
        });
        res.status(201).json(course);
    } catch (error) {
        res.status(400).json({error: error.message});
    }
});

router.get('/', async (req, res) => {
    try {
        const courses = await prisma.course.findMany();
        res.status(200).json(courses);
    } catch (error) {
        res.status(400).json({error: error.message});
    }
});

router.get('/:id', async (req, res) => {
    const {id} = req.params;
    try {
        const course = await prisma.course.findUnique({
            where: {id_course: id},
        });
        if (!course) {
            return res.status(404).json({ error: 'Course not found' });
        }
        res.status(200).json(course);
    } catch (error) {
        res.status(400).json({error: error.message});
    }
});

router.put('/:id', upload.single('course_thumbnail'), authenticateJWT, async (req, res) => {
    const {id} = req.params;
    const {
        title,
        opening_day,
        original_fee,
        current_fee,
        id_curriculum,
    } = req.body;

    // Chuyển đổi original_fee và current_fee thành float
    const originalFeeValue = parseFloat(original_fee);
    const currentFeeValue = parseFloat(current_fee);
    const course_thumbnail = req.file ? `${req.protocol}://${req.get('host')}/images/${req.file.filename}` : null;
    try {
        const course = await prisma.course.update({
            where: {id_course: id},
            data: {
                title,
                opening_day,
                original_fee: originalFeeValue,
                current_fee: currentFeeValue,
                course_thumbnail: course_thumbnail,
                id_curriculum,
            },
        });
        res.status(200).json(course);
    } catch (error) {
        res.status(400).json({error: error.message});
    }
});

router.delete('/:id', authenticateJWT, async (req, res) => {
    const {id} = req.params;
    try {
        await prisma.course.delete({
            where: {id_course: id},
        });
        res.status(204).end();
    } catch (error) {
        res.status(400).json({error: error.message});
    }
});

module.exports = router;