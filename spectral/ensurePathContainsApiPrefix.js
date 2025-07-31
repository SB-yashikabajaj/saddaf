/**
 * Ensure that a path contains the api name as a prefix
 */
export default (input, options, context) => {
  if (!input) {
    return [{ message: 'input must not be empty' }];
  }
  if (typeof input !== 'string') {
    return [{ message: 'input must be a string' }];
  }

  const replaceRegex = new RegExp(options.match);
  const replaceValue = options.replace;
  const title = context.documentInventory.resolved.info.title.toLowerCase();

  const prefix = title.replace(replaceRegex, replaceValue);

  if (!input.startsWith('/' + prefix)) {
    return [{ message: `Expected ${input} to be /${prefix}${input}` }];
  }
};
