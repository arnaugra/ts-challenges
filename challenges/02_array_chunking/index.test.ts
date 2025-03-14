import { arrayChunking } from "."

describe("arrayChunking", () => {
    test("splits an array of 10 elements into chunks of size 3", () => {
        expect(arrayChunking([1, 2, 3, 4, 5, 6, 7, 8, 9, 10], 3)).toEqual([
            [1, 2, 3],
            [4, 5, 6],
            [7, 8, 9],
            [10],
        ]);
    });

    test("splits an array of 5 elements into chunks of size 2", () => {
        expect(arrayChunking([1, 2, 3, 4, 5], 2)).toEqual([
            [1, 2],
            [3, 4],
            [5],
        ]);
    });

    test("returns the same array inside another array when chunk size is greater than or equal to array length", () => {
        expect(arrayChunking([1, 2, 3, 4, 5], 5)).toEqual([[1, 2, 3, 4, 5]]);
        expect(arrayChunking([1, 2, 3, 4, 5], 6)).toEqual([[1, 2, 3, 4, 5]]);
    });

    test("returns an empty array when given an empty array", () => {
        expect(arrayChunking([], 3)).toEqual([]);
    });

    test("handles an array with a single element", () => {
        expect(arrayChunking([7], 2)).toEqual([[7]]);
    });

    test("handles a chunk size of 1", () => {
        expect(arrayChunking([1, 2, 3, 4], 1)).toEqual([[1], [2], [3], [4]]);
    });
})
