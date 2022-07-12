Array.prototype.uniq = function() {
    let frequency = {};
    for (let i = 0; i < this.length; i++) {
        frequency[this[i]] = 0; 
    }
    return Object.keys(frequency);
}

console.log([5,3].uniq());

Array.prototype.twoSum = function(target) {
    
    let indices = {};
    let pairs = []
    for (let i = 0; i < this.length; i++) {
        if ((target - this[i]) in indices) {
            pairs.push([i, indices[target - this[i]]]);
        }
        indices[this[i]] = i;
    }
    return pairs
}

Array.prototype.transpose = function() {
    let n = this.length
    let m = this[0].length
    let newMatrix = [];
    for (var i=0; i<m; i++){
        newMatrix[i] = new Array(n)
    }
    for (let i = 0; i < n; i++){
        for (let j = 0; j < m; j++){ 
            newMatrix[j][i] = this[i][j];
        }
    }
    return newMatrix  
}