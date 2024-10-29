require('dotenv').config();
const express = require('express');
const router = express.Router();
const {PrismaClient} = require('@prisma/client');
const {authenticateJWT} = require('../middlewares/jwt_middleware');
const prisma = new PrismaClient();

router.post('/', authenticateJWT, async (req, res) => {
    const {
        subject,
        message,
        attachedFile,
        id_enrollment,
    } = req.body;

    try {
        const newPost = await prisma.post.create({
            data: {
                subject,
                message,
                timestamp: new Date().toLocaleString(),
                attachedFile,
                id_enrollment,
            },
        });
        res.status(201).json(newPost);
    } catch (error) {
        res.status(400).json({error: error.message});
    }
});

router.get('/', async (req, res) => {
    try {
        const posts = await prisma.post.findMany();
        res.status(200).json(posts);
    } catch (error) {
        res.status(400).json({error: error.message});
    }
});

router.get('/:id', async (req, res) => {
    const {id} = req.params;
    try {
        const postDetail = await prisma.post.findUnique({
            where: {id_post: id},
        });
        if (!postDetail) {
            return res.status(404).json({error: 'Post not found'});
        }
        res.status(200).json(postDetail);
    } catch (error) {
        res.status(400).json({error: error.message});
    }
});

router.put('/:id', authenticateJWT, async (req, res) => {
    const {id} = req.params;
    const {subject, message, timestamp, attachedFile, id_environment} = req.body;
    try {
        const updatedPost = await prisma.post.update({
            where: {id_post: id},
            data: {
                subject,
                message,
                timestamp,
                attachedFile,
                id_environment,
            },
        });
        res.status(200).json(updatedPost);
    } catch (error) {
        res.status(400).json({error: error.message});
    }
});

router.delete('/:id', authenticateJWT, async (req, res) => {
    const {id} = req.params;
    try {
        await prisma.post.delete({
            where: {id_post: id},
        });
        res.status(204).end();
    } catch (error) {
        res.status(400).json({error: error.message});
    }
});

router.get('/by-class/:id_class', async (req, res) => {
    const { id_class } = req.params;

    try {
        const posts = await prisma.post.findMany({
            where: {
                Enrollment: {
                    id_class: id_class,
                },
            },
            include: {
                Enrollment: {
                    include: {
                        Account: true, // Bao gồm chi tiết Account
                    },
                },
            },
        });
        res.status(200).json(posts);
    } catch (error) {
        res.status(400).json({ error: error.message });
    }
});



module.exports = router;