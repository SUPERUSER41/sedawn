import { objectType } from 'nexus';

export const Manufacturer = objectType({
  name: 'Manufacturer',
  definition(t) {
    t.int('id');
    t.string('name');
    t.boolean('isActive');
  },
});
