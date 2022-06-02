import type { NextPage } from 'next';
import Card from '../../components/card';

const Admin: NextPage = () => {
  return (
    <div className="flex h-screen  items-center justify-center">
      <Card>
        <Card.Header title="Manufacturer" />
      </Card>
    </div>
  );
};

export default Admin;
