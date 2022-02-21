function compare(arr) {
  base = arr[0];

  for (i = 1; i < arr.length; i++) {
    next = arr[i];

    for (j = 0; j < base.length; j++) {
      if (next[j] !== base[j]) {
        return false;
      }
    }
  }
  return true;
}

good_arr1 = [
  [1, 2, 3, 4],
  [1, 2, 3, 4],
];
bad_arr1 = [
  [1, 2, 3, 4],
  [1, 4, 3, 2],
];
good_arr2 = [
  [1, 2, 3, 4],
  [1, 2, 3, 4],
  [1, 2, 3, 4],
  [1, 2, 3, 4],
  [1, 2, 3, 4],
  [1, 2, 3, 4],
  [1, 2, 3, 4],
];

console.log("comparing ", bad_arr1);
console.log(compare(bad_arr1));
console.log("comparing ", good_arr1);
console.log(compare(good_arr1));
console.log("comparing ", good_arr2);
console.log(compare(good_arr2));
