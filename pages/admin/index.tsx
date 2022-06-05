import type { NextPage } from 'next';
import Card from '../../components/card';
import { useManufacturers } from '../../hooks/useManufacturers';
import List from '../../components/list';

const Admin: NextPage = () => {
  const { manufacturers } = useManufacturers([
    { id: 1, name: 'Toyota', isActive: true },
    { id: 2, name: 'Honda', isActive: true },
    { id: 3, name: 'Kia', isActive: true },
  ]);

  return (
    <div className="flex h-screen items-center justify-center">
      <Card>
        <Card.Header title="Manufacturer" />
        <List
          items={manufacturers}
          render={(manufacturer) => <>{manufacturer.name}</>}
        />
      </Card>
    </div>
  );
};

export default Admin;
