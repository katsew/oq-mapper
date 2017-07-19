#!/usr/bin/env node

const program = require("commander");
const version = require("../package.json").version;
const parser = require("../dist/oq-mapper-parser.js");
const fs = require("fs");
const util = require("util");

program
    .version(version)
    .option("-v, --verbose", "execute command with log outputs")
    .arguments("<file> <out>")
    .description("Map SQL query to JavaScript object")
    .action(function(file, out) {
        program.verbose && util.log("Input file: ", file);
        program.verbose && util.log("Reading input file...");

        let buff, query = null;
        try {
            buff = fs.readFileSync(file);
            query = buff.toString();
            if (program.verbose) {
                util.log("---------- show input query ----------")
                util.log(query);
                util.log("---------- // end of query ----------");
            }
        } catch (e) {
            console.error("Failed to read input file!", e.message);
            return;
        }

        const parsed = parser.parse(query);
        const content = JSON.stringify(parsed);
        if (program.verbose) {
            util.log("---------- show parsed query ----------")
            util.log(content);
            util.log("---------- // end of parsed ----------");
        }
        try {
            fs.writeFileSync(out, content);
        } catch (err) {
            console.error("Failed to execute command!", err.message);
            return;
        }
        util.log("Success!");
    })
    .parse(process.argv);

