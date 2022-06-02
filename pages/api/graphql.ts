import { ApolloServer } from 'apollo-server-micro';
import Cors from 'micro-cors';
import { schema } from '../../graphql/schema';
import { resolvers } from '../../graphql/resolvers';
import { context } from '../../graphql/context';

const cors = Cors();

const server = new ApolloServer({
  schema,
  resolvers,
  context,
});

const start = server.start();

async function handler(req: any, res: any) {
  if (req.method === 'OPTIONS') {
    res.end();
    return false;
  }

  await start;

  await server.createHandler({
    path: '/api/graphql',
  })(req, res);
}

export default cors(handler);

export const config = {
  api: {
    bodyParser: false,
  },
};
