
function range(start, end) {
    // let result = []
    // if (start <= end) {
    //     result.push(start)
    //     result.concat(range(start + 1, end))
    // }
    // return result

    if (end < start) return [];
    return [start].concat(range(start+1, end))
}

function sumRec(arr) {
    if (arr.length === 0) return 0;
    return arr[0] + sumRec(arr.slice(1))
}

function exponent(base, exp) {
    if (exp === 0) return 1;
    return base * exponent(base, exp - 1)
}

function deepDup(arr) {

    if (arr.length === 0) return [];
    if (Array.isArray(arr[0])) {
        return [deepDup(arr[0])].concat(deepDup(arr.slice(1)))
    } else {
        return [arr[0]].concat(deepDup(arr.slice(1)))
    }
}

// 0, 1, 1, 2, 3, 5

function fibonacci(n) {
    if (n === 1) return [0];
    if (n === 2) return [0, 1];
    let temp = fibonacci(n - 1)
    return temp.concat([temp[temp.length - 1] + temp[temp.length - 2]])
}

function bsearch(arr, target) {
    if (arr.length === 0) return -1
    let mid = Math.floor(arr.length/2)
    if (target === arr[mid]) return mid
    else if (target < arr[mid])
        return bsearch(arr.slice(0, mid), target)
    else
        return mid+1 + bsearch(arr.slice(mid + 1), target)
}

function merge(arr1, arr2) {
    let merged = []
    let i = 0
    let j = 0
    arr1.push(Infinity)
    arr2.push(Infinity)
    while (i < arr1.length-1 || j < arr2.length-1) {
        if (arr1[i] < arr2[j]) {
            merged.push(arr1[i])
            i++
        } else {
            merged.push(arr2[j])
            j++
        }
    }
    return merged
}

function mergesort(arr) {
    if (arr.length <= 1) return arr

    let mid = Math.floor(arr.length/2)

    let first = mergesort(arr.slice(0, mid))
    let second = mergesort(arr.slice(mid))

    return merge(first, second)

}

function subsets(arr) {
    if (arr.length === 0) return [[]];
    let set = subsets(arr.slice(1))
    let n = set.length 
    for (let i = 0; i < n; i++) {
        set.push(set[i].concat([arr[0]]))
    }
    return set
}

console.log(range(1, 3))
console.log(sumRec([1,2,3]))
console.log(exponent(2, 3))
console.log(fibonacci(7))
console.log(deepDup([[1],[[2]],[[[3, 5]], 5]]))
console.log(bsearch([2,5,7,12,15], 15))
console.log(merge([1,3,5], [2,4]))
console.log(mergesort([6,8,3,5,21,17,5]))
console.log(subsets([1,3,5]))

