import {Request, Response} from 'express'
import { PrismaClient } from '@prisma/client'
import { User } from '../types/user';



const prisma = new PrismaClient();

export class UserController {
  async createUser(req: Request, res: Response) {
    const { email, username }: User = req.body;
    try {
      const user = await prisma.user.create({
        data: { email: email, username: username },
      });
      res.status(200).json(user);
    } catch (error) {
      res.status(400).json(error);
    }
  }
  async getUsers(req: Request, res: Response) {
    const users = await prisma.user.findMany();
    res.status(200).json(users)
  }
  async getUser(req: Request, res: Response) {
    const { id} = req.params;
    const user = await prisma.user.findUnique({
      where: {
        id : id
      }
    });
    res.status(200).json(user)
  }
  async deleteUser(req: Request, res: Response) {
    const { id } = req.params;
    const user = await prisma.user.delete({
      where: {
        id: id
      }
    });
    res.status(200).json(`${user.username} deleted`)
  }
}
