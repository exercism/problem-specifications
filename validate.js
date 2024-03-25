const Ajv = require("ajv");
const fs = require("fs");

const schema = JSON.parse(fs.readFileSync("canonical-data.schema.json"));
// strict: false allows to use keywords that are not part
// of the JSON Schema specification
const validate = new Ajv({ strict: false }).compile(schema);

const exercises = process.argv.slice(2);

for (e of exercises) {
  const data = JSON.parse(fs.readFileSync(e));
  if (!validate(data)) {
    console.error(validate.errors);
    process.exit(1);
  }
}
