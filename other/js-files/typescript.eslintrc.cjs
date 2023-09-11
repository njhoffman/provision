/* eslint-env node */
// npm install --save-dev @typescript-eslint/parser @typescript-eslint/eslint-plugin eslint typescript
module.exports = {
  extends: ['eslint:recommended', 'plugin:@typescript-eslint/recommended'],
  parser: '@typescript-eslint/parser',
  plugins: ['@typescript-eslint'],
  root: true,
};
