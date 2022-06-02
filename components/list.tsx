import React from 'react';

function List<T>({
  items,
  render,
}: {
  items: T[];
  render: (item: T) => React.ReactNode;
}) {
  return (
    <ul role="list" className="divide-y divide-gray-200">
      {items.map((item, index) => (
        <li key={index} className="py-4">
          {render(item)}
        </li>
      ))}
    </ul>
  );
}

export default List;
