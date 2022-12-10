const fs = require("fs");
csv = fs.readFileSync("notes/station-data.csv")

var array = csv.toString().split("\r");

let result = [];
let headers = array[0].split(",")


for (let i = 1; i < array.length - 1; i++) {
    let obj = {}
    let str = array[i]

    let properties = str.split(",")

    for (let j in headers) {
        if (properties[j]?.includes(",")) {
        obj[headers[j]] = properties[j]
            .split(",").map(item => item.trim())
        }
        else obj[headers[j]] = properties[j]
    }
result.push(obj)
}

var json = JSON.stringify(result);


fs.writeFileSync('output.json', json);
console.log(json)
