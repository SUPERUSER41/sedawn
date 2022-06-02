import { extendType, objectType } from 'nexus';

export const Manufacturer = objectType({
  name: 'Manufacturer',
  definition(t) {
    t.int('id');
    t.string('name');
    t.boolean('isActive');
  },
});

export const ManufacturerQuery = extendType({
  type: 'Query',
  definition(t) {
    t.nonNull.list.field('manufacturers', {
      type: Manufacturer,
      resolve(_parent, _args, ctx) {
        return ctx.prisma.manufacturer.findMany();
      },
    });
  },
});
