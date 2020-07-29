// // 1 - Callback hell version
// console.log("Before");
// getUser(1, (user) => {
//   getRepositories(user.gitHubUserName, (repos) => {
//     console.log(`Found ${repos.length} repos: ${repos}`);
//   });
// });
// console.log("After");

// function getUser(id, callback) {
//   console.log("Reading a user from a db...");
//   setTimeout(() => {
//     callback({ id: id, gitHubUserName: "mosh" });
//   }, 1200);
// }

// function getRepositories(username, callback) {
//   console.log("Fetching github repos...");
//   setTimeout(() => {
//     callback(["repo1", "repo2", "repo3"]);
//   }, 500);
// }

////////////////////////////////////////////////////////////////////////////////

// // 2 -  Named Functions
// console.log("Before");
// getUser(1, getUserRepos);
// console.log("After");

// function getUser(id, callback) {
//   console.log("Reading a user from a db...");
//   setTimeout(() => {
//     callback({ id: id, gitHubUserName: "mosh" });
//   }, 1200);
// }

// function getUserRepos(user) {
//   fetchRepositories(user.gitHubUserName, displayRepos);
// }

// function displayRepos(repos) {
//   console.log(`Found ${repos.length} repos: ${repos}`);
// }

// function fetchRepositories(username, callback) {
//   console.log("Fetching github repos...");
//   setTimeout(() => {
//     callback(["repo1", "repo2", "repo3"]);
//   }, 500);
// }

////////////////////////////////////////////////////////////////////////////////

// 3 - Promises
// getUser(1)
//     .then(user => getRepositories(user))
//     .then(repos => getCommits(repos))
//     .then(commits => printCommits(commits))
//     .catch(error => console.log(error));

// function getUser(id) {
//     console.log(`Searching db for user id ${id}...`);
//     return new Promise((resolve, reject) => {
//         setTimeout(() => {
//             resolve({ id: id, gitHubUserName: "mosh" });
//         }, 1200);
//     });
// }

// function getRepositories(username) {
//     console.log(`Fetching github repos for '${username}'...`);
//     return new Promise((resolve, reject) => {
//         setTimeout(() => {
//             resolve(["repo1", "repo2", "repo3"]);
//         }, 500);
//     });
// }

// function getCommits(repo) {
//     console.log(`Fetching commits for '${repo}'...`);
//     return new Promise((resolve, reject) => {
//         setTimeout(() => {
//             resolve(["commit1", "commit2", "commit3", "commit4"]);
//         }, 500);
//     });
// }

// function printCommits(commits) {
//     console.log(`Found ${commits.length} commits: ${commits}`);
// }

////////////////////////////////////////////////////////////////////////////////

// 4 - async / await

async function displayCommits() {
    // When a function uses await, it must be decorated with 'async'

    try {
        // Every time we call a function that returns a promise, we can await that function - to let the
        //  main thread do other things while waiting for the funciton to resolve/error
        const user = await getUser(1); // not really blocking, thread is released until promise resolves
        const repos = await getRepositories(user.gitHubUserName);
        const commits = await getCommits(repos[0]);
        printCommits(commits);
    }
    // use try catch with async/await: try = then, catch = catch
    catch (err) {
        console.log('Error', err);
    }
}

displayCommits();

function getUser(id) {
    console.log(`Searching db for user id ${id}...`);
    return new Promise((resolve, reject) => {
        setTimeout(() => {
            let user = { id: id, gitHubUserName: "mosh" };
            console.log("Found user: ", user);
            resolve(user);
        }, 1200);
    });
}

function getRepositories(username) {
    console.log(`Fetching github repos for '${username}'...`);
    return new Promise((resolve, reject) => {
        setTimeout(() => {
            let repos = ["repo1", "repo2", "repo3"];
            console.log("Found repos: ", repos);
            resolve(repos);
            // reject(new Error('Couldn\'t get repors'))
        }, 500);
    });
}

function getCommits(repo) {
    console.log(`Fetching commits for '${repo}'...`);
    return new Promise((resolve, reject) => {
        setTimeout(() => {
            let commits = ["commit1", "commit2", "commit3", "commit4"];
            console.log("Found commits: ", commits);
            resolve(commits);
        }, 500);
    });
}

function printCommits(commits) {
    console.log(`Found ${commits.length} commits: ${commits}`);
}
