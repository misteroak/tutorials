// // Promises that are already resolved or rejected
// const p_resolved = Promise.resolve({id: 1}) // returns a promise that is already resolved
// const p_rejected = Promise.reject(new Error(`Error!!`)) // returns a promise that is already rejected
// p_resolved.then(res => console.log(res));
// p_rejected.catch(err => console.log(err.message));

// Running promises in parallel
const p1 = new Promise((resolve, reject) => {
    setTimeout(() => {
        // console.log("Async operation 1 done!");
        resolve(1);
        // reject(new Error("something bad happened"));
    }, 2000);
});

const p2 = new Promise((resolve) => {
    setTimeout(() => {
        // console.log("Async operation 2 done!");
        resolve(2);
    }, 5000);
});

// Promise.all([p1, p2])
//     .then((result) => console.log(`All result: ${result}`))
//     .catch((err) => console.log(err)); // returns a new promise that resolved when all the promisses in this array are resolved

Promise.race([p1, p2])
    .then((result) => console.log(`Race result: ${result}`))
    .catch((err) => console.log(err)); // returns a new promise that resolved when all the promisses in this array are resolved
