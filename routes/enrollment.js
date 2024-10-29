require('dotenv').config();
const express = require('express');
const router = express.Router();
const {PrismaClient} = require('@prisma/client');
const {authenticateJWT} = require('../middlewares/jwt_middleware');
const prisma = new PrismaClient();

router.post('/', authenticateJWT, async (req, res) => {
    const { id_class, id_account } = req.body;
    try {
        const enrollmentExist = await prisma.enrollment.findFirst({
            where: {
                id_class,
                id_account,
            },
        });
        if (enrollmentExist) {
            return res.status(400).json({ error: 'Account already enrolled in this class' });
        }
        const newEnrollment = await prisma.enrollment.create({
            data: {
                id_class,
                id_account,
            },
        });
        res.status(201).json(newEnrollment);
    } catch (error) {
        res.status(400).json({ error: error.message });
    }
});

router.get('/', async (req, res) => {
    try {
        const enrollments = await prisma.enrollment.findMany();
        res.status(200).json(enrollments);
    } catch (error) {
        res.status(400).json({ error: error.message });
    }
});

router.get('/:id', async (req, res) => {
    const { id } = req.params;
    try {
        const enrollment = await prisma.enrollment.findUnique({
            where: { id_enrollment: id },
        });
        res.status(200).json(enrollment);
    } catch (error) {
        res.status(400).json({ error: error.message });
    }
});

router.put('/:id', authenticateJWT, async (req, res) => {
    const { id } = req.params;
    const { id_class, id_account } = req.body;
    try {
        const enrollment = await prisma.enrollment.update({
            where: { id_enrollment: id },
            data: {
                id_class,
                id_account,
            },
        });
        res.status(200).json(enrollment);
    } catch (error) {
        res.status(400).json({ error: error.message });
    }
});

router.delete('/:id', authenticateJWT, async (req, res) => {
    const { id } = req.params;
    try {
        await prisma.enrollment.delete({
            where: { id_enrollment: id },
        });
        res.status(204).end();
    } catch (error) {
        res.status(400).json({ error: error.message });
    }
});

module.exports = router;