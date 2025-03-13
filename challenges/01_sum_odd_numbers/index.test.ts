import { sumOddNumbersInRange } from '.';

describe('sumOddNumbersInRange', () => {
    it('debería devolver 25 para el rango de 1 a 10', () => {
        expect(sumOddNumbersInRange(1, 10)).toBe(25);
    });

    it('debería devolver 15 para el rango de 4 a 8', () => {
        expect(sumOddNumbersInRange(4, 8)).toBe(12);
    });

    it('debería devolver 0 cuando el rango no contiene impares (8 a 8)', () => {
        expect(sumOddNumbersInRange(8, 8)).toBe(0);
    });

    it('debería devolver 0 cuando no hay impares en el rango (2 a 4)', () => {
        expect(sumOddNumbersInRange(2, 4)).toBe(3);
    });

    it('debería devolver 0 cuando el rango es invertido (10 a 1)', () => {
        expect(sumOddNumbersInRange(10, 1)).toBe(-1);
    });
});