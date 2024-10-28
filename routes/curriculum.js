require('dotenv').config();
const express = require('express');
const router = express.Router();
const {PrismaClient} = require('@prisma/client');
const {authenticateJWT} = require('../middlewares/jwt_middleware');
const prisma = new PrismaClient();

router.post('/', authenticateJWT, async (req, res) => {
    const {id_curriculum, title} = req.body;

    if (title === await prisma.curriculum.findFirst( { where: { title: title } })) {
        return res.status(401).json({ error: 'Curriculum title already exists' });
    }

    try {
        const curriculum = await prisma.curriculum.create({
            data: {id_curriculum, title},
        });
        res.status(201).json(curriculum);
    } catch (error) {
        res.status(400).json({error: error.message});
    }
});

router.get('/', async (req, res) => {
    try {
        const curriculums = await prisma.curriculum.findMany();
        res.status(200).json(curriculums);
    } catch (error) {
        res.status(400).json({error: error.message});
    }
});

router.get('/:id', async (req, res) => {
    const {id} = req.params;
    try {
        const curriculum = await prisma.curriculum.findUnique({
            where: {id_curriculum: id},
        });
        if (!curriculum) {
            return res.status(404).json({ error: 'Curriculum not found' });
        }
        res.status(200).json(curriculum);
    } catch (error) {
        res.status(400).json({error: error.message});
    }
});

router.put('/:id', authenticateJWT, async (req, res) => {
    const {id} = req.params;
    const {title} = req.body;
    try {
        const curriculum = await prisma.curriculum.update({
            where: {id_curriculum: id},
            data: {title},
        });
        res.status(200).json(curriculum);
    } catch (error) {
        res.status(400).json({error: error.message});
    }
});

router.delete('/:id', authenticateJWT, async (req, res) => {
    const {id} = req.params;
    try {
        await prisma.curriculum.delete({
            where: {id_curriculum: id},
        });
        res.status(204).end();
    } catch (error) {
        res.status(400).json({error: error.message});
    }
});

module.exports = router;