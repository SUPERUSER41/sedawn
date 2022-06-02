import { ApolloClient, InMemoryCache } from '@apollo/client';

const apolloClient = new ApolloClient({
  uri: 'http://localhost:3000/api/graphql', //TODO: create an environment variable for this
  cache: new InMemoryCache(),
});

export default apolloClient;
