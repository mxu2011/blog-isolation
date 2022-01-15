import { DocumentClient } from 'aws-sdk/clients/dynamodb';
import { Credentials } from 'aws-sdk/lib/credentials';

export const readItems = async (pk: string, credentials?: Credentials, gsi?: string): Promise<any> => {
  const db = credentials ? new DocumentClient(credentials) : new DocumentClient();
  const TableName = `${process.env.TableName}`;
  const query: DocumentClient.QueryInput = {
    TableName,
    KeyConditionExpression: '#PK = :PK',
    ExpressionAttributeNames: {
      '#PK': gsi ? 'PK1' : 'PK',
    },
    ExpressionAttributeValues: {
      ':PK': `Tenant#${pk}`,
    },
  };
  if (gsi) {
    query.IndexName = 'gsi';
  }

  try {
    const queryResults = await db.query(query).promise();
    console.log(`query= ${JSON.stringify(query)}, queryResults = ${JSON.stringify(queryResults)}}`);
    return queryResults.Items || [];
  } catch (error) {
    console.log(`Dynamodb exception. Details: ${JSON.stringify(error)}`);
  }
};