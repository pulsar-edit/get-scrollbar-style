const getScrollbarStyle = require('../index.js');

const POSSIBLE_VALUES = ['legacy'];
if (process.platform === 'darwin') {
  POSSIBLE_VALUES.push('overlay');
}

describe("get-scrollbar-style", function() {
  describe("getScrollbarStyle()", () => {
    it("returns the preferred scrollbar style", () => {
      let style = getScrollbarStyle();
      expect(POSSIBLE_VALUES.includes(style)).toBe(true);
    });
  });
});
