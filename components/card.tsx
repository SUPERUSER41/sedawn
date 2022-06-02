import React, { ReactNode } from 'react';

type CardProps = {
  children: ReactNode;
};

type HeaderProps = {
  title: string;
};

const Header = ({ title }: HeaderProps) => {
  return (
    <div className="flex w-full items-center justify-between space-x-8">
      <h3 className="text-lg font-medium leading-6 text-gray-900">{title}</h3>
      <div className="flex-shrink-0">
        <button
          type="button"
          className="relative inline-flex items-center rounded-md border border-transparent bg-blue-600 px-4 py-2 text-sm font-medium text-white shadow-sm hover:bg-blue-700 focus:outline-none focus:ring-2 focus:ring-blue-500 focus:ring-offset-2"
        >
          Add new
        </button>
      </div>
    </div>
  );
};

const Card = ({ children }: CardProps) => {
  return (
    <div className="space-y-4 rounded-2xl border bg-white px-4 py-5 sm:px-6">
      {children}
    </div>
  );
};

Card.Header = Header;

export default Card;
