const p = new Promise((resolve, reject) => {
    // Kick off async work
    // ...
    console.log(`Starting timer...`);
    setTimeout(() => {
        // resolve(1); // completed successfuly
        reject(new Error("error message")); // error happened
    }, 2000);
});

p.then((result) => console.log("Result: ", result)) //asd
    .catch((err) => console.log("Error: ", err.message));
