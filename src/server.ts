
import express from 'express';
import { route } from './routes'
const app = express();
app.use(express.json())

app.use(route)

app.listen(process.env.port || 3333, () => {
  console.log('server listening on port 3333')
});

