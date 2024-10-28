require('dotenv').config();
const jwt = require('jsonwebtoken');
const express = require('express');
const router = express.Router();
const {PrismaClient} = require('@prisma/client');
const {authenticateJWT} = require('../middlewares/jwt_middleware');
const {upload} = require('../middlewares/multer_middleware');
const prisma = new PrismaClient();

const SECRET_KEY = process.env.SECRET_KEY;
router.post('/login', async (req, res) => {
    const {username, password} = req.body;
    try {
        const account = await prisma.account.findFirst({
            where: { username },
        });

        if (!account) {
            return res.status(401).json({ error: 'Invalid username or password' });
        }

        if (account.password !== password) {
            return res.status(401).json({ error: 'Invalid username or password' });
        }

        // Tạo JWT
        const token = jwt.sign({ id: account.id_account }, SECRET_KEY, { expiresIn: '1h' });

        res.status(200).json({ token });
    } catch (error) {
        res.status(400).json({error: error.message});
        console.log(error.message);
    }
});

// Create a new account
router.post('/', upload.single('avatar'), async (req, res) => {
    const {id_account, username, password} = req.body;
    const avatarFile = req.file ? `${req.protocol}://${req.get('host')}/images/${req.file.filename}` : null;

    if (username === await prisma.account.findFirst( { where: { username: username } })) {
        return res.status(401).json({ error: 'Username already exists' });
    }

    try {
        const account = await prisma.account.create({
            data: {id_account, username, password, avatar: avatarFile},
        });
        res.status(201).json(account);
    } catch (error) {
        res.status(400).json({error: error.message});
    }
});

// Read all accounts
router.get('/', authenticateJWT, async (req, res) => {
    try {
        const accounts = await prisma.account.findMany();
        res.status(200).json(accounts);
    } catch (error) {
        res.status(400).json({error: error.message});
    }
});

// Read an account by id
router.get('/:id',authenticateJWT, async (req, res) => {
    const {id} = req.params;
    try {
        const account = await prisma.account.findUnique({
            where: {id_account: id},
        });
        if (account) {
            res.status(200).json(account);
        } else {
            res.status(404).json({error: 'Account not found'});
        }
    } catch (error) {
        res.status(400).json({error: error.message});
    }
});

// Update an account
router.put('/:id', authenticateJWT, upload.single('avatar'), async (req, res) => {
    const {id} = req.params;
    const {username, password} = req.body;
    const avatar = req.file ? `${req.protocol}://${req.get('host')}/images/${req.file.filename}` : null;
    try {
        const account = await prisma.account.update({
            where: {id_account: id},
            data: {username, password, avatar},
        });
        res.status(200).json(account);
    } catch (error) {
        res.status(400).json({error: error.message});
    }
});

// Delete an account
router.delete('/:id', authenticateJWT, async (req, res) => {
    const {id} = req.params;
    try {
        await prisma.account.delete({
            where: {id_account: id},
        });
        res.status(204).end();
    } catch (error) {
        res.status(400).json({error: error.message});
    }
});

module.exports = router;