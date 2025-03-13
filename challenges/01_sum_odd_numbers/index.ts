export function sumOddNumbersInRange(start: number, end: number): number {
    if (start > end) return -1

    let result: number = 0
    for (let i: number = start; i <= end; i++) {
        if (i % 2 !== 0) result += i

    }
    return result
}