import { Router } from "express";
import { UserController } from "../controllers/UserController";

export const route = Router()
 
const userController = new UserController();


route.post("/user/new", userController.createUser)
route.get("/users", userController.getUsers)
route.get("/user/:id", userController.getUser)
route.delete("/user/:id", userController.deleteUser)