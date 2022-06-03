import { useReducer, useCallback } from 'react';

type Manufacturer = {
  id: number;
  name: string;
  isActive: boolean;
};

type ManufacturerAction =
  | { type: 'ADD'; name: string }
  | { type: 'REMOVE' | 'SET_IS_ACTIVE'; id: number };

export function useManufacturers(initialManufacturers: Manufacturer[]) {
  const [manufacturers, dispatch] = useReducer(
    (state: Manufacturer[], action: ManufacturerAction) => {
      switch (action.type) {
        case 'ADD':
          return [
            ...state,
            {
              id: state.length,
              name: action.name,
              isActive: true,
            },
          ];
        case 'REMOVE':
          return state.filter(({ id }) => id !== action.id);
        case 'SET_IS_ACTIVE':
          return state.map((manufacturer) => {
            if (manufacturer.id === action.id) {
              return { ...manufacturer, isActive: !manufacturer.isActive };
            }
            return manufacturer;
          });
        default:
          throw new Error();
      }
    },
    initialManufacturers
  );

  const addManufacturer = useCallback((name: string) => {
    dispatch({
      type: 'ADD',
      name,
    });
  }, []);

  const removeManufacturer = useCallback((id: number) => {
    dispatch({
      type: 'REMOVE',
      id,
    });
  }, []);

  const setIsActive = useCallback((id: number) => {
    dispatch({
      type: 'SET_IS_ACTIVE',
      id,
    });
  }, []);

  return { manufacturers, addManufacturer, removeManufacturer, setIsActive };
}
