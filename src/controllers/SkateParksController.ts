import { Request, Response } from 'express'
import { PrismaClient } from '@prisma/client'
import { Skatepark } from '../types/skatepark';



const prisma = new PrismaClient();

export class SkateParksController {
  async createPark(req: Request, res: Response) {
    const { parkname, latitude ,longitude } : Skatepark = req.body
    const { userid }  = req.headers;
    try {
      const skatepark : Skatepark = await prisma.skateParks.create({
        data: { 
          parkname: parkname,   
          latitude: latitude,       
          longitude: longitude,
          userId: `${userid}`
         },
      });
      res.status(200).json(skatepark);
    } catch (error) {
      res.status(400).json(error);
    }
  }
  async getSkatePaks(req: Request, res: Response) {
    const skateParks = await prisma.skateParks.findMany();
    res.status(200).json(skateParks)
  }
  async getSkatepark(req: Request, res: Response) {
    const { id } = req.params;
    const skatepark = await prisma.skateParks.findUnique({
      where: {
        id: id
      }
    });
    res.status(200).json(skatepark)
  }
  async deleteSkatePark(req: Request, res: Response) {
    const { id } = req.params;
    const skatepark = await prisma.skateParks.delete({
      where: {
        id: id
      }
    });
    res.status(200).json(`${skatepark.parkname} deleted`)
  }
}
