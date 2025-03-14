export function arrayChunking(arr: number[], size: number): number[][] {
    if (arr.length == 0) return []

    let final_arr: number[][] = []
    for (let i: number = 0; i < arr.length; i += size) {
        final_arr.push(arr.slice(i, i + size))
    }

    return final_arr
}