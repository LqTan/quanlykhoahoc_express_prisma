require('dotenv').config();
const express = require('express');
const router = express.Router();
const {PrismaClient} = require('@prisma/client');
const {authenticateJWT} = require('../middlewares/jwt_middleware');
const prisma = new PrismaClient();

router.post('/', authenticateJWT, async (req, res) => {
    const { id_class, class_name, start_time, end_time, location, id_course } = req.body;

    // Xác nhận định dạng "HH:mm" cho start_time và end_time
    const timePattern = /^([0-1]\d|2[0-3]):([0-5]\d)$/;
    if (!timePattern.test(start_time) || !timePattern.test(end_time)) {
        return res.status(400).json({ error: 'Time must be in HH:mm format' });
    }

    try {
        const newClass = await prisma.class.create({
            data: {
                id_class,
                class_name,
                start_time,
                end_time,
                location,
                id_course,
            },
        });
        res.status(201).json(newClass);
    } catch (error) {
        res.status(400).json({ error: error.message });
    }
});

router.get('/', async (req, res) => {
    try {
        const classes = await prisma.class.findMany();
        res.status(200).json(classes);
    } catch (error) {
        res.status(400).json({ error: error.message });
    }
});

router.get('/:id', async (req, res) => {
    const { id } = req.params;
    try {
        const classDetail = await prisma.class.findUnique({
            where: { id_class: id },
        });
        if (!classDetail) {
            return res.status(404).json({ error: 'Class not found' });
        }
        res.status(200).json(classDetail);
    } catch (error) {
        res.status(400).json({ error: error.message });
    }
});

router.put('/:id', authenticateJWT, async (req, res) => {
    const { id } = req.params;
    const { class_name, start_time, end_time, location, id_course } = req.body;
    const timePattern = /^([0-1]\d|2[0-3]):([0-5]\d)$/;
    if (!timePattern.test(start_time) || !timePattern.test(end_time)) {
        return res.status(400).json({ error: 'Time must be in HH:mm format' });
    }
    try {
        const updatedClass = await prisma.class.update({
            where: { id_class: id },
            data: { class_name, start_time, end_time, location, id_course },
        });
        res.status(200).json(updatedClass);
    } catch (error) {
        res.status(400).json({ error: error.message });
    }
});

router.delete('/:id', authenticateJWT, async (req, res) => {
    const { id } = req.params;
    try {
        await prisma.class.delete({
            where: { id_class: id },
        });
        res.status(204).end();
    } catch (error) {
        res.status(400).json({ error: error.message });
    }
});

router.post('/join/:id', authenticateJWT, async (req, res) => {
    const { id } = req.params;
    const { id_account } = req.body;
    try {
        const classExist = await prisma.class.findUnique({
            where: { id_class: id },
        });
        if (!classExist) {
            return res.status(404).json({ error: 'Class not found' });
        }
        const accountExist = await prisma.account.findUnique({
            where: { id_account },
        });
        if (!accountExist) {
            return res.status(404).json({ error: 'Account not found' });
        }
        const newClassMember = await prisma.accountClass.create({
            data: {
                id_class: id,
                id_account,
            },
        });
        res.status(201).json(newClassMember);
    } catch (error) {
        res.status(400).json({ error: error.message });
    }
});

module.exports = router;